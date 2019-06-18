using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Text;
using System.Net.Mail;

namespace SAGESWebApp
{
    public partial class MantenedorUsuarios : System.Web.UI.Page
    {
        private string sesion = "";
        private string rut = "";
        private string rutActual = "";
        private string nombre = "";
        private string apellido = "";
        private string correoActual = "";
        private string correoNuevo = "";
        private string tipoPerfil = "";
        private string estado = "";
        private string psw = "";
        private int res;
        private string existe = "noaun";
        private DropDownList DropDownList1;
        private DropDownList DropDownList2;
        private bool editando = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            //CreaUsuario.Visible = false;
            //ModificaUsuario.Visible = false;
            Rut_Usuario.Enabled = true;
            Nombre_Usuario.Enabled = false;
            Apellido_Usuario.Enabled = false;
            Correo_Usuario.Enabled = false;
            Perfil_Usuario.Enabled = false;
            //Estado_Usuario.Enabled = false;

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

                    else
                    {
                        if (!IsPostBack)
                        {
                            llenarDropTipoUsuario();
                            CargarDatos();
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

        protected void CreaUsuario_Click(object sender, EventArgs e)
        //protected void CreaUsuario_Click(String click)
        {
            if (sender.Equals(CreaUsuario))
            {
                //if (Rut_Usuario.Text != "" && Nombre_Usuario.Text != "" && Apellido_Usuario.Text != "" && Correo_Usuario.Text != "" && Perfil_Usuario.SelectedIndex != 0)
                //{
                //    existe = "no";
                //}
                //if (existe == "no")
                //{
                if (Rut_Usuario.Text == "" || Nombre_Usuario.Text == "" || Apellido_Usuario.Text == "" || Correo_Usuario.Text == "" || Perfil_Usuario.SelectedIndex == 0)
                {
                    Messagebox("Debe completar todos los campos.");
                }
                else
                {
                    rut = Rut_Usuario.Text;
                    nombre = Nombre_Usuario.Text;
                    apellido = Apellido_Usuario.Text;
                    correoActual = Correo_Usuario.Text;
                    tipoPerfil = Perfil_Usuario.SelectedItem.ToString();
                    psw = CrearPassword(10);

                    DataTable dt = new DataTable();
                    SqlConnection con = new SqlConnection
                    (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

                    SqlDataAdapter da = new SqlDataAdapter("Usuario_Crear", con);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.AddWithValue("@rut", rut);
                    da.SelectCommand.Parameters.AddWithValue("@nombre", nombre);
                    da.SelectCommand.Parameters.AddWithValue("@apellido", apellido);
                    da.SelectCommand.Parameters.AddWithValue("@correo", correoActual);
                    da.SelectCommand.Parameters.AddWithValue("@tipoPerfil", tipoPerfil);
                    da.SelectCommand.Parameters.AddWithValue("@clave", psw);

                    con.Open();

                    res = da.SelectCommand.ExecuteNonQuery();

                    con.Close();

                    if (res == 1)
                    {
                        Messagebox("El usuario ha sido creado exitosamente");
                        //SendMail(correoActual, "sages.dlab@gmail.com", "", "Nuevo usuario DLab", "Su contraseña es" + psw);
                        Rut_Usuario.Text = "";
                        Nombre_Usuario.Text = "";
                        Apellido_Usuario.Text = "";
                        Correo_Usuario.Text = "";
                        Perfil_Usuario.SelectedIndex = 0;
                        //Estado_Usuario.SelectedIndex = 0;
                        Opciones.ActiveViewIndex = -1;
                        CargarDatos();
                    }
                    else
                    {
                        Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");
                    }
                }
            }
            //}
        }

        //protected void ModificaUsuario_Click(object sender, EventArgs e)     
        //{

        //        if (Rut_Usuario.Text == "" || Nombre_Usuario.Text == "" || Apellido_Usuario.Text == "" || Correo_Usuario.Text == "" || Perfil_Usuario.SelectedIndex == 0 || Estado_Usuario.SelectedIndex == 0)
        //        {
        //            Messagebox("Debe completar todos los campos.");
        //        }
        //        else
        //        {
        //            rut = Rut_Usuario.Text;
        //            nombre = Nombre_Usuario.Text;
        //            apellido = Apellido_Usuario.Text;
        //            correoNuevo = Correo_Usuario.Text;
        //            tipoPerfil = Perfil_Usuario.SelectedItem.ToString();
        //            estado = Estado_Usuario.SelectedItem.ToString();
        //            sesion = Session["UsuarioRut"].ToString();

        //            DataTable dt = new DataTable();
        //            SqlConnection con = new SqlConnection
        //            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

        //            SqlDataAdapter da = new SqlDataAdapter("Usuario_Modificar", con);
        //            da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //            da.SelectCommand.Parameters.AddWithValue("@rut", rut);
        //            da.SelectCommand.Parameters.AddWithValue("@nombre", nombre);
        //            da.SelectCommand.Parameters.AddWithValue("@apellido", apellido);
        //            da.SelectCommand.Parameters.AddWithValue("@correoActual", correoActual);
        //            da.SelectCommand.Parameters.AddWithValue("@correoNuevo", correoNuevo);
        //            da.SelectCommand.Parameters.AddWithValue("@clave", psw);
        //            da.SelectCommand.Parameters.AddWithValue("@estado", estado);
        //            da.SelectCommand.Parameters.AddWithValue("@tipoPerfil", tipoPerfil);
        //            da.SelectCommand.Parameters.AddWithValue("@usuarioModificacion", sesion);


        //            con.Open();

        //            res = da.SelectCommand.ExecuteNonQuery();

        //            con.Close();

        //            if (res == 1)
        //            {
        //                Messagebox("El usuario ha sido modificado exitosamente.");

        //            }
        //            else
        //            {
        //                Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");

        //        }
        //        }

        //}



        public void Messagebox(string xMessage)
        {
            Response.Write("<script>alert('" + xMessage + "')</script>");
        }

        protected void Rut_Usuario_TextChanged(object sender, EventArgs e)
        {
            rut = Rut_Usuario.Text;


            rut = rut.Replace(".", "").ToUpper();
            //if (!rut.Contains("-"))
            //{
            //rut = rut.Split(rut.Length - 1);
            //}
            Regex expresion = new Regex("^([0-9]+-[0-9K])$");
            string dv = rut.Substring(rut.Length - 1, 1);
            if (!expresion.IsMatch(rut))
            {
                Messagebox("El RUT ingresado no tiene formato válido");

            }
            char[] charCorte = { '-' };
            string[] rutTemp = rut.Split(charCorte);
            if (dv != Digito(int.Parse(rutTemp[0])))
            {
                Messagebox("El RUT ingresado no es válido");
                this.Correo_Usuario.Text = "";
                this.Nombre_Usuario.Text = "";
                this.Apellido_Usuario.Text = "";
                this.Perfil_Usuario.SelectedIndex = 0;

            }
            else
            {
                //BuscarRegistro(rut);
            }



        }

        public static string Digito(int rut)
        {
            int suma = 0;
            int multiplicador = 1;
            while (rut != 0)
            {
                multiplicador++;
                if (multiplicador == 8)
                    multiplicador = 2;
                suma += (rut % 10) * multiplicador;
                rut = rut / 10;
            }
            suma = 11 - (suma % 11);
            if (suma == 11)
            {
                return "0";
            }
            else if (suma == 10)
            {
                return "K";
            }
            else
            {
                return suma.ToString();
            }
        }

        protected void BuscarRegistro(string rut)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Usuario_Existe", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@rut", rut);

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 0)
            {
                this.existeUsuario.Text = "No existen registros con el RUT ingresado. Para crear uno nuevo, complete los datos a continuación:";
                //existe = "no";

                //Estado_Usuario.SelectedIndex = 0;
                Correo_Usuario.Text = "";
                Nombre_Usuario.Text = "";
                Apellido_Usuario.Text = "";
                Perfil_Usuario.Enabled = true;
                //Estado_Usuario.Enabled = false;
                Rut_Usuario.Enabled = false;
                Correo_Usuario.Enabled = true;
                Nombre_Usuario.Enabled = true;
                Apellido_Usuario.Enabled = true;
            }
            else
            {

                this.existeUsuario.Text = "Ya existe un registro con el rut ingresado. Para modificarlo, ubíquelo en la grilla superior.";
                //this.Correo_Usuario.Text = dt.Rows[0]["correoElectronico"].ToString();
                //this.Nombre_Usuario.Text = dt.Rows[0]["nombre"].ToString();
                //this.Apellido_Usuario.Text = dt.Rows[0]["apellido"].ToString();

                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 1;
                //}
                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("DOCENTE-ADMINISTRADOR"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 2;
                //}
                //if (dt.Rows[0]["tipoPerfil"].ToString().Equals("ADMINISTRADOR"))
                //{
                //    this.Perfil_Usuario.SelectedIndex = 3;
                //}

                //if (dt.Rows[0]["estado"].ToString().Equals("ACTIVO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 1;
                //}
                //if (dt.Rows[0]["estado"].ToString().Equals("BLOQUEADO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 2;
                //}
                //if (dt.Rows[0]["estado"].ToString().Equals("DESHABILITADO"))
                //{
                //    this.Estado_Usuario.SelectedIndex = 3;
                //}

                //correoActual = dt.Rows[0]["correoElectronico"].ToString();
                //psw = dt.Rows[0]["clave"].ToString();

                Rut_Usuario.Enabled = false;
                //Estado_Usuario.Enabled = true;
                Nombre_Usuario.Enabled = false;
                Correo_Usuario.Enabled = false;
                Apellido_Usuario.Enabled = false;
                Perfil_Usuario.Enabled = false;
            }
        }

        public string CrearPassword(int longitud)
        {
            string caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < longitud--)
            {
                res.Append(caracteres[rnd.Next(caracteres.Length)]);
            }
            return res.ToString();
        }

