using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public class ProductDB
{
	public ProductDB()
	{
	}

    //Returning the instance of a product(specific product)
    public static Product GetProduct(int productID, string databaseName)
    {
        if (databaseName == "Products")
        {
            SearchInProductsDatabase(productID);
        }
        return SearchInProductsDatabase(productID);
    }

    private static Product SearchInProductsDatabase(int productID)
    {
        SqlConnection connection = new SqlConnection(GetConnectionString());

        string search = "SELECT ProductId, ProductName, ProductDesc, "
            + "ProductPrice, ProductImage "
            + "FROM Products "
            + "WHERE ProductId = @ProductID "
            + "ORDER BY ProductId";

        SqlCommand cmd = new SqlCommand(search, connection);
        cmd.Parameters.AddWithValue("ProductID", productID);

        connection.Open();

        SqlDataReader nwReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Product product = null;

        while (nwReader.Read())
        {
            product = new Product();
            product.Id = Convert.ToInt32(nwReader["ProductId"]);
            product.Name = nwReader["ProductName"].ToString();
            product.Desc = nwReader["ProductDesc"].ToString();
            product.Price = Convert.ToInt32(nwReader["ProductPrice"]);
            product.Image = nwReader["ProductImage"].ToString();
        }

        nwReader.Close();

        connection.Close();

        return product;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings
            ["ConnectionString"].ConnectionString;
    }
}