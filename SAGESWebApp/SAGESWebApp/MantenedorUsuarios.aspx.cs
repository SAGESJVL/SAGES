using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace SAGESWebApp
{
    public partial class MantenedorUsuarios : Page
    {
        private string sesion = "";
        private string rut = "";
        private string correoAcutal = "";
        private string correoNuevo = "";
        private string estado = "";
        private string psw = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                sesion = Session["Usuario"].ToString();

                if (sesion != "")
                {
                    if (Session["tipoUsuario"].ToString() == "DOCENTE")
                    {

                        //Messagebox("No tiene privilegios para ver este sitio. Será redireccionado al portal Docente.");
                        //this.Messagebox("No tiene privilegios para ver este sitio. Será redireccionado al portal Docente.");
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script type='text/javascript'>alert('alertmessage');</script>");
                        Response.Redirect("DocenteHome.aspx");
                    }
                }
            }
            catch
            {
                Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Response.Redirect("Login.aspx");
            }
        }

        protected void CrearUsuario(object sender, EventArgs e)
        {
           
        }

        protected void ModificarUsuario(object sender, EventArgs e)
        {

        }
       
        

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void Rut_Usuario_TextChanged(object sender, EventArgs e)
        {
            rut = Rut_Usuario.Text;

           
                rut = rut.Replace(".", "").ToUpper();
                if (!rut.Contains("-"))
                {
                rut = rut.Split(rut.Length - 1);
                }
                Regex expresion = new Regex("^([0-9]+-[0-9K])$");
                string dv = rut.Substring(rut.Length - 1, 1);
                if (!expresion.IsMatch(rut))
                {
                    Messagebox("El RUT ingresado no tiene formato válido");
                
                }
                char[] charCorte = { '-' };
                string[] rutTemp = rut.Split(charCorte);
                if(dv != Digito(int.Parse(rutTemp[0])))
                {
                Messagebox("El RUT ingresado no es válido");
                this.Correo_Usuario.Text = "";
                this.Nombre_Usuario.Text = "";
                this.Apellido_Usuario.Text = "";
                this.Perfil_Usuario.SelectedIndex = 0;

            }
                else
                {
                    BuscarRegistro(rut);
                }          
                 

            
        }

        public static string Digito(int rut)
        {
            int suma = 0;
            int multiplicador = 1;
            while (rut != 0)
            {
                multiplicador++;
                if (multiplicador == 8)
                    multiplicador = 2;
                suma += (rut % 10) * multiplicador;
                rut = rut / 10;
            }
            suma = 11 - (suma % 11);
            if (suma == 11)
            {
                return "0";
            }
            else if (suma == 10)
            {
                return "K";
            }
            else
            {
                return suma.ToString();
            }
        }

        protected void BuscarRegistro(string rut)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Usuario_Existe", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@rut", rut);

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 0)
            {
                this.existeUsuario.Text = "No existen registros con el RUT ingresado. Para crear uno nuevo, complete los datos a continuación:";
                ModificaUsuario.Enabled = false;
            }
            else
            {
                this.Correo_Usuario.Text = dt.Rows[0]["correoElectronico"].ToString();
                this.Nombre_Usuario.Text = dt.Rows[0]["nombre"].ToString();
                this.Apellido_Usuario.Text = dt.Rows[0]["apellido"].ToString();

                if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE"))
                {
                    this.Perfil_Usuario.SelectedIndex = 1;
                }
                if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE-ADMINISTRADOR"))
                {
                    this.Perfil_Usuario.SelectedIndex = 2;
                }
                if (dt.Rows[0]["tipoPerfil"].ToString().Equals("ADMINISTRADOR"))
                {
                    this.Perfil_Usuario.SelectedIndex = 3;
                }
               
                this.CreaUsuario.Enabled = false;
                    
            }
        }

        
    }
}