        //public string SendMail(string toList, string from, string ccList, string subject, string body)
        //{

        //    MailMessage message = new MailMessage();
        //    SmtpClient smtpClient = new SmtpClient();
        //    string msg = string.Empty;
        //    try
        //    {
        //        MailAddress fromAddress = new MailAddress(from);
        //        message.From = fromAddress;
        //        message.To.Add(toList);
        //        if (ccList != null && ccList != string.Empty)
        //            message.CC.Add(ccList);
        //        message.Subject = subject;
        //        message.IsBodyHtml = true;
        //        message.Body = body;
        //        smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
        //        smtpClient.Port = 587;
        //        smtpClient.EnableSsl = true;
        //        smtpClient.UseDefaultCredentials = true;
        //        smtpClient.Credentials = new System.Net.NetworkCredential("sages.dlab@gmail.com", "SagesJvl2019");

        //        smtpClient.Send(message);
        //        msg = "Successful<BR>";
        //    }
        //    catch (Exception ex)
        //    {
        //        msg = ex.Message;
        //    }
        //    return msg;
        //}

        protected void DropTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDatos();
        }

        private void llenarDropTipoUsuario()
        {

            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("Usuario_TraerTipo", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.Fill(ds);

            DropTipoUsuario.DataSource = ds;
            DropTipoUsuario.DataTextField = "tipoPerfil";                            // FieldName of Table in DataBase
            DropTipoUsuario.DataValueField = "tipoPerfil";
            DropTipoUsuario.DataBind();

        }

        protected void CargarDatos()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection
            (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

            SqlDataAdapter da = new SqlDataAdapter("Usuario_TraerPorTipo", con);
            //SqlDataAdapter da = new SqlDataAdapter("Insumo_TraerTodo", con);
            //SqlCommand cmd = new SqlCommand("Usuario_Login",con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@tipoPerfil", DropTipoUsuario.SelectedItem.ToString());

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count != 0)
            {
                GridUsuarios.DataSource = dt;
                GridUsuarios.DataBind();

                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    DropDownList1 = GridUsuarios.Rows[i].FindControl("DropTipoUsuarioGrid") as DropDownList;
                    DropDownList2 = GridUsuarios.Rows[i].FindControl("DropEstadoUsuario") as DropDownList;
                    DropDownList1.SelectedValue = dt.Rows[i]["tipoPerfil"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[i]["estado"].ToString();
                }
            }           
        }

