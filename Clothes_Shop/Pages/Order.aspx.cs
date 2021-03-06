﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class Pages_Order : System.Web.UI.Page
{
    private int customerId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();

            if (Session["Order"] == null)
            {
                Response.Redirect("ShoppingCart.aspx");
            }
            else
            {
                GetCustomerDetails();
            }
        }
    }

    private void GetCustomerDetails()
    {
        if (!(Session["Customer"] == null))
        {
            string firstName = "", lastName = "", address = "", contactNumber = "", mobileFormat = "";

            try
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                connection.Open();

                string getCustomerDetails = "Select Customers.CustomerId, Customers.FirstName, Customers.LastName, Customers.Address, Customers.ContactNumber " +
                                            "From Customers " +
                                            "Inner Join CustomerAccounts " +
                                            "On Customers.CustomerId = CustomerAccounts.CustomerId Where CustomerAccounts.Email = '" + Session["Customer"] + "'";

                SqlCommand command = new SqlCommand(getCustomerDetails, connection);

                SqlDataReader nwReader = command.ExecuteReader();

                while (nwReader.Read())
                {
                    customerId = (int)nwReader["CustomerId"];
                    firstName = nwReader["FirstName"].ToString();
                    lastName = nwReader["LastName"].ToString();
                    address = nwReader["Address"].ToString();
                    contactNumber = nwReader["ContactNumber"].ToString();
                }

                nwReader.Close();

                connection.Close();

                mobileFormat = contactNumber.Substring(0, 2);
                mobileFormat = "0" + mobileFormat + "-";
                mobileFormat += contactNumber.Substring(2, 7);

                lblCustomerIdVal.Text = customerId.ToString();
                lblName.Text = firstName + " " + lastName;
                lblAddress.Text = address;
                lblContactNumber.Text = mobileFormat;
            }
            catch (Exception)
            {
                lblName.Text = "No Shipping Record Found!";
            }
        }
        else
        {
            Response.Redirect("CustomerLogin.aspx");
        }
    }

    private void BindGrid()
    {
        gvwOrderList.DataSource = ShoppingCart.GetInstance().Items;
        gvwOrderList.DataBind();
    }

    protected void gvwOrderList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[3].Text = "Total : " + ShoppingCart.GetInstance().GetSubTotal().ToString("C");
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        PlaceOrder();
    }

    private void PlaceOrder()
    {
        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);   // connecting with database

            connection.Open();

            string dateNow = DateTime.Today.ToString("MM/dd/yyyy");
            dateNow += " " + DateTime.Now.ToString("HH:mm:ss");

            string newOrder = "Insert Into Orders(OrderDate, OrderStatus, CustomerId) Values ('" + dateNow + "', @OrderStatus, @CustomerId); SELECT SCOPE_IDENTITY();";

            SqlCommand commandOne = new SqlCommand(newOrder, connection);

            commandOne.Parameters.AddWithValue("@OrderStatus", "Not Processed");
            commandOne.Parameters.AddWithValue("@CustomerId", Convert.ToInt32(lblCustomerIdVal.Text));

            string scope = commandOne.ExecuteScalar().ToString();

            connection.Close();

            GetOrderItems(scope);

            Session["Order"] = "Complete";

            Response.Redirect("OrderComplete.aspx");
        }
        catch (Exception)
        {
        }
    }

    private void GetOrderItems(string scope)
    {
        List<CartItem> Items = ShoppingCart.GetInstance().Items;
        string orderItems = "";

        foreach (CartItem item in Items)
        {
            orderItems += "Insert Into Items(ItemName, Quantity, OrderId) Values ('" + item.Description + "', '" + item.Quantity + "', '" + scope + "'); ";
        }

        try
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);   // connecting with database

            connection.Open();

            SqlCommand commandOne = new SqlCommand(orderItems, connection);

            commandOne.ExecuteNonQuery();

            connection.Close();
        }
        catch (Exception)
        {
        }
    }

    

}