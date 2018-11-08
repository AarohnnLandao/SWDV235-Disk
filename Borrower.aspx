<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row content">
		<div class="col-sm-6 col"><h1>Borrowers</h1></div><br>
        <p>Add a borrower</p>
    </div><br />
	<div class="row content">
        <form runat="server">
        <asp:Label ID="Label1" runat="server" Text="First Name" ForeColor="White"></asp:Label>
        &nbsp;<asp:TextBox ID="txtBorrowerFirstName" runat="server" BackColor="#333333" ForeColor="White"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBorrowerFirstName" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
        &nbsp;<asp:TextBox ID="txtBorrowerLastName" runat="server" BackColor="#333333" ForeColor="White"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBorrowerLastName" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Phone" ForeColor="White"></asp:Label>
        &nbsp;<asp:TextBox ID="txtBorrowerPhone" runat="server" BackColor="#333333" ForeColor="White" Width="150px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBorrowerPhone" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBorrowerPhone" ErrorMessage="Example 999-999-9999" ForeColor="#CC0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Email" ForeColor="White"></asp:Label>
        &nbsp;<asp:TextBox ID="txtBorrowerEmail" runat="server" BackColor="#333333" ForeColor="White" Width="156px"></asp:TextBox>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBorrowerEmail" ErrorMessage="Please enter a valid email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmitBorrower" runat="server" OnClick="btnSubmitBorrower_Click" Text="Submit" BackColor="#333333" ForeColor="White" />
&nbsp;<asp:Button ID="btnClearBorrower" runat="server" Text="Clear" BackColor="#333333" ForeColor="White" OnClick="btnClearBorrower_Click" CausesValidation="False" />
            <br />
            <br />
            <asp:Label ID="lblConfirmBorrower" runat="server" ForeColor="White"></asp:Label>
        </form>
    </div>

</asp:Content>