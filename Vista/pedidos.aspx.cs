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