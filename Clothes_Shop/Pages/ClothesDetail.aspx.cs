using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ClothesDetail : System.Web.UI.Page
{
    private string ProductID;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ProductID = Request.QueryString["productID"].ToString();
        }
        catch (Exception)
        {
            Response.Redirect("Store.aspx");
        }
    }

    protected void AddToCart_Click(object sender, EventArgs e)
    {
        Session["databaseName"] = "Products";
        int id = Convert.ToInt32(ProductID);
        ShoppingCart.GetInstance().AddItem(id, 1000);
        Response.Redirect("Shopping_Cart.aspx");
    }
}