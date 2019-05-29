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
    public partial class AdminHome : Page
    {
        private string sesion = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"].ToString().Equals(""))
            {
                Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Response.Redirect("Login.aspx");
            }       


        }

        protected void Redireccionar(object sender, EventArgs e)
        {
            if (sender.Equals(CALENDARIO))
            {

            }
            else if (sender.Equals(USUARIOS))
            {
                Response.Redirect("MantenedorUsuarios.aspx");
            }
            else if (sender.Equals(SALAS))
            {

            }
            else if (sender.Equals(REPORTES))
            {

            }
            else if (sender.Equals(AGENDA))
            {

            }
            else if (sender.Equals(INSUMOS))
            {

            }
            else if (sender.Equals(MAQUINARIA))
            {

            }
            else if (sender.Equals(CPASS))
            {
                Response.Redirect("CambioClave.aspx");
            }
            else if (sender.Equals(SALIR))
            {
                Session.Abandon();
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
        }

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }


    }
}