        protected void GridUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            rut = GridUsuarios.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = (GridViewRow)GridUsuarios.Rows[e.RowIndex];

            TextBox nom = (TextBox)row.Cells[1].Controls[0];
            nombre = nom.Text;
            TextBox ape = (TextBox)row.Cells[2].Controls[0];
            apellido = ape.Text;
            TextBox correo = (TextBox)row.Cells[3].Controls[0];
            correoNuevo = correo.Text;
            string est = (GridUsuarios.Rows[e.RowIndex].FindControl("DropEstadoUsuario") as DropDownList).SelectedItem.Value;
            estado = est;
            string perfil = (GridUsuarios.Rows[e.RowIndex].FindControl("DropTipoUsuarioGrid") as DropDownList).SelectedItem.Value;
            tipoPerfil = perfil;

            if (nombre == "" || apellido == "" || correoNuevo == "" || estado == "" || tipoPerfil == "")
            {
                Messagebox("Debe completar todos los campos.");
            }
            else
            {
                //rut = Rut_Usuario.Text;
                //nombre = Nombre_Usuario.Text;
                //apellido = Apellido_Usuario.Text;
                //correoNuevo = Correo_Usuario.Text;
                //tipoPerfil = Perfil_Usuario.SelectedItem.ToString();
                ////estado = Estado_Usuario.SelectedItem.ToString();
                sesion = Session["UsuarioRut"].ToString();

                DataTable dt = new DataTable();
                SqlConnection con = new SqlConnection
                (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());

                SqlDataAdapter da = new SqlDataAdapter("Usuario_Modificar", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@rut", rut);
                da.SelectCommand.Parameters.AddWithValue("@nombre", nombre);
                da.SelectCommand.Parameters.AddWithValue("@apellido", apellido);
                //da.SelectCommand.Parameters.AddWithValue("@correoActual", correoActual);
                da.SelectCommand.Parameters.AddWithValue("@correoNuevo", correoNuevo);
                //da.SelectCommand.Parameters.AddWithValue("@clave", psw);
                da.SelectCommand.Parameters.AddWithValue("@estado", estado);
                da.SelectCommand.Parameters.AddWithValue("@tipoPerfil", tipoPerfil);
                da.SelectCommand.Parameters.AddWithValue("@usuarioModificacion", sesion);


                con.Open();

                res = da.SelectCommand.ExecuteNonQuery();

                con.Close();

                if (res == 1)
                {
                    Messagebox("El usuario ha sido modificado exitosamente.");
                    CargarDatos();                    
            }
                else
                {
                    Messagebox("Ocurrió un problema durante el proceso, por favor intente nuevamente.");
                    CargarDatos();                    
            }
            DropDownList1.Enabled = false;
            DropDownList2.Enabled = false;
            GridUsuarios.EditIndex = -1;
            }

        }

