<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disks.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	
    <form id="form1" runat="server">
    
    <div class="form-title"><h1>Disks</h1></div>
        <p>&nbsp;</p>
    
    <!-- start of Disks form -->
    
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CD_ID" DataSourceID="SqlDataSource2" Pagesize="15" Width="609px">
            <Columns>
                <asp:TemplateField HeaderText=" CD ID " SortExpression="CD_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CD_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CD_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Status " SortExpression="Loc_status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Loc_status") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Required status" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="RangeValidator" MaximumValue="2" MinimumValue="1">1(inhouse) 2(loaned)</asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Loc_status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" CD Name " SortExpression="CD_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CD_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CD_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Release Date " SortExpression="Release_Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Release_Date") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](19|20)\d\d$">MM/DD/YYYY</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Release_Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString2 %>" DeleteCommand="sp_DeleteDisk" InsertCommand="sp_InsertDisk" SelectCommand="SELECT * FROM [CD]" UpdateCommand="sp_UpdateDisk" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="CD_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CD_ID" Type="Int32" />
                <asp:Parameter Name="Loc_Status" Type="Int32" />
                <asp:Parameter Name="CD_Name" Type="String" />
                <asp:Parameter Name="Release_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CD_ID" Type="Int32" />
                <asp:Parameter Name="Loc_Status" Type="Int32" />
                <asp:Parameter Name="CD_Name" Type="String" />
                <asp:Parameter Name="Release_Date" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="373px" AutoGenerateRows="False" DataKeyNames="CD_ID" DataSourceID="SqlDataSource2">
            <Fields>
                <asp:TemplateField HeaderText=" ID" SortExpression="CD_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CD_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CD_ID") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Must be a unique int" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="CompareValidator" ForeColor="#CC0000" Operator="DataTypeCheck" Type="Integer">Must be a number</asp:CompareValidator>
                    </InsertItemTemplate>
                  
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" status" SortExpression="Loc_status">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Loc_status") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Loc_status") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="RangeValidator" ForeColor="White" MaximumValue="2" MinimumValue="1">1(In House) 2(Loaned)</asp:RangeValidator>
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Disk Name" SortExpression="CD_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CD_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CD_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Release Date" SortExpression="Release_Date">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Release_Date") %>'></asp:TextBox>                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Release_Date") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](19|20)\d\d$">MM/DD/YYYY</asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                   
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
    
</asp:Content>