using AgendaContactosWeb.Services;
using System;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaContactosWeb.Views
{
    public partial class Contactos : Page
    {
        private readonly ApiService _apiService = new ApiService();

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await CargarContactosAsync();
            }
        }

        private async Task CargarContactosAsync()
        {
            try
            {
                var contactos =
                    await _apiService.ObtenerContactosAsync();

                gvContactos.DataSource = contactos;
                gvContactos.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text =
                    "Error al cargar los contactos: " + ex.Message;
            }
        }

        protected void btnNuevoContacto_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("EditarContacto.aspx");
        }

        protected async void gvContactos_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditarContacto")
                {
                    Response.Redirect(
                        "EditarContacto.aspx?id=" + id);
                }

                if (e.CommandName == "EliminarContacto")
                {
                    bool resultado =
                        await _apiService.EliminarContactoAsync(id);

                    if (resultado)
                    {
                        lblMensaje.Text =
                            "Contacto eliminado correctamente.";

                        await CargarContactosAsync();
                    }
                    else
                    {
                        lblMensaje.Text =
                            "No se pudo eliminar el contacto.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text =
                    "Error: " + ex.Message;
            }
        }
    }
}