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
    public partial class _Default : Page
    {
        private string user = "";
        private string pass = "";
        private string tipoLogin = "";
        private DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            user = Login.UserName;
            pass = Login.Password;
            if (user.Contains("@inacap"))
            {
                tipoLogin = "correo";
            }
            else
            {
                tipoLogin = "rut";
            }
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Usuario_Login", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@cuenta", user);
            da.SelectCommand.Parameters.AddWithValue("@pass", pass);
            da.SelectCommand.Parameters.AddWithValue("@tipoAcceso", tipoLogin);
            
            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                Login.UserNameLabelText = "";
                Login.PasswordLabelText = "";
                            }
            else
            {
                if (dt.Rows[0]["tipoPerfil"].Equals("ADMINISTRADOR"))
                {
                    Response.Redirect("AdminHome.aspx");
                }
                if (dt.Rows[0]["tipoPerfil"].Equals("DOCENTE-ADMINISTRADOR"))
                {
                    Response.Redirect("SeleccionPerfil.aspx");
                }
                if (dt.Rows[0]["tipoPerfil"].Equals("DOCENTE"))
                {
                    Response.Redirect("DocenteHome.aspx");
                }
            }
          
        }
    }
}