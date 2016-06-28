<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #3366CC;">
        Welcome to The Six Stooges Mens Clothes Shop</h1>
    <p class="boldTextMedium">
        Below is a list of our featured clothes! We strive to provide the very best!. Browse through our website and see what we can offer you today....</p>
    <h2 style="color: #3366CC;">
        Featured Clothes</h2>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [ProductId], [ProductName], [ProductPrice], [ProductImage] FROM [Products] ORDER BY [ProductPrice]">
        </asp:SqlDataSource>
    </div>
    <asp:ListView ID="lvwClothes" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td id="Td1" runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td>
                <table class="displayClothesTable-1">
                    <tr>
                        <td class="displayClothesTable-2">
                        <asp:Label ID="LblID" runat="server" Text='<%# Eval("ProductId") %>' /><br />
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>' /><br />
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("ProductPrice","{0:c}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="displayClothesTable-3">
                            <asp:Image ID="imgClothes" runat="server" CssClass="productImage" Height="150px" Width="150px" ImageUrl='<%# "~/Images/Products/" + Eval("ProductImage") %>' /><br />
                            <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="button" BackColor="#3366CC"
                                Font-Bold="true" PostBackUrl='<%# Eval("ProductId","ClothesDetail.aspx?productID={0}") %>' />
                        </td>
                    </tr>
                </table>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td2" runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td3" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="boldTextSmall buttonPager"
                                    ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
