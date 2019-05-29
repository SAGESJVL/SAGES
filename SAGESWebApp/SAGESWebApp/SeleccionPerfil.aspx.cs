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
    public partial class SeleccionPerfil : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SeleccionarPerfil(object sender, ImageClickEventArgs e)
        {

            if (sender.Equals(ADMIN))
            {
                Response.Redirect("AdminHome.aspx");

            }
            else
            {
                Response.Redirect("DocenteHome.aspx");
            }

        }
        



    }
}