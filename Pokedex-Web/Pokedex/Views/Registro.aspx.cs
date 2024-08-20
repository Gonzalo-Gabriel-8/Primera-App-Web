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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio traineeNegocio = new TraineeNegocio();                
                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;
                user.Nombre=txtNombre.Text;
                user.Apellido=txtApellido.Text;
                user.Id = traineeNegocio.InsertarNuevo(user);
                Session.Add("trainee", user);
                Response.Redirect("../Views/Default.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Views/Error.aspx", false);
            }
        }
    }
}