        protected void GridUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridUsuarios.EditIndex = e.NewEditIndex;            
            CargarDatos();
            DropDownList1.Enabled = true;
            DropDownList2.Enabled = true;
        }

        protected void GridUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridUsuarios.EditIndex = -1;            
            CargarDatos();
        }

        protected void GridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridUsuarios.PageIndex = e.NewPageIndex;
            CargarDatos();           
        }

        protected void Crea_Click(object sender, EventArgs e)
        {
            Opciones.ActiveViewIndex = 0;
        }

        protected void GridUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    SqlConnection con = new SqlConnection
                    (System.Configuration.ConfigurationManager.ConnectionStrings["SAGES"].ToString());
                    con.Open();

                    DropDownList1 = (e.Row.FindControl("DropTipoUsuarioGrid") as DropDownList);
                    DropDownList2 = (e.Row.FindControl("DropEstadoUsuario") as DropDownList);

                    DataSet ds2 = new DataSet();
                    SqlDataAdapter da2 = new SqlDataAdapter("Perfil_TraerTodo", con);
                    da2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da2.Fill(ds2);

                    DropDownList1.DataSource = ds2;
                    DropDownList1.DataTextField = "tipoPerfil";                            // FieldName of Table in DataBase
                    DropDownList1.DataValueField = "tipoPerfil";
                    DropDownList1.Enabled = false;
                    DropDownList1.DataBind();

                    DataSet ds3 = new DataSet();
                    SqlDataAdapter da3 = new SqlDataAdapter("Estado_TraerTodo", con);
                    da3.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da3.Fill(ds3);

                    DropDownList2.DataSource = ds3;
                    DropDownList2.DataTextField = "descripcionEstado";                            // FieldName of Table in DataBase
                    DropDownList2.DataValueField = "descripcionEstado";
                    DropDownList2.Enabled = false;
                    DropDownList2.DataBind();
                }
            
        }

        protected void GridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        //public bool Send()
        //{
        //    try
        //    {
        //        MailMessage mail = new MailMessage();
        //        mail.IsBodyHtml = true;
        //        mail.From = new MailAddress("laura.pendola@inacapmail.cl", "SAGES - DLab");
        //        mail.To.Add(new MailAddress(correoActual, nombre +  apellido));
        //        mail.Subject = "Su contraseña para SAGES - DLab";
        //        mail.Body = "<h1>Su contraseña<h1><br/><h1>Recuerde cambiar su contraseña luego de iniciar sesión la primera vez.</h1>";

        //        using (SmtpClient smtp = new SmtpClient())
        //        {
        //            smtp.Host = "smtp.gmail.com";
        //            smtp.Port = 587;
        //            smtp.EnableSsl = true;
        //            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        //            NetworkCred.UserName = "sages.dlab@gmail.com";
        //            NetworkCred.Password = "SagesJvl2019";
        //            smtp.UseDefaultCredentials = true;
        //            smtp.Credentials = NetworkCred;
        //            smtp.Send(mail);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }

        //    return true;
        //}
    }
}