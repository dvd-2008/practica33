<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="producto.aspx.cs" Inherits="practica33.Vista.producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Productos</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <!-- SweetAlert CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.1/dist/sweetalert2.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 600px;
            margin: 20px auto;
        }
        .card {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
        }
        .form-control {
            margin-bottom: 10px;
        }
        .btn-toolbar {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <h2 class="text-center mb-4">Gestión de Productos</h2>
                <div class="row">
                    <div class="col-md-6">
                        <label for="txtidProducto">ID Producto</label>
                        <asp:TextBox ID="txtidProducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="txtNombreProducto">Nombre</label>
                        <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="txtPrecioProducto">Precio</label>
                        <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="txtCantidadPorducto">Cantidad</label>
                        <asp:TextBox ID="txtCantidadPorducto" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="btn-toolbar">
                    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary mr-2" OnClick="btnAgregar_Click" Text="Agregar" />
                    <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-warning mr-2" OnClick="btnEditar_Click" Text="Editar" />
                    <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger mr-2" OnClick="btnEliminar_Click" Text="Eliminar" />
                    <asp:Button ID="btnListar" runat="server" CssClass="btn btn-info mr-2" OnClick="btnListar_Click" Text="Listar" />
                    <asp:Button ID="btnRegresar" runat="server" CssClass="btn btn-secondary" OnClick="btnRegresar_Click" Text="Regresar" />
                </div>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered mt-4">
            </asp:GridView>
        </div>

        <!-- Bootstrap JS, Popper.js, and jQuery (for Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-xHDBPd+VpOfkI82bFvFniC+2T/8ZKh06N1SUVMa79Pb3luW8w9/yEoyYlI4a5eG5" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <!-- SweetAlert JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.1/dist/sweetalert2.all.min.js"></script>
    </form>
</body>
</html>
