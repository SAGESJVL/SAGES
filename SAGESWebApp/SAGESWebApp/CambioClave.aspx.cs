using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SAGESWebApp
{
    public partial class CambioClave : Page
    {
        private string user = "";
        private string pass = "";
        private string tipoUsuario = "";
        private string tipoLogin = "";
        private int res;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ValidarContraseña(object sender, EventArgs e)
        {            
            if (PassNueva.Text.Equals("") || PassNueva2.Text.Equals("") || PassActual.Text.Equals(""))
            {
                Response.Write("Debe completar todos los campos.");
            }
            else
            {
                if (PassNueva.Text.Equals(PassNueva2.Text))
                {
                    user = Session["Usuario"].ToString();
                    pass = Session["Pass"].ToString();
                    tipoUsuario = Session["TipoUsuario"].ToString();

                    if (user.Contains("@inacap"))
                    {
                        tipoLogin = "correo";
                    }
                    else
                    {
                        tipoLogin = "rut";
                    }

                    if (PassActual.Text.Equals(pass))
                    {
                        SqlConnection con = new SqlConnection
                        (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

                        SqlDataAdapter da = new SqlDataAdapter("Usuario_Cambia_Contraseña", con);
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.SelectCommand.Parameters.AddWithValue("@cuenta", user);
                        da.SelectCommand.Parameters.AddWithValue("@passNueva", PassNueva.Text);
                        da.SelectCommand.Parameters.AddWithValue("@tipoAcceso", tipoLogin);

                        con.Open();

                        res = da.SelectCommand.ExecuteNonQuery();

                        con.Close();

                        if (res == 1)
                        {
                            //La contraseña ha sido guardada
                        }
                        else
                        {
                            //Ocurrió un problema durante la operación. Intente nuevamente.
                        }
                    }
                    else
                    { //la contraseña actual no coincide con los registros.
                    }
                }
                else
                {
                    Response.Write("Las contraseñas no coinciden. Intente nuevamente.");
                    PassNueva.Text = "";
                    PassNueva2.Text = "";
                }
            }
            
        }
    }
}