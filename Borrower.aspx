<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <form id="form1" runat="server">
    
    <div class="form-title"><h1>Artists</h1></div>
        <p>&nbsp;</p>
    
    <!-- start of artists form -->
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
            SelectCommand="SELECT [Artist_ID], [Artist_First_Name], [Artist_Last_Name], [ArtistType_ID] FROM [Artist] ORDER BY [Artist_First_Name]" 
            DeleteCommand="DELETE FROM [Artist] WHERE [Artist_ID] = @Artist_ID" 
            InsertCommand="INSERT INTO [Artist] ([Artist_ID], [Artist_First_Name], [Artist_Last_Name], [ArtistType_ID]) VALUES (@Artist_ID, @Artist_First_Name, @Artist_Last_Name, @ArtistType_ID)" 
            UpdateCommand="UPDATE [Artist] SET [Artist_First_Name] = @Artist_First_Name, [Artist_Last_Name] = @Artist_Last_Name, [ArtistType_ID] = @ArtistType_ID WHERE [Artist_ID] = @Artist_ID">
            <DeleteParameters>
                <asp:Parameter Name="Artist_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Artist_ID" Type="Int32" />
                <asp:Parameter Name="Artist_First_Name" Type="String" />
                <asp:Parameter Name="Artist_Last_Name" Type="String" />
                <asp:Parameter Name="ArtistType_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Artist_First_Name" Type="String" />
                <asp:Parameter Name="Artist_Last_Name" Type="String" />
                <asp:Parameter Name="ArtistType_ID" Type="Int32" />
                <asp:Parameter Name="Artist_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Borrower_ID" DataSourceID="SqlDataSource2" Pagesize="15" Width="609px" AllowPaging="True">
            <Columns>
                <asp:TemplateField HeaderText=" ID " InsertVisible="False" SortExpression="Borrower_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Borrower_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Borrower_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name " SortExpression="Borrower_First_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Borrower_First_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required first name" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Borrower_First_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Last Name " SortExpression="Borrower_Last_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Borrower_Last_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required Last Name" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Borrower_Last_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Phone " SortExpression="Borrower_Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Borrower_Phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required Phone" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">ex. 999-999-999</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Borrower_Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Email " SortExpression="Borrower_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox4">Enter a valid Email</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString2 %>" DeleteCommand="sp_DeleteBorrower" InsertCommand="sp_InsertBorrower" SelectCommand="SELECT [Borrower_ID], [Borrower_First_Name], [Borrower_Last_Name], [Borrower_Phone], [Borrower_Email] FROM [Borrower]" UpdateCommand="sp_UpdateBorrower" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Borrower_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Borrower_First_Name" Type="String" />
                <asp:Parameter Name="Borrower_Last_Name" Type="String" />
                <asp:Parameter Name="Borrower_Phone" Type="String" />
                <asp:Parameter Name="Borrower_Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Borrower_ID" Type="Int32" />
                <asp:Parameter Name="Borrower_First_Name" Type="String" />
                <asp:Parameter Name="Borrower_Last_Name" Type="String" />
                <asp:Parameter Name="Borrower_Phone" Type="String" />
                <asp:Parameter Name="Borrower_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="358px" AutoGenerateRows="False" DataKeyNames="Borrower_ID" DataSourceID="SqlDataSource2">
            <Fields>
                <asp:TemplateField HeaderText=" Borrower ID " InsertVisible="False" SortExpression="Borrower_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Borrower_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" First Name " SortExpression="Borrower_First_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Borrower_First_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Borrower_First_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required First name" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Last Name " SortExpression="Borrower_Last_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Borrower_Last_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Borrower_Last_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" ErrorMessage="Requierd Last Name" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                       
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Phone " SortExpression="Borrower_Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Borrower_Phone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Borrower_Phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required Phone" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">ex. 999-999-9999</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                      
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Email " SortExpression="Borrower_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="TextBox1">Enter a valid Email</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                      
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
    
</asp:Content>