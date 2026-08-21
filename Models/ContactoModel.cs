using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AgendaContactosWeb.Models
{
    public class ContactoModel
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El correo es obligatorio")]
        [EmailAddress(ErrorMessage = "Ingrese un correo válido")]
        public string Correo { get; set; }

        public string Telefono { get; set; }

        public DateTime FechaRegistro { get; set; }

        public string UsuarioCreacion { get; set; }
    }
}