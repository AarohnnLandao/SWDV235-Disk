<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Action.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>
<%-- 
*****************************
Date Modified          Changes

11/29/2018             Instantiated Check out Action Log 

    --%>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	
    <form id="form1" runat="server">
    
    <div class="form-title"><h1>Add a checkout</h1>
        <p>&nbsp;</p>        
        </div>
        <p>&nbsp;</p>
    
    <!-- start of Checkout form -->
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BorrowerIDDropdown %>" 
            SelectCommand="SELECT [Borrower_ID] FROM [Borrower]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDNumber,Borrower_ID,CD_ID" DataSourceID="SqlDataSource2" Pagesize="10" Width="837px" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="IDNumber" HeaderText=" Checkout Number " InsertVisible="False" ReadOnly="True" SortExpression="IDNumber" />
                <asp:BoundField DataField="Borrower_ID" HeaderText=" Borrower ID " InsertVisible="False" ReadOnly="True" SortExpression="Borrower_ID" />
                <asp:BoundField DataField="Borrower_First_Name" HeaderText=" First Name " SortExpression="Borrower_First_Name" />
                <asp:BoundField DataField="Borrower_Last_Name" HeaderText=" Last Name " SortExpression="Borrower_Last_Name" />
                <asp:BoundField DataField="CD_ID" HeaderText=" CD#" ReadOnly="True" SortExpression="CD_ID" />
                <asp:BoundField DataField="Borrowed_date" HeaderText=" Borrowed " SortExpression="Borrowed_date" />
                <asp:BoundField DataField="Returned_date" HeaderText=" Returned " SortExpression="Returned_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ActionPageListing %>" SelectCommand="SELECT Borrowers_History.IDNumber, Borrower.Borrower_ID, Borrower.Borrower_First_Name, Borrower.Borrower_Last_Name, CD.CD_ID, Borrowers_History.Borrowed_date, Borrowers_History.Returned_date FROM Borrowers_History INNER JOIN CD ON Borrowers_History.CD_ID = CD.CD_ID INNER JOIN Borrower ON Borrowers_History.Borrower_ID = Borrower.Borrower_ID" InsertCommand="INSERT INTO [Borrowers_History] ([Borrower_ID], [CD_ID], [Borrowed_Date], [Returned_Date]) VALUES (@Borrower_ID, @CD_ID, @Borrowed_Date, @Returned_Date)">
            <InsertParameters>
                <asp:Parameter Name="Borrower_ID" />
                <asp:Parameter Name="CD_ID" />
                <asp:Parameter Name="Borrowed_Date" />
                <asp:Parameter Name="Returned_date" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="CDIDdropdown" runat="server" ConnectionString="<%$ ConnectionStrings:CDIDDropdown %>" SelectCommand="SELECT [CD_ID] FROM [CD]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="BorrowerIDdropdown" runat="server" ConnectionString="<%$ ConnectionStrings:BorrowerIDDropdown %>" SelectCommand="SELECT [Borrower_ID] FROM [Borrower]"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="373px" AutoGenerateRows="False" DataKeyNames="IDNumber" DataSourceID="SqlDataSource2" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="IDNumber" HeaderText="IDNumber" InsertVisible="False" ReadOnly="True" SortExpression="IDNumber" />
                <asp:TemplateField HeaderText="CD_ID" SortExpression="CD_ID">
                    
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="CDIDdropdown" DataTextField="CD_ID" DataValueField="CD_ID" SelectedValue='<%# Bind("CD_ID") %>' OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CDIDDropdown %>" SelectCommand="SELECT [CD_ID] FROM [CD]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borrower_ID" SortExpression="Borrower_ID">
                    
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="BorrowerIDdropdown" DataTextField="Borrower_ID" DataValueField="Borrower_ID" SelectedValue='<%# Bind("Borrower_ID") %>' style="height: 22px">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Borrower_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Borrowed_date" SortExpression="Borrowed_date">
                    
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Borrowed_date") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](19|20)\d\d$">MM/DD/YYYY</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Borrowed_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" OnClick="Button1_Click" Text="Insert" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
    </form>
    <div class="form-title">
        <p> <!--Confirm message hide/unhide values-->
            <asp:Label ID="ConfirmationLabel" runat="server" Text="A New Lease has been Successfully added." Visible="False"></asp:Label>
        </p></div>
        <p>&nbsp;</p>
</asp:Content>