using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAGESWebApp
{
    public partial class _Default : Page
    {
        private string user = "";
        private string pass = "";
        private string tipoLogin = "";
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




        }
    }
}