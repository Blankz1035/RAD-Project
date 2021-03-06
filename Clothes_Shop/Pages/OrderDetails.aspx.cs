﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_OrderDetails : System.Web.UI.Page
{
    private string orderID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            try
            {
                orderID = Request.QueryString["orderID"].ToString();
            }
            catch (Exception)
            {
                Response.Redirect("Home.aspx");
            }

            if (Session["Customer"] == null && Session["Admin"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                GetCustomerDetails(GetCustomerId());
            }
        }
    }

    private int GetCustomerId()
    {
        try
        {
            int customerId = 0;

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            connection.Open();

            string getCustomerDetails = "Select CustomerId " +
                                        "From Orders " +
                                        "Where OrderId = '" + orderID + "'";

            SqlCommand command = new SqlCommand(getCustomerDetails, connection);

            SqlDataReader nwReader = command.ExecuteReader();

            while (nwReader.Read())
            {
                customerId = (int)nwReader["CustomerId"];
            }

            nwReader.Close();

            connection.Close();

            return customerId;
        }
        catch (Exception)
        {
            return 0;
        }
    }

    private void GetCustomerDetails(int customerId)
    {
        try
        {
            string firstName = "", lastName = "", address = "", contactNumber = "", mobileFormat = "";

            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            connection.Open();

            string getCustomerDetails = "Select CustomerId, FirstName, LastName, Address, ContactNumber " +
                                        "From Customers " +
                                        "Where customerId = '" + customerId + "'";

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
}