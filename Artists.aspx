<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Artists.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Artist_ID" DataSourceID="SqlDataSource2" AllowPaging="false" Pagesize="15" Width="480px">
            <Columns>
                <asp:TemplateField HeaderText=" ID " SortExpression="Artist_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Artist_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Artist_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" First Name " SortExpression="Artist_First_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Artist_First_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Must add a first name." ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Artist_First_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Last Name " SortExpression="Artist_Last_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Artist_Last_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Must add last name" ForeColor="#CC0000" ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Artist_Last_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Artist Type " SortExpression="ArtistType_ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ArtistType_ID") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Must Add Artist Type" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:Label ID="Label5" runat="server" Text="(Solo:1,  Group:2)"></asp:Label>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="1(Solo) or 2(Group)" ForeColor="#CC0000" MaximumValue="2" MinimumValue="1">*1 or 2</asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ArtistType_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString2 %>" DeleteCommand="sp_DeleteArtist" InsertCommand="sp_InsertArtist" SelectCommand="SELECT [Artist_ID], [Artist_First_Name], [Artist_Last_Name], [ArtistType_ID] FROM [Artist] ORDER BY [Artist_ID]" UpdateCommand="sp_UpdateArtist" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
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
                <asp:Parameter Name="Artist_ID" Type="Int32" />
                <asp:Parameter Name="Artist_First_Name" Type="String" />
                <asp:Parameter Name="Artist_Last_Name" Type="String" />
                <asp:Parameter Name="ArtistType_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="328px" AutoGenerateRows="False" DataKeyNames="Artist_ID" DataSourceID="SqlDataSource2">
            <Fields>
                <asp:TemplateField HeaderText=" ID" SortExpression="Artist_ID">
                    
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Artist_ID") %>'></asp:TextBox>
                        &nbsp;
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Must have a unique ID" ControlToValidate="TextBox4" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ErrorMessage="Must be a unique number" ControlToValidate="TextBox4" Display="Dynamic" ForeColor="#CC0000" Operator="DataTypeCheck" Type="Integer">Must be a number</asp:CompareValidator>
                        </InsertItemTemplate>
                    
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Artist First Name" SortExpression="Artist_First_Name">
                    
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Artist_First_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Must have First Name" ControlToValidate="TextBox3" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Artist Last Name" SortExpression="Artist_Last_Name">
                   
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Artist_Last_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Required Last Name" ControlToValidate="TextBox2" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" ArtistType" SortExpression="ArtistType_ID">
                    
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ArtistType_ID") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Must have a Type" ForeColor="#CC0000" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator runat="server" ErrorMessage="1(solo) or 2(group)" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="#CC0000" MaximumValue="2" MinimumValue="1">1(solo) or 2(group)</asp:RangeValidator>
                    </InsertItemTemplate>
                    
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </form>
    <!-- end form -->
</asp:Content>