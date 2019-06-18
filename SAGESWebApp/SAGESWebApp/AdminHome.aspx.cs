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
            CALENDARIO.Enabled = false;
            SALAS.Enabled = false;
            REPORTES.Enabled = false;
            AGENDA.Enabled = false;
          
            try
            {
                sesion = Session["Usuario"].ToString();

                if (sesion != "")
                {
                    if (Session["tipoUsuario"].ToString() == "DOCENTE")
                    {

                        Messagebox("No tiene privilegios para ver este sitio. Será redireccionado al portal Docente.");                        
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
                Response.Redirect("MantenedorInsumos.aspx");
            }
            else if (sender.Equals(MAQUINARIA))
            {
                Response.Redirect("MantenedorRecursos.aspx");
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