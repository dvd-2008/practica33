using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practica33.Vista
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPedidos_Click(object sender, EventArgs e)
        {
            Response.Redirect("pedidos.aspx");
        }

        protected void btnProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("producto.aspx");
        }
    }
}