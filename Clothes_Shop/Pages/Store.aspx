<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Store.aspx.cs" Inherits="Pages_Store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT DISTINCT [ProductType] FROM [Products] ORDER BY [ProductType]"></asp:SqlDataSource>
    <table cellpadding="5" align="center" width="99%">
        <tr>
            <td align="center">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="ProductType" DataValueField="ProductType" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ProductId], [ProductName], [ProductPrice], [ProductImage] FROM [Products] WHERE ([ProductType] = @ProductType)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ProductType" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="font-size: larger; font-weight: bold;">
                <tr>
                    <td class="boldText">
                        No Clothes Found!
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
                            <asp:Image ID="imgClothes" runat="server" CssClass="productImage" AlternateText="Image Cover"
                                Height="300px" Width="300px" ImageUrl='<%# "~/Images/Products/" + Eval("ProductImage") %>' />
                            <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="button" BackColor="#3366CC"
                                PostBackUrl='<%# Eval("ProductId","ClothesDetail.aspx?productID={0}") %>' />
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
    <br />
    <br />
</asp:Content>
