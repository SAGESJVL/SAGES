using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SAGESWebApp
{
    public partial class MantenedorReservas : System.Web.UI.Page
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

                        GridReservaUserPendiente.Visible = true;
                        GridReservaUserAceptada.Visible = true;
                        Opciones.Visible = true;
                        GridReservaAdmin.Visible = false;
                        labelReservaAdmin.Visible = false;
                    }
                    if (Session["tipoUsuario"].ToString() == "DOCENTE-ADMINISTRADOR" || Session["tipoUsuario"].ToString() == "ADMINISTRADOR")
                    {

                        GridReservaUserPendiente.Visible = true;
                        GridReservaUserAceptada.Visible = true;
                        Opciones.Visible = true;
                        GridReservaAdmin.Visible = true;
                        labelReservaAdmin.Visible = true;
                    }

                    else
                    {
                        if (!IsPostBack)
                        {
                            CargarDatosUserPendiente();
                            CargarDatosUserAprobadoRechazado();
                            CargarDatosGrillaAdmin();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Messagebox("Debe iniciar sesión para ver este sitio. Será redireccionado.");
                Response.Redirect("Login.aspx");
            }
        }
        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        private void CargarDatosGrillaAdmin()
        {
            throw new NotImplementedException();
        }

        private void CargarDatosUserAprobadoRechazado()
        {
            throw new NotImplementedException();
        }

        private void CargarDatosUserPendiente()
        {
            throw new NotImplementedException();
        }

        protected void GridReservaUserPendiente_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridReservaUserPendiente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridReservaUserPendiente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridReservaUserPendiente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridReservaAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridReservaUserAceptada_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridReservaAdmin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridReservaAdmin_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridReservaAdmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void CreaReserva_Click(object sender, EventArgs e)
        {
            Opciones.ActiveViewIndex = 0;
        }

        protected void SolicitarReserva_Click(object sender, EventArgs e)
        {

        }

        protected void DropEstadoReserva_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}