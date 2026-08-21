using AgendaContactosWeb.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace AgendaContactosWeb.Services
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;

        private readonly string _baseUrl =
            "https://localhost:7016/api/Contacto";

        public ApiService()
        {
            _httpClient = new HttpClient();
        }

        // GET - Obtener todos los contactos
        public async Task<List<ContactoModel>> ObtenerContactosAsync()
        {
            HttpResponseMessage response =
                await _httpClient.GetAsync(_baseUrl);

            response.EnsureSuccessStatusCode();

            string json =
                await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<List<ContactoModel>>(json);
        }

        // GET - Obtener contacto por ID
        public async Task<ContactoModel> ObtenerContactoPorIdAsync(int id)
        {
            HttpResponseMessage response =
                await _httpClient.GetAsync($"{_baseUrl}/{id}");

            response.EnsureSuccessStatusCode();

            string json =
                await response.Content.ReadAsStringAsync();

            return JsonConvert.DeserializeObject<ContactoModel>(json);
        }

        // POST - Crear contacto
        public async Task<bool> InsertarContactoAsync(ContactoModel contacto)
        {
            string json = JsonConvert.SerializeObject(contacto);

            StringContent contenido = new StringContent(
                json,
                Encoding.UTF8,
                "application/json");

            HttpResponseMessage response =
                await _httpClient.PostAsync(_baseUrl, contenido);

            return response.IsSuccessStatusCode;
        }

        // PUT - Actualizar contacto
        public async Task<bool> ActualizarContactoAsync(
            int id,
            ContactoModel contacto)
        {
            string json = JsonConvert.SerializeObject(contacto);

            StringContent contenido = new StringContent(
                json,
                Encoding.UTF8,
                "application/json");

            HttpResponseMessage response =
                await _httpClient.PutAsync(
                    $"{_baseUrl}/{id}",
                    contenido);

            return response.IsSuccessStatusCode;
        }

        // DELETE - Eliminar contacto
        public async Task<bool> EliminarContactoAsync(int id)
        {
            HttpResponseMessage response =
                await _httpClient.DeleteAsync(
                    $"{_baseUrl}/{id}");

            return response.IsSuccessStatusCode;
        }
    }
}