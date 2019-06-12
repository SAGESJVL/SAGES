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
                        CargarDatos();                        
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

            SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerTodo", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;           

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count != 0)
            {
                if (modifica == true)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["Id Insumo"].ToString().Equals(id.ToString()))
                        {
                            modifica_descripcion.Text = dt.Rows[i]["Descripcion"].ToString();
                            modifica_tipo.Text = dt.Rows[i]["Tipo"].ToString();
                            dropUnidadMedidaModificar.SelectedItem.Text = dt.Rows[i]["Unidad de Medida"].ToString();
                        }
                    }
                }
                else
                {
                    GridInsumos.DataSource = dt;
                    GridInsumos.DataBind();
                }                
            }
        }

        protected void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void CreaInsumo_Click(object sender, EventArgs e)
        {
            descripción = crea_descripcion.Text;
            tipo = crea_tipo.Text;
            unidadMedida = dropUnidadMedidaCrear.SelectedItem.ToString();
            cantidad = 0;
            

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
                CargarDatos();
            }
            else
            {
                Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");
            }

        }

        protected void idInsumo_TextChanged(object sender, EventArgs e)
        {
            id = int.Parse(idInsumo.Text);
            modifica = true;
            CargarDatos();
            modifica = false;

        }

        protected void ModificaInsumo_Click(object sender, EventArgs e)
        {

        }

        protected void ActualizaCantidad_Click(object sender, EventArgs e)
        {

        }

        protected void DropOpcionesView_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            sender.ToString();
            if (DropOpcionesView.SelectedIndex == 1)
            {
                Opciones.ActiveViewIndex = 0;
            }
            if (DropOpcionesView.SelectedIndex == 2)
            {
                Opciones.ActiveViewIndex = 1;
            }
            if (DropOpcionesView.SelectedIndex == 3)
            {
                Opciones.ActiveViewIndex = 2;
            }

        }
    }
}