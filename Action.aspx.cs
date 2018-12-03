using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
*****************************
Date Modified          Changes

11/29/2018             Instantiated Check out Action Log
*/

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            ConfirmationLabel.Visible = true;
        }

    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ConfirmationLabel.Visible = false;
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        ConfirmationLabel.Visible = false;
    }
    protected void Page_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError();
        Session["Exception"] = ex;
        Response.Redirect("~/DefaultError.aspx");
    }
}