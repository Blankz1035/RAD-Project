using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Desc { get; set; }
    public string Type { get; set; }
    public decimal Price { get; set; }
    public string Image { get; set; }
    public string table { get; set; }

    //This databaseName is a session variable. when user clicks on a "car", variable is set to "Cars" Database 
    //And When user adds Partsarts to a cart variable is switched to "Parts" Database..
    //This is nothing but the way of checking the database Name of the specific product that was added to the cart
    string databaseName = HttpContext.Current.Session["databaseName"].ToString();

    public Product(int id)
    {
        this.Id = id;
        Product temp = ProductDB.GetProduct(id, databaseName);
        this.Price = Convert.ToDecimal(temp.Price);
        this.Desc = temp.Desc;
        this.Image = temp.Image;
        this.table = databaseName;
    }

    public Product()
    {
    }
}