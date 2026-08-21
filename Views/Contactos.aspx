<%@ Page Language="C#" AutoEventWireup="true"
    Async="true"
    CodeBehind="Contactos.aspx.cs"
    Inherits="AgendaContactosWeb.Views.Contactos" %>
 
<!DOCTYPE html>
 
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head runat="server">
 
    <meta charset="utf-8" />
<title>Agenda de Contactos</title>
 
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
            width: 90%;
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
 
        .acciones {
            margin-bottom: 20px;
        }
 
        .btnNuevo {
            font-family: "Times New Roman", Times, serif;
            background-color: #AFCCA8;
            color: #000000;
            border: 1px solid #33211C;
            padding: 8px 15px;
            cursor: pointer;
        }
 
        .gridContactos {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #C7B299;
        }
 
        .gridContactos th {
            background-color: #33211C;
            color: #FFFFFF;
            padding: 10px;
            text-align: left;
        }
 
        .gridContactos td {
            background-color: #FFFFFF;
            color: #000000;
            padding: 10px;
            border: 1px solid #C7B299;
        }
 
        .btnEditar {
            font-family: "Times New Roman", Times, serif;
            background-color: #AFCCA8;
            color: #000000;
            border: 1px solid #33211C;
            padding: 5px 10px;
            cursor: pointer;
        }
 
        .btnEliminar {
            font-family: "Times New Roman", Times, serif;
            background-color: #AE0C3E;
            color: #FFFFFF;
            border: 1px solid #33211C;
            padding: 5px 10px;
            cursor: pointer;
        }
 
        .mensaje {
            display: block;
            margin-top: 15px;
            color: #AE0C3E;
            font-weight: bold;
        }
 
    </style>
 
</head>
 
<body>
 
    <form id="formContactos" runat="server">
 
        <div class="contenedor">
 
            <h1>Agenda de Contactos</h1>
 
            <div class="acciones">
 
                <asp:Button
                    ID="btnNuevoContacto"
                    runat="server"
                    Text="Nuevo Contacto"
                    CssClass="btnNuevo"
                    OnClick="btnNuevoContacto_Click" />
 
            </div>
 
 
            <asp:GridView
                ID="gvContactos"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="ID"
                CssClass="gridContactos"
                GridLines="Both"
                OnRowCommand="gvContactos_RowCommand">
 
                <Columns>
 
                    <asp:BoundField
                        DataField="ID"
                        HeaderText="ID" />
 
                    <asp:BoundField
                        DataField="Nombre"
                        HeaderText="Nombre" />
 
                    <asp:BoundField
                        DataField="Correo"
                        HeaderText="Correo" />
 
                    <asp:BoundField
                        DataField="Telefono"
                        HeaderText="Teléfono" />
 
                    <asp:BoundField
                        DataField="FechaRegistro"
                        HeaderText="Fecha de Registro"
                        DataFormatString="{0:dd/MM/yyyy}" />
 
 
                    <asp:TemplateField HeaderText="Acciones">
 
                        <ItemTemplate>
 
                            <asp:Button
                                ID="btnEditar"
                                runat="server"
                                Text="Editar"
                                CssClass="btnEditar"
                                CommandName="EditarContacto"
                                CommandArgument='<%# Eval("ID") %>' />
 
                            <asp:Button
                                ID="btnEliminar"
                                runat="server"
                                Text="Eliminar"
                                CssClass="btnEliminar"
                                CommandName="EliminarContacto"
                                CommandArgument='<%# Eval("ID") %>'
                                OnClientClick="return confirm('¿Está seguro de eliminar este contacto?');" />
 
                        </ItemTemplate>
 
                    </asp:TemplateField>
 
                </Columns>
 
            </asp:GridView>
 
 
            <asp:Label
                ID="lblMensaje"
                runat="server"
                CssClass="mensaje">
</asp:Label>
 
        </div>
 
    </form>
 
</body>
</html>