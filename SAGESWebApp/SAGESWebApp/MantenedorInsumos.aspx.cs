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

                GridInsumos.DataSource = dt;
                GridInsumos.DataBind();
                //this.Correo_Usuario.Text = dt.Rows[0]["correoElectronico"].ToString();
                //this.Nombre_Usuario.Text = dt.Rows[0]["nombre"].ToString();
                //this.Apellido_Usuario.Text = dt.Rows[0]["apellido"].ToString();

                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 1;
                //}
                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE-ADMINISTRADOR"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 2;
                //}
                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("ADMINISTRADOR"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 3;
                //}

                //if (dt.Rows[0]["estado"].ToString().Equals("ACTIVO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 1;
                //}
                //if (dt.Rows[0]["estado"].ToString().Equals("BLOQUEADO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 2;
                //}
                //if (dt.Rows[0]["estado"].ToString().Equals("DESHABILITADO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 3;
                //}

                //correoActual = dt.Rows[0]["correoElectronico"].ToString();
                //psw = dt.Rows[0]["clave"].ToString();

            }
        }

        protected void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void CreaInsumo_Click(object sender, EventArgs e)
        {

        }

        protected void idInsumo_TextChanged(object sender, EventArgs e)
        {

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
            if (sender.Equals("CREAR INSUMO"))
            {
                Opciones.ActiveViewIndex = 0;
            }
            if (sender.Equals("MODIFICAR INSUMO"))
            {
                Opciones.ActiveViewIndex = 1;
            }
            if (sender.Equals("MODIFICAR CANTIDAD"))
            {
                Opciones.ActiveViewIndex = 2;
            }

        }
    }
}