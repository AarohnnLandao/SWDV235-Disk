using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmitBorrower_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            lblConfirmBorrower.Text = "Borrower has been added!";
        }
    }

    protected void btnClearBorrower_Click(object sender, EventArgs e)
    {
        txtBorrowerEmail.Text = "";
        txtBorrowerPhone.Text = "";
        txtBorrowerFirstName.Text = "";
        txtBorrowerLastName.Text = "";
    }
}