using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Text;
using System.Net.Mail;

namespace SAGESWebApp
{
    public partial class MantenedorRecursos : System.Web.UI.Page
    {
        private string sesion = "";
        private string descripcion = "";
        private string tipo = "";
        private int cantidad;
        private string marca = "";
        private int res;
        private int id;
        private DropDownList DropDownList1;
        private DropDownList DropDownList2;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                sesion = Session["Usuario"].ToString();

                if (sesion != "")
                {
                    if (Session["tipoUsuario"].ToString().Equals("DOCENTE"))
                    {
                        Messagebox("No tiene privilegios para acceder a este sitio. Será redireccionado al portal Docente.");
                        Response.Redirect("DocenteHome.aspx");
                    }
                    else
                    {
                        if (!IsPostBack)
                        {
                            llenarDropTipoRecurso();
                            CargarDatos();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Response.Redirect("Login.aspx");
            }

        }

        private void CargarDatos()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Recursos_TraerTodo", con);
            //SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerTodo", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@descripcionRecurso", DropTipoRecurso.SelectedItem.ToString());

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count != 0)
            {
                GridRecursos.DataSource = dt;
                GridRecursos.DataBind();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DropDownList1 = GridRecursos.Rows[i].FindControl("DropTipoRecursoGrid") as DropDownList;
                    DropDownList1.SelectedValue = dt.Rows[i]["Tipo"].ToString();   
                }
            }
        }

        private void llenarDropTipoRecurso()
        {
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("Recursos_TraerTipo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.Fill(ds);

            DropTipoRecurso.DataSource = ds;
            DropTipoRecurso.DataTextField = "Tipo";                            // FieldName of Table in DataBase
            DropTipoRecurso.DataValueField = "Tipo";
            DropTipoRecurso.DataBind();


            dropTipoCrear.DataSource = ds;
            dropTipoCrear.DataTextField = "Tipo";                            // FieldName of Table in DataBase
            dropTipoCrear.DataValueField = "Tipo";
            dropTipoCrear.DataBind();
        }
    

        protected void GridRecursos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridRecursos.PageIndex = e.NewPageIndex;
            CargarDatos();
        }

        protected void GridRecursos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridRecursos.EditIndex = -1;
            CargarDatos();
        }

        protected void GridRecursos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridRecursos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridRecursos.EditIndex = e.NewEditIndex;
            CargarDatos();
        }

        protected void GridRecursos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            descripcion = GridRecursos.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = (GridViewRow)GridRecursos.Rows[e.RowIndex];
            //TextBox txtname=(TextBox)gr.cell[].control[];  

            //TextBox desc = (TextBox)row.Cells[0].Controls[0];
            //descripción = desc.Text;
            string tipo_ = (GridRecursos.Rows[e.RowIndex].FindControl("DropTipoRecursoGrid") as DropDownList).SelectedItem.Value;
            tipo = tipo_;
            TextBox cant = (TextBox)row.Cells[2].Controls[0];
            cantidad = int.Parse(cant.Text);
            TextBox marc = (TextBox)row.Cells[3].Controls[0];
            marca = marc.Text;

            if (descripcion == "" || tipo_ == "" || cant.Text == "" || marc.Text == "")
            {
                Messagebox("Debe completar todos los campos.");
            }
            else
            {
                GridRecursos.EditIndex = -1;

                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
                SqlDataAdapter da = new SqlDataAdapter("Recursos_Modificar", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@descripcionRecurso", descripcion);
                da.SelectCommand.Parameters.AddWithValue("@marca", marca);
                da.SelectCommand.Parameters.AddWithValue("@cantidad", cantidad);
                da.SelectCommand.Parameters.AddWithValue("@tipo", tipo);
                


                con.Open();

                res = da.SelectCommand.ExecuteNonQuery();

                con.Close();

                if (res == 1)
                {
                    Messagebox("El insumo ha sido modificado exitosamente.");
                    llenarDropTipoRecurso();
                    CargarDatos();
                }
                else
                {
                    Messagebox("Ocurrió un problema, intente nuevamente.");
                    llenarDropTipoRecurso();
                    CargarDatos();
                }
            }
        }

        protected void Crea_Click(object sender, EventArgs e)
        {
            Opciones.ActiveViewIndex = 0;
        }

        protected void CreaRecurso_Click(object sender, EventArgs e)
        {
            if (crea_descripcion.Text == "" || dropTipoCrear.SelectedItem.ToString() == "" || crea_marca.Text == "" || crea_cantidad.Text == "")
            {
                Messagebox("Debe completar todos los campos.");
            }
            else
            {
                descripcion = crea_descripcion.Text;
                tipo = dropTipoCrear.SelectedItem.ToString();
                marca = crea_marca.Text;
                cantidad = int.Parse(crea_cantidad.Text);


                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

                SqlDataAdapter da = new SqlDataAdapter("Recursos_Ingresar", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@descripcionRecurso", descripcion);
                da.SelectCommand.Parameters.AddWithValue("@tipo", tipo);
                da.SelectCommand.Parameters.AddWithValue("@cantidad", cantidad);
                da.SelectCommand.Parameters.AddWithValue("@marca", marca);

                con.Open();

                res = da.SelectCommand.ExecuteNonQuery();

                con.Close();

                if (res == 1)
                {
                    Messagebox("El recurso ha sido creado exitosamente");
                    crea_descripcion.Text = "";
                    crea_marca.Text = "";
                    dropTipoCrear.SelectedIndex = 0;
                    Opciones.ActiveViewIndex = -1;
                    crea_cantidad.Text = "";
                    llenarDropTipoRecurso();
                    CargarDatos();
                }
                else
                {
                    Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");
                }
            }

        }

    protected void Messagebox(string xMessage)
    {
        Response.Write("<script>alert('" + xMessage + "')</script>");
    }

        protected void DropTipoRecurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatos();
        }

        protected void GridRecursos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
                con.Open();

                DropDownList1 = (e.Row.FindControl("DropTipoRecursoGrid") as DropDownList);
                
                DataSet ds2 = new DataSet();
                SqlDataAdapter da2 = new SqlDataAdapter("Recursos_TraerTipo", con);
                da2.SelectCommand.CommandType = CommandType.StoredProcedure;
                da2.Fill(ds2);

                DropDownList1.DataSource = ds2;
                DropDownList1.DataTextField = "Tipo";                            // FieldName of Table in DataBase
                DropDownList1.DataValueField = "Tipo";
                DropDownList1.Enabled = false;
                DropDownList1.DataBind();      

            }
        }
    }
}