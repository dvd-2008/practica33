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
