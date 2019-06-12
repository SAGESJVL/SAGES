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
    public partial class SeleccionPerfil : System.Web.UI.Page
    {
        private string sesion = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                sesion = Session["Usuario"].ToString();
                if (Session["tipoUsuario"].ToString() == "DOCENTE")
                {

                    Messagebox("No tiene privilegios para ver este sitio. Será redireccionado al portal Docente.");
                    Response.Redirect("DocenteHome.aspx");
                }
            }
            catch
            {
                Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Response.Redirect("Login.aspx");
            }

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

        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }
    }
}