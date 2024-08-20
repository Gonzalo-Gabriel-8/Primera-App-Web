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
    public partial class Loguin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            Trainee trainee = new Trainee();
            TraineeNegocio negocio = new TraineeNegocio();
            try
            {
                if (!(Validacion.ValidaTextoVacio(txtEmail) || Validacion.ValidaTextoVacio(txtPass)))
                {
                    /*validacion de primer nivel*/
                    Session.Add("error", " debes completar ambos campos");
                    Response.Redirect("../Views/Error.aspx", false);
                }
                trainee.Email = txtEmail.Text;
                trainee.Pass = txtPass.Text;
                if (negocio.Login(trainee))
                {
                    Session.Add("trainee", trainee);
                    Response.Redirect("../Views/Default.aspx", false);
                }
                else
                {
                    Session.Add("error", "User o Pass incorrectos");
                    Response.Redirect("../Views/Error.aspx", false);
                }

            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("../Views/Error.aspx", false);
                Server.Transfer(".aspx");
            }
        }
    }
}