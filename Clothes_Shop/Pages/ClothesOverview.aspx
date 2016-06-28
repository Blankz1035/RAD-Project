<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClothesOverview.aspx.cs" Inherits="Pages_ClothesOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 249px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 style="color: #3366CC;">
        Clothes Overview Page</h1>
    <asp:SqlDataSource ID="dsClothesOverview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [ProductId], [ProductName], [ProductPrice], [ProductDesc],[ProductType] FROM [Products] ORDER BY [ProductId]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsClothesOverview2" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @original_ProductId AND [ProductName] = @original_ProductName AND [ProductType] = @original_ProductType AND [ProductDesc] = @original_ProductDesc AND [ProductPrice] = @original_ProductPrice AND (([ProductImage] = @original_ProductImage) OR ([ProductImage] IS NULL AND @original_ProductImage IS NULL))"
        InsertCommand="INSERT INTO [Products] ([ProductName], [ProductDesc], [ProductType], [ProductPrice], [ProductImage]) VALUES (@ProductName, @ProductDesc, @ProductType, @ProductPrice, @ProductImage)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] WHERE ([ProductId] = @ProductId)"
        UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [ProductType] = @ProductType, [ProductPrice] = @ProductPrice, [ProductImage] = @ProductImage WHERE [ProductId] = @original_ProductId AND [ProductName] = @original_ProductName AND [ProductDesc] = @original_ProductDesc AND [ProductType] = @original_ProductType AND [ProductPrice] = @original_ProductPrice AND (([ProductImage] = @original_ProductImage) OR ([ProductImage] IS NULL AND @original_ProductImage IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ProductId" Type="Int32" />
            <asp:Parameter Name="original_ProductName" Type="String" />
            <asp:Parameter Name="original_ProductDesc" Type="String" />
            <asp:Parameter Name="original_ProductType" Type="String" />
            <asp:Parameter Name="original_ProductPrice" Type="Int32" />
            <asp:Parameter Name="original_ProductImage" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductDesc" Type="String" />
            <asp:Parameter Name="ProductType" Type="String" />
            <asp:Parameter Name="ProductPrice" Type="Int32" />
            <asp:Parameter Name="ProductImage" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvwClothesOverview" Name="ProductId" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductDesc" Type="String" />
            <asp:Parameter Name="ProductType" Type="String" />
            <asp:Parameter Name="ProductPrice" Type="Int32" />
            <asp:Parameter Name="ProductImage" Type="String" />
            <asp:Parameter Name="original_ProductId" Type="Int32" />
            <asp:Parameter Name="original_ProductName" Type="String" />
            <asp:Parameter Name="original_ProductDesc" Type="String" />
            <asp:Parameter Name="original_ProductType" Type="String" />
            <asp:Parameter Name="original_ProductPrice" Type="Int32" />
            <asp:Parameter Name="original_ProductImage" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table>
        <tr>
            <td class="style1">
                <asp:GridView ID="gvwClothesOverview" runat="server" AutoGenerateColumns="False" CellPadding="6"
                    DataKeyNames="ProductId" DataSourceID="dsClothesOverview" ForeColor="#333333" GridLines="None"
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="ProductId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ProductId" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:BoundField DataField="ProductType" HeaderText="ProductType" SortExpression="ProductType" />
                        <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" />
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="boldTextSmall buttonSmall"
                            ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#FFFFFF" />
                    <FooterStyle BackColor="#3366CC" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#3366CC" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td style="padding-left: 55px;">
                <asp:DetailsView ID="dvwClothesOverview" runat="server" AutoGenerateRows="False" BackColor="White"
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" DataKeyNames="ProductId"
                    DataSourceID="dsClothesOverview2" Width="720px" Height="500px" OnItemDeleted="dvwClothesOverview_ItemDeleted"
                    OnItemInserted="dvwClothesOverview_ItemInserted" OnItemUpdated="dvwClothesOverview_ItemUpdated"
                    ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <EditRowStyle BackColor="#999999" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:TemplateField HeaderText="ProductId" InsertVisible="False" SortExpression="ProductId">
                            <EditItemTemplate>
                                <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductName" runat="server" ControlToValidate="txtProductName"
                                    ErrorMessage="Product Name is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductName" runat="server" ControlToValidate="txtProductName"
                                    ErrorMessage="Product Name is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductDesc" SortExpression="ProductDesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductDesc" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductDesc" runat="server" ControlToValidate="txtProductDesc"
                                    ErrorMessage="Product Description is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProductDesc" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductDesc" runat="server" ControlToValidate="txtProductDesc"
                                    ErrorMessage="Product Description is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductDesc" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductType" SortExpression="ProductType">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductType" runat="server" Text='<%# Bind("ProductType") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductType" runat="server" ControlToValidate="txtProductType"
                                    ErrorMessage="Product Type is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProductType" runat="server" Text='<%# Bind("ProductType") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductType" runat="server" ControlToValidate="txtProductType"
                                    ErrorMessage="Product Type is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductType" runat="server" Text='<%# Bind("ProductType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductPrice" SortExpression="ProductPrice">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductPrice" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductPrice" runat="server" ControlToValidate="txtProductPrice"
                                    ErrorMessage="Product Price is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorNumber" runat="server" ControlToValidate="txtProductPrice"
                                    Display="Dynamic" ErrorMessage="Product Price Must Be a Number" Operator="DataTypeCheck"
                                    Type="Integer" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProductPrice" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductPrice" runat="server" ControlToValidate="txtProductPrice"
                                    ErrorMessage="Product Price is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorAge" runat="server" ControlToValidate="txtProductPrice"
                                    Display="Dynamic" ErrorMessage="Product Price Must Be a Number" Operator="DataTypeCheck"
                                    Type="Integer" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductPrice" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductImage" SortExpression="ProductImage">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductImage" runat="server" Text='<%# Bind("ProductImage") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductImage" runat="server" ControlToValidate="txtProductImage"
                                    ErrorMessage="Product Image is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProductImage" runat="server" Text='<%# Bind("ProductImage") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredProductImage" runat="server" ControlToValidate="txtProductImage"
                                    ErrorMessage="Product Image is required" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblProductImage" runat="server" Text='<%# Bind("ProductImage") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="boldTextSmall buttonSmall"
                            ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                </asp:DetailsView>
            </td>
        </tr>
    </table>
</asp:Content>

