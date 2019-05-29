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
    public partial class DocenteHome : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Redireccionar(object sender, EventArgs e)
        {
            if (sender.Equals(CALENDARIO))
            {

            }
            else if (sender.Equals(AGENDA))
            {

            }
            else if (sender.Equals(CPASS))
            {
                Response.Redirect("CambioClave.aspx");
            }
            else if (sender.Equals(SALIR))
            {
                Response.Redirect("Login.aspx");
            }
        }


    }
}