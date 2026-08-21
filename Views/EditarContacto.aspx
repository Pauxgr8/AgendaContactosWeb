<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="EditarContacto.aspx.cs"
    Inherits="AgendaContactosWeb.Views.EditarContacto" %>
 
<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">
 
    <meta charset="utf-8" />
<title>Editar Contacto</title>
 
    <style>
 
        body {
            font-family: "Times New Roman", Times, serif;
            font-size: 12px;
            background-color: #F5EEC3;
            color: #000000;
            margin: 0;
            padding: 30px;
        }
 
        .contenedor {
            width: 500px;
            margin: auto;
            background-color: #FFFFFF;
            padding: 25px;
            border: 1px solid #C7B299;
        }
 
        h1 {
            color: #33211C;
            text-align: center;
            font-size: 28px;
            margin-bottom: 25px;
        }
 
        .grupo {
            margin-bottom: 15px;
        }
 
        .etiqueta {
            display: block;
            color: #33211C;
            font-weight: bold;
            margin-bottom: 5px;
        }
 
        .campo {
            font-family: "Times New Roman", Times, serif;
            font-size: 12px;
            width: 100%;
            padding: 8px;
            border: 1px solid #C7B299;
            box-sizing: border-box;
        }
 
        .botones {
            margin-top: 20px;
            text-align: center;
        }
 
        .btnGuardar {
            font-family: "Times New Roman", Times, serif;
            font-size: 12px;
            background-color: #AFCCA8;
            color: #000000;
            border: 1px solid #33211C;
            padding: 8px 15px;
            margin-right: 10px;
            cursor: pointer;
        }
 
        .btnCancelar {
            font-family: "Times New Roman", Times, serif;
            font-size: 12px;
            background-color: #C7B299;
            color: #000000;
            border: 1px solid #33211C;
            padding: 8px 15px;
            cursor: pointer;
        }
 
        .validacion {
            display: block;
            color: #AE0C3E;
            margin-top: 5px;
        }
 
        .mensaje {
            display: block;
            color: #AE0C3E;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
        }
 
    </style>
 
</head>
 
<body>
 
    <form id="formEditarContacto" runat="server">
 
        <div class="contenedor">
 
            <h1>
<asp:Label
                    ID="lblTitulo"
                    runat="server"
                    Text="Contacto">
</asp:Label>
</h1>
 
 
            <!-- NOMBRE -->
 
            <div class="grupo">
 
                <asp:Label
                    ID="lblNombre"
                    runat="server"
                    Text="Nombre:"
                    AssociatedControlID="txtNombre"
                    CssClass="etiqueta">
</asp:Label>
 
                <asp:TextBox
                    ID="txtNombre"
                    runat="server"
                    CssClass="campo"
                    MaxLength="100">
</asp:TextBox>
 
                <asp:RequiredFieldValidator
                    ID="rfvNombre"
                    runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="El nombre es obligatorio."
                    CssClass="validacion"
                    Display="Dynamic">
</asp:RequiredFieldValidator>
 
            </div>
 
 
            <!-- CORREO -->
 
            <div class="grupo">
 
                <asp:Label
                    ID="lblCorreo"
                    runat="server"
                    Text="Correo:"
                    AssociatedControlID="txtCorreo"
                    CssClass="etiqueta">
</asp:Label>
 
                <asp:TextBox
                    ID="txtCorreo"
                    runat="server"
                    CssClass="campo"
                    MaxLength="150">
</asp:TextBox>
 
                <asp:RequiredFieldValidator
                    ID="rfvCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="El correo es obligatorio."
                    CssClass="validacion"
                    Display="Dynamic">
</asp:RequiredFieldValidator>
 
                <asp:RegularExpressionValidator
                    ID="revCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="Ingrese un correo válido."
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    CssClass="validacion"
                    Display="Dynamic">
</asp:RegularExpressionValidator>
 
            </div>
 
 
            <!-- TELÉFONO -->
 
            <div class="grupo">
 
                <asp:Label
                    ID="lblTelefono"
                    runat="server"
                    Text="Teléfono:"
                    AssociatedControlID="txtTelefono"
                    CssClass="etiqueta">
</asp:Label>
 
                <asp:TextBox
                    ID="txtTelefono"
                    runat="server"
                    CssClass="campo"
                    MaxLength="20">
</asp:TextBox>
 
            </div>
 
 
            <!-- BOTONES -->
 
            <div class="botones">
 
                <asp:Button
                    ID="btnGuardar"
                    runat="server"
                    Text="Guardar"
                    CssClass="btnGuardar"
                    OnClick="btnGuardar_Click" />
 
                <asp:Button
                    ID="btnCancelar"
                    runat="server"
                    Text="Cancelar"
                    CssClass="btnCancelar"
                    CausesValidation="false"
                    OnClick="btnCancelar_Click" />
 
            </div>
 
 
            <asp:Label
                ID="lblMensaje"
                runat="server"
                CssClass="mensaje">
</asp:Label>
 
        </div>
 
    </form>
 
</body>
 
</html>