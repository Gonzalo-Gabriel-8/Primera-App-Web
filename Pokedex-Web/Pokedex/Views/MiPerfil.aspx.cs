using Accesorio;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pokedex.Views
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                TraineeNegocio negocio = new TraineeNegocio();
                string Id = ((Trainee)Session["trainee"]).Id.ToString();
                Trainee trainee = (Trainee)negocio.ListarConId(Id)[0];
                txtEmail.Enabled = false;
                txtApellido.Text = trainee.Apellido;
                txtNombre.Text = trainee.Nombre;
                txtFechaNaciemiento.Text = trainee.FechaNacimiento.ToString("yyyy-MM-dd");
                if (!string.IsNullOrEmpty(trainee.ImagenPerfil))
                {
                    imgNuevoPerfil.ImageUrl = "~/Images/" + trainee.ImagenPerfil;
                }
                else
                    imgNuevoPerfil.ImageUrl = "https://epichotelsanluis.com/wp-content/uploads/2022/11/placeholder-2.png";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                {
                    return;
                }

                TraineeNegocio negocio = new TraineeNegocio();
                Trainee user = (Trainee)Session["trainee"];
                //escribir img
                if (txtImagen.PostedFile.FileName != null)
                {
                    string ruta = Server.MapPath("~/Images/"); //en la variable queda guardada la ruta en la que yo voy a trabajar 
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";   //para guardar la imagen

                }
                if (!Validacion.ValidaTextoVacio(txtNombre.Text) || Validacion.ValidaTextoVacio(txtApellido.Text))
                {
                    user.Nombre = txtNombre.Text;
                    user.Apellido = txtApellido.Text;
                }


                user.FechaNacimiento = DateTime.Parse(txtFechaNaciemiento.Text);

                negocio.Actualizar(user);
                Response.Redirect("../Views/Default.aspx", false);
                //leer img ~
                Image img = (Image)Master.FindControl("miAvatar");
                img.ImageUrl = "~/Images/" + user.ImagenPerfil;



            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Views/Error.aspx", false);
            }
        }
        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Views/Default.aspx", false);
        }
    }
}