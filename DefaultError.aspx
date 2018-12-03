<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultError.aspx.cs" Inherits="Error" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        
    <div class="form-title"><h1>Oops, Something Went Wrong!</h1>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        Details:
        <p>&nbsp;</p>
    <p><asp:Label ID="lblError" runat="server"></asp:Label></p>
    </div>
    
</asp:Content>