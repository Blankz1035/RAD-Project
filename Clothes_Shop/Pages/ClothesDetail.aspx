<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClothesDetail.aspx.cs" Inherits="Pages_ClothesDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="color: #3366CC;">
       Clothes Details</h1>
    <asp:SqlDataSource ID="ClothesDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ProductName], [ProductId], [ProductDesc],[ProductType], [ProductImage], [ProductPrice]FROM [Products] WHERE ([ProductId] = @ProductId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductId" QueryStringField="productID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="lvwClothesDetails" runat="server" DataSourceID="ClothesDetail" GroupItemCount="3">
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
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
                <table class="displayClothesDetails">
                    <tr>
                        <td class="displayClothesTable-2">
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>' /><br />
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("ProductPrice","{0:c}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="displayClothesTable-3">
                            <asp:Image ID="imgClothes" runat="server" CssClass="productImage" ImageUrl='<%# "~/Images/Products/" + Eval("ProductImage") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="displayClothesTable-4">
                            <asp:Label ID="lblDesc" runat="server" Text='<%# "Desc: "+ Eval("ProductDesc") %>' />
                            <br />
                            <br />
                            <asp:Label ID="lblID" runat="server" Text='<%# "Product ID: " + Eval("ProductId") %>' />
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
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <div style="width: 100%; text-align: center;">
        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="button"
            BackColor="#3366CC" OnClick="AddToCart_Click" />
    </div>
</asp:Content>

