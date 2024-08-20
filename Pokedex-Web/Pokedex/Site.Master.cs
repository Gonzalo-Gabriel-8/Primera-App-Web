using Accesorio;
using Dominio;
using System;
using System.Web.UI;
using Pokedex;
using System.Web.UI.WebControls;
using Pokedex.Views;
using Negocio;


namespace Pokedex
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            miAvatar.ImageUrl = "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=";
            if (!(Page is Loguin || Page is Registro || Page is Default || Page is Detalle || Page is Error)) //Si no es ninguna de estas tres paginas, Valida!!!
            {
                if (!Seguridad.SessionActiva(Session["trainee"]))
                {
                    Response.Redirect("../Vistas/Loguin.aspx", false);
                }
            }

            if (Seguridad.SessionActiva(Session["trainee"]))
            {
                TraineeNegocio negocio = new TraineeNegocio();
                string id = ((Trainee)Session["trainee"]).Id.ToString();
                Trainee user = (Trainee)negocio.ListarConId(id)[0];
                lblUser.Text = lblUser.Text = "Bienvenido<br/>" + user.Nombre;

                if (!string.IsNullOrEmpty(user.ImagenPerfil))
                {
                    miAvatar.ImageUrl = "~/Images/" + ((Trainee)Session["trainee"]).ImagenPerfil;

                }
            }
        }

    }
}