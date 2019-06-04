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
    public partial class AdminHome : System.Web.UI.Page
    {
        private string sesion = "";

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
            catch (Exception ex)
            {
                this.Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script type='text/javascript'>alert('alertmessage');</script>");
                Response.Redirect("Login.aspx", true);
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
            //Response.Write("<script>alert('" + xMessage + "')</script>");
            //Response.Write("<script type='text/javascript' Language='vajascript'>alert(xMessage)</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert",
            "<script type='text/javascript'>alert(xMessage);</script>");
        }
    }
}