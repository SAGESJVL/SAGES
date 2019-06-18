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
    public partial class MantenedorInsumos : System.Web.UI.Page
    {
        private string sesion = "";
        private string descripción="";
        private string tipo = "";
        private int cantidad;
        private string unidadMedida = "";
        private int id;
        private int res;
        private bool modifica = false;
        

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
                            llenarDropTipoInsumo();
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

        protected void CargarDatos()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerPorTipo", con);
            //SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerTodo", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@tipo", DropTipoInsumo.SelectedItem.ToString());

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count != 0)
            {                
                    GridInsumos.DataSource = dt;
                    GridInsumos.DataBind();                              
            }
        }

        protected void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void CreaInsumo_Click(object sender, EventArgs e)
        {
            if (crea_descripcion.Text == "" || crea_tipo.Text == "" || dropUnidadMedidaCrear.SelectedItem.ToString() == "" || crea_cantidad.Text == "")
            {
                Messagebox("Debe completar todos los campos.");
            }
            else
            {
                descripción = crea_descripcion.Text;
                tipo = crea_tipo.Text;
                unidadMedida = dropUnidadMedidaCrear.SelectedItem.ToString();
                cantidad = int.Parse(crea_cantidad.Text);


                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

                SqlDataAdapter da = new SqlDataAdapter("Insumo_Crear", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@descripcionInsumos", descripción);
                da.SelectCommand.Parameters.AddWithValue("@tipo", tipo);
                da.SelectCommand.Parameters.AddWithValue("@cantidad", cantidad);
                da.SelectCommand.Parameters.AddWithValue("@unidadMedida", unidadMedida);

                con.Open();

                res = da.SelectCommand.ExecuteNonQuery();

                con.Close();

                if (res == 1)
                {
                    Messagebox("El insumo ha sido creado exitosamente");
                    crea_descripcion.Text = "";
                    crea_tipo.Text = "";
                    dropUnidadMedidaCrear.SelectedIndex = 0;
                    Opciones.ActiveViewIndex = -1;
                    llenarDropTipoInsumo();
                    CargarDatos();
                }
                else
                {
                    Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");
                }
            }

        }     

        protected void DropTipoInsumo_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatos();
        }

        private void llenarDropTipoInsumo()
        {
            
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerTipo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.Fill(ds);

            DropTipoInsumo.DataSource = ds;
            DropTipoInsumo.DataTextField = "tipo";                            // FieldName of Table in DataBase
            DropTipoInsumo.DataValueField = "tipo";
            DropTipoInsumo.DataBind();
            
        }

        protected void GridInsumos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridInsumos.Rows[e.RowIndex];
            id = Convert.ToInt32(GridInsumos.DataKeys[e.RowIndex].Value.ToString());

            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
            SqlDataAdapter da = new SqlDataAdapter("Insumo_Eliminar", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;            
            da.SelectCommand.Parameters.AddWithValue("@idInsumo", id);

            con.Open();

            res = da.SelectCommand.ExecuteNonQuery();

            con.Close();

            if (res == 1)
            {
                Messagebox("El insumo ha sido eliminado exitosamente.");
                llenarDropTipoInsumo();
                CargarDatos();
            }
            else
            {
                Messagebox("Ocurrió un problema, intente nuevamente.");
                llenarDropTipoInsumo();
                CargarDatos();
            }           
        }
        protected void GridInsumos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridInsumos.EditIndex = e.NewEditIndex;
            CargarDatos();
        }
        protected void GridInsumos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            
            id = Convert.ToInt32(GridInsumos.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)GridInsumos.Rows[e.RowIndex];            
            //TextBox txtname=(TextBox)gr.cell[].control[];  
            TextBox desc = (TextBox)row.Cells[0].Controls[0];
            descripción = desc.Text;
            TextBox tipo_= (TextBox)row.Cells[1].Controls[0];
            tipo = tipo_.Text;
            TextBox cant = (TextBox)row.Cells[2].Controls[0];
            cantidad = int.Parse(cant.Text);
            TextBox uMedida = (TextBox)row.Cells[3].Controls[0];
            unidadMedida = uMedida.Text;

            if (desc.Text == "" || tipo_.Text == "" || cant.Text == "" || uMedida.Text == "")
            {
                Messagebox("Debe completar todos los campos.");
            }
            else
            {
                GridInsumos.EditIndex = -1;

                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
                SqlDataAdapter da = new SqlDataAdapter("Insumo_Modificar", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@descripcionInsumos", descripción);
                da.SelectCommand.Parameters.AddWithValue("@tipo", tipo);
                da.SelectCommand.Parameters.AddWithValue("@cantidad", cantidad);
                da.SelectCommand.Parameters.AddWithValue("@unidadMedida", unidadMedida);
                da.SelectCommand.Parameters.AddWithValue("@idInsumo", id);


                con.Open();

                res = da.SelectCommand.ExecuteNonQuery();

                con.Close();

                if (res == 1)
                {
                    Messagebox("El insumo ha sido modificado exitosamente.");
                    llenarDropTipoInsumo();
                    CargarDatos();
                }
                else
                {
                    Messagebox("Ocurrió un problema, intente nuevamente.");
                    llenarDropTipoInsumo();
                    CargarDatos();
                }
            }
        }
        protected void GridInsumos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridInsumos.PageIndex = e.NewPageIndex;
            CargarDatos();
        }
        protected void GridInsumos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridInsumos.EditIndex = -1;
            CargarDatos();
        }       

        protected void Crea_Click(object sender, EventArgs e)
        {
            Opciones.ActiveViewIndex = 0;
        }
    }
}