Vista // pedidos.aspx.cs :


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practica33.Vista
{
    public partial class pedidos : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmpresaConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarProductos();
            CargarDatos();

        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            int id_pedido = Convert.ToInt32(txtIdPedido.Text);
            DateTime fecha = Convert.ToDateTime(txtFecha.Text);
            int id_producto = Convert.ToInt32(cboProducto.SelectedValue);
            int cantidad = Convert.ToInt32(txtCantidadPedido.Text);
            double precio = Convert.ToDouble(txtPrecio.Text);

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    database.CrearPedidos(id_pedido, fecha, id_producto, cantidad, precio);
                    CargarDatos();
                    LimpiarDatos();
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al agregar el pedido: " + ex.Message);
                }
            }
        }

        protected void btnEditarProducto_Click(object sender, EventArgs e)
        {
            int id_pedido = Convert.ToInt32(txtIdPedido.Text);

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    Pedidos pedido = database.Pedidos.SingleOrDefault(x => x.id_pedido == id_pedido);

                    if (pedido != null)
                    {
                        DateTime fecha = string.IsNullOrWhiteSpace(txtFecha.Text) ? (pedido.fecha ?? DateTime.Now) : Convert.ToDateTime(txtFecha.Text.Trim());
                        int id_producto = string.IsNullOrWhiteSpace(cboProducto.SelectedValue) ? (pedido.id_producto ?? 0) : Convert.ToInt32(cboProducto.SelectedValue.Trim());
                        int cantidad = string.IsNullOrWhiteSpace(txtCantidadPedido.Text) ? (pedido.cantidad ?? 0) : Convert.ToInt32(txtCantidadPedido.Text.Trim());
                        double precio = string.IsNullOrWhiteSpace(txtPrecio.Text) ? (pedido.precio ?? 0.0) : Convert.ToDouble(txtPrecio.Text.Trim());

                        database.ActualizarPedido(id_pedido, fecha, id_producto, cantidad, precio);
                        CargarDatos();
                        LimpiarDatos();
                    }
                    else
                    {
                        Response.Write("No existe el Registro ");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al cargar los datos: " + ex.Message);
                }
            }

        }

        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            int id_pedido = Convert.ToInt32(txtIdPedido.Text);
            txtIdPedido.Text = ""; // Limpiamos el campo después de obtener el id

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    Pedidos pedido = database.Pedidos.SingleOrDefault(x => x.id_pedido == id_pedido);

                    if (pedido != null)
                    {
                        database.EliminarPedido(id_pedido);
                        CargarDatos();
                        LimpiarDatos();
                    }
                    else
                    {
                        Response.Write("No existe el Registro ");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al cargar los datos: " + ex.Message);
                }
            }

        }

        protected void btnListarProducto_Click(object sender, EventArgs e)
        {
            CargarProductos();
        }

        private void CargarDatos()
        {
            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {


                    GridView1.DataSource = database.LeerPedidos();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al cargar los datos: " + ex.Message);
                }
            }
        }

        private void LimpiarDatos()
        {
            txtIdPedido.Text = "";
            txtFecha.Text = "";
            txtCantidadPedido.Text = "";
            txtPrecio.Text = "";
            cboProducto.SelectedIndex = 0;
        }

        private void CargarProductos()
        {
            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    var productos = database.Producto.ToList();
                    cboProducto.DataSource = productos;
                    cboProducto.DataTextField = "nombre";
                    cboProducto.DataValueField = "id_producto";
                    cboProducto.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al cargar los productos: " + ex.Message);
                }
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}


vista // producto.asp.cs :


using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practica33.Vista
{
    public partial class producto : System.Web.UI.Page
    {

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmpresaConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatos();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            int id_producto = Convert.ToInt32(txtidProducto.Text);
            string nombre = txtNombreProducto.Text.Trim();
            double precio = Convert.ToDouble(txtPrecioProducto.Text);
            int cantidad = Convert.ToInt32(txtCantidadPorducto.Text);

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    database.CrearProductos1(id_producto, nombre, precio, cantidad);
                    CargarDatos();
                    LimpiarDatos();
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al agregar el pedido: " + ex.Message);
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int id_producto = Convert.ToInt32(txtidProducto.Text);

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    Producto producto = database.Producto.SingleOrDefault(p => p.id_producto == id_producto);

                    if (producto != null)
                    {
                        string nombre = string.IsNullOrWhiteSpace(txtNombreProducto.Text) ? producto.nombre : txtNombreProducto.Text.Trim();
                        double precio = string.IsNullOrWhiteSpace(txtPrecioProducto.Text) ? producto.precio ?? 0.0 : Convert.ToDouble(txtPrecioProducto.Text.Trim());
                        int cantidad = string.IsNullOrWhiteSpace(txtCantidadPorducto.Text) ? producto.cantidad ?? 0 : Convert.ToInt32(txtCantidadPorducto.Text.Trim());

                        database.ActualizarProducto(id_producto, nombre, precio, cantidad);
                        CargarDatos();
                        LimpiarDatos();
                    }
                    else
                    {
                        Response.Write("El producto no existe.");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al editar el producto: " + ex.Message);
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id_producto = Convert.ToInt32(txtidProducto.Text);
            txtidProducto.Text = ""; // Limpiamos el campo después de obtener el id

            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {
                    Producto producto = database.Producto.SingleOrDefault(x => x.id_producto == id_producto);

                    if (producto != null)
                    {
                        database.EliminarProducto(id_producto);
                        CargarDatos();
                        LimpiarDatos();
                    }
                    else
                    {
                        Response.Write("No existe el Producto ");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al eliminar el producto: " + ex.Message);
                }
            }
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            CargarDatos();
        }
        private void CargarDatos()
        {
            using (DataEmpresaDataContext database = new DataEmpresaDataContext(connectionString))
            {
                try
                {


                    GridView1.DataSource = database.LeerProductos();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Ocurrió un error al cargar los datos: " + ex.Message);
                }
            }
        }
        private void LimpiarDatos()
        {
            txtidProducto.Text = "";
            txtNombreProducto.Text = "";
            txtPrecioProducto.Text = "";
            txtCantidadPorducto.Text = "";
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}

web.config :

<?xml version="1.0" encoding="utf-8"?>
<!--
  Para obtener más información sobre cómo configurar la aplicación ASP.NET, visite
  https://go.microsoft.com/fwlink/?LinkId=169433
  -->
<configuration>
  <connectionStrings>
    <add name="EmpresaConnectionString" connectionString="Data Source=DESKTOP-SKHUFBP;Initial Catalog=Empresa;Integrated Security=True;"
      providerName="System.Data.SqlClient" />
    <add name="EmpresaConnectionString1" connectionString="Data Source=.;Initial Catalog=Empresa;Integrated Security=True;Trust Server Certificate=True"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
  <system.web>
    <compilation debug="true" targetFramework="4.7.2" />
    <httpRuntime targetFramework="4.7.2" />
  </system.web>
  <system.codedom>
    <compilers>
      <compiler language="c#;cs;csharp" extension=".cs" type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.CSharpCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" warningLevel="4" compilerOptions="/langversion:default /nowarn:1659;1699;1701" />
      <compiler language="vb;vbs;visualbasic;vbscript" extension=".vb" type="Microsoft.CodeDom.Providers.DotNetCompilerPlatform.VBCodeProvider, Microsoft.CodeDom.Providers.DotNetCompilerPlatform, Version=2.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" warningLevel="4" compilerOptions="/langversion:default /nowarn:41008 /define:_MYTYPE=\&quot;Web\&quot; /optionInfer+" />
    </compilers>
  </system.codedom>
</configuration>


///////////////////////////////////////////////////////////////////////

base de datos :

USE [Empresa]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id_pedido] [int] NOT NULL,
	[fecha] [date] NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [float] NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (1, CAST(N'2024-06-01' AS Date), 1, 10, 15)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (2, CAST(N'2024-06-01' AS Date), 2, 50, 5)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (3, CAST(N'2024-06-02' AS Date), 3, 20, 18)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (4, CAST(N'2024-06-02' AS Date), 4, 15, 18)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (5, CAST(N'2024-06-03' AS Date), 5, 25, 27.5)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (6, CAST(N'2024-06-03' AS Date), 6, 30, 15)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (7, CAST(N'2024-06-04' AS Date), 7, 40, 32)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (8, CAST(N'2024-06-04' AS Date), 8, 60, 18)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (9, CAST(N'2024-06-05' AS Date), 9, 50, 50)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (10, CAST(N'2024-06-05' AS Date), 10, 20, 50)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (11, CAST(N'2024-06-06' AS Date), 11, 10, 30)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (12, CAST(N'2024-06-06' AS Date), 12, 15, 30)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (13, CAST(N'2024-06-07' AS Date), 13, 20, 24)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (14, CAST(N'2024-06-07' AS Date), 14, 15, 42)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (15, CAST(N'2024-06-08' AS Date), 15, 10, 17)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (16, CAST(N'2024-06-08' AS Date), 16, 10, 20)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (17, CAST(N'2024-06-09' AS Date), 17, 30, 45)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (18, CAST(N'2024-06-09' AS Date), 18, 25, 62.5)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (19, CAST(N'2024-06-10' AS Date), 19, 40, 40)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (20, CAST(N'2024-06-10' AS Date), 20, 5, 25)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (21, CAST(N'2022-02-12' AS Date), 1, 10, 50)
INSERT [dbo].[Pedidos] ([id_pedido], [fecha], [id_producto], [cantidad], [precio]) VALUES (22, CAST(N'2022-02-12' AS Date), 1, 10, 50)
GO
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (1, N'Leche', 1.5, 100)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (2, N'Huevo', 0.1, 1000)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (3, N'Arroz', 0.9, 500)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (4, N'Frijoles', 1.2, 300)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (5, N'Lentejas', 1.1, 400)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (6, N'Pan', 0.5, 200)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (7, N'Azúcar', 0.8, 350)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (8, N'Sal', 0.3, 600)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (9, N'Pasta', 1, 250)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (10, N'Aceite', 2.5, 150)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (11, N'Café', 3, 80)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (12, N'Té', 2, 90)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (13, N'Jugo', 1.2, 120)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (14, N'Cereal', 2.8, 110)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (15, N'Mantequilla', 1.7, 60)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (16, N'Queso', 2, 70)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (17, N'Yogur', 1.5, 130)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (18, N'Jamón', 2.5, 90)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (19, N'Cerveza', 1, 500)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (20, N'Vino', 5, 40)
INSERT [dbo].[Producto] ([id_producto], [nombre], [precio], [cantidad]) VALUES (21, N'jamonn', 18, 36)
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPedido]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarPedido]
    @id_pedido INT,
    @fecha DATE,
    @id_producto INT,
    @cantidad INT,
    @precio FLOAT
AS
BEGIN
    UPDATE Pedidos
    SET fecha = @fecha, id_producto = @id_producto, cantidad = @cantidad, precio = @precio
    WHERE id_pedido = @id_pedido;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarProducto]
    @id_producto INT,
    @nombre VARCHAR(50),
    @precio FLOAT,
    @cantidad INT
AS
BEGIN
    UPDATE Producto
    SET nombre = @nombre, precio = @precio, cantidad = @cantidad
    WHERE id_producto = @id_producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearPedido]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearPedido]
    @fecha DATE,
    @id_producto INT,
    @cantidad INT,
    @precio FLOAT
AS
BEGIN
    INSERT INTO Pedidos (fecha, id_producto, cantidad, precio)
    VALUES (@fecha, @id_producto, @cantidad, @precio);
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearPedidos]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearPedidos]
    @id_pedido INT,
    @fecha DATE,
    @id_producto INT,
    @cantidad INT,
    @precio FLOAT
AS
BEGIN
    INSERT INTO Pedidos (id_pedido, fecha, id_producto, cantidad, precio)
    VALUES (@id_pedido, @fecha, @id_producto, @cantidad, @precio);
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearProducto]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearProducto]
    @nombre VARCHAR(50),
    @precio FLOAT,
    @cantidad INT
AS
BEGIN
    INSERT INTO Producto (nombre, precio, cantidad)
    VALUES (@nombre, @precio, @cantidad);
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearProductos]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearProductos]
    @nombre VARCHAR(50),
    @precio FLOAT,
    @cantidad INT,
    @id_producto INT OUTPUT
AS
BEGIN
    INSERT INTO Producto (nombre, precio, cantidad)
    VALUES (@nombre, @precio, @cantidad);

    -- Obtener el ID del producto recién insertado
    SET @id_producto = SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearProductos1]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearProductos1]
    @id_producto INT,
    @nombre VARCHAR(50),
    @precio FLOAT,
    @cantidad INT
AS
BEGIN
    INSERT INTO Producto (id_producto, nombre, precio, cantidad)
    VALUES (@id_producto, @nombre, @precio, @cantidad);
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPedido]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPedido]
    @id_pedido INT
AS
BEGIN
    DELETE FROM Pedidos WHERE id_pedido = @id_pedido;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarProducto]
    @id_producto INT
AS
BEGIN
    DELETE FROM Producto WHERE id_producto = @id_producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[LeerPedido]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerPedido]
    @id_pedido INT
AS
BEGIN
    SELECT * FROM Pedidos WHERE id_pedido = @id_pedido;
END;
GO
/****** Object:  StoredProcedure [dbo].[LeerPedidos]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LeerPedidos]
   
AS
BEGIN
    SELECT * FROM Pedidos 
END;
GO
/****** Object:  StoredProcedure [dbo].[LeerProducto]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerProducto]
    @id_producto INT
AS
BEGIN
    SELECT * FROM Producto WHERE id_producto = @id_producto;
END;
GO
/****** Object:  StoredProcedure [dbo].[LeerProductos]    Script Date: 12/06/2024 16:29:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeerProductos]

AS
BEGIN
    SELECT * FROM Producto
END;
GO
