using AgendaContactosWeb.Models;
using AgendaContactosWeb.Services;
using System;
using System.Threading.Tasks;
using System.Web.UI;

namespace AgendaContactosWeb.Views
{
    public partial class EditarContacto : Page
    {
        private readonly ApiService _apiService = new ApiService();

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    lblTitulo.Text = "Editar Contacto";

                    int id = Convert.ToInt32(
                        Request.QueryString["id"]);

                    await CargarContacto(id);
                }
                else
                {
                    lblTitulo.Text = "Nuevo Contacto";
                }
            }
        }

        private async Task CargarContacto(int id)
        {
            try
            {
                ContactoModel contacto =
                    await _apiService.ObtenerContactoPorIdAsync(id);

                if (contacto != null)
                {
                    txtNombre.Text = contacto.Nombre;
                    txtCorreo.Text = contacto.Correo;
                    txtTelefono.Text = contacto.Telefono;
                }
                else
                {
                    lblMensaje.Text =
                        "No se encontró el contacto.";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text =
                    "Error al cargar el contacto: " + ex.Message;
            }
        }

        protected async void btnGuardar_Click(
            object sender,
            EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                ContactoModel contacto = new ContactoModel
                {
                    Nombre = txtNombre.Text.Trim(),
                    Correo = txtCorreo.Text.Trim(),
                    Telefono = txtTelefono.Text.Trim(),
                    UsuarioCreacion = "Web"
                };

                bool resultado;

                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(
                        Request.QueryString["id"]);

                    contacto.ID = id;

                    resultado =
                        await _apiService
                            .ActualizarContactoAsync(id, contacto);
                }
                else
                {
                    resultado =
                        await _apiService
                            .InsertarContactoAsync(contacto);
                }

                if (resultado)
                {
                    Response.Redirect("Contactos.aspx");
                }
                else
                {
                    lblMensaje.Text =
                        "No se pudo guardar el contacto.";
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text =
                    "Error al guardar el contacto: " + ex.Message;
            }
        }

        protected void btnCancelar_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("Contactos.aspx");
        }
    }
}