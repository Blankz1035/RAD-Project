﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Pages_AdminLogin : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        txtEmail.Focus();
    }

    protected void Button_Login_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        connection.Open();

        string checkUser = "Select Count(*) from AdminAccounts Where Email = '" + txtEmail.Text + "' And Password = '" + txtPassword.Text + "'";
        SqlCommand command = new SqlCommand(checkUser, connection);

        int userExists = Convert.ToInt32(command.ExecuteScalar().ToString());

        connection.Close();

        if (userExists == 1)
        {
            Session["Admin"] = txtEmail.Text;
            Response.Redirect("AdminAccount.aspx");
        }
        else
        {
            lblResult.Text = "Email or Password Incorrect!";
        }
    }
}