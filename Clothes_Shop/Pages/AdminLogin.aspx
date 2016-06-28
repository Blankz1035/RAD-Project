<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Pages_AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1 align ="center" class="pageLabelColor">
        Admin Login</h1>
    <div>
        <table align="center">
            <tr>
                <td style="font-weight: bold; text-align: right;">
                    <asp:Label ID="lblResult" runat="server" CssClass="boldTextMedium"></asp:Label>
                    <asp:Label ID="lblEmail" runat="server" CssClass="pageLabelColor boldTextMedium">Email: </asp:Label>
                </td>
                <td width="180px">
                    <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox><br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="E-Mail is required " Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Not a valid Email Address!"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Bold="True"
                    ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="font-weight: bold; text-align: right;">
                    <asp:Label ID="lblPassword" runat="server" CssClass="pageLabelColor boldTextMedium">Password: </asp:Label>
                </td>
                <td width="180px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="Password is required " Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <br />
                    <asp:Button ID="btnLogin" runat="server" CssClass="boldTextSmall buttonSmall" Text="Login"
                        Width="96px" OnClick="Button_Login_Click" Font-Bold="True" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0000CC" NavigateUrl="~/Pages/AdminRegistration.aspx"
                        CssClass="boldTextMedium">Register New Admin Here!</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

