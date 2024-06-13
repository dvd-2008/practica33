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