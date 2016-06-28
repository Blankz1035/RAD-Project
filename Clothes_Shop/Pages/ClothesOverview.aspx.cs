using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ClothesOverview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["Admin"] != null)
            {
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (gvwClothesOverview.SelectedRow == null)
        {
            dvwClothesOverview.Visible = false;
        }
        else
        {
            dvwClothesOverview.Visible = true;
        }
    }

    protected void dvwClothesOverview_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        gvwClothesOverview.DataBind();
        gvwClothesOverview.SelectRow(-1);
    }

    protected void dvwClothesOverview_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        gvwClothesOverview.DataBind();
        gvwClothesOverview.SelectRow(-1);
    }

    protected void dvwClothesOverview_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        gvwClothesOverview.DataBind();
        gvwClothesOverview.SelectRow(-1);
    }
}