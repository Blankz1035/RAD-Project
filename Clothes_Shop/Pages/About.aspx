
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Pages_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="about">
        <h1>The Six Stooges</h1>
        <ul>
            <p>This is our Server Side RAD Group Project! </p>
            <p>Group Members:</p>
            <li>Christopher Weir(Leader)</li>
            <li>Gareth Lynskey</li>
            <li>Paddy Griffin</li>
            <li>Paul Dolan</li>
            <li>Shane Gleeson</li>
            <li>Andrew Blankley</li>
        </ul>
    </div>
    <p>We chose to do a Mens Clothes Shop as the topic for our project</p>


    <h1 style="color: #3366CC;">
        Site Map</h1>
    <p class="boldTextMedium">
        Review the pages of the website</p>
    <asp:SiteMapDataSource ID="dsSiteMap" runat="server" />
    <asp:TreeView ID="Menu1" runat="server" DataSourceID="dsSiteMap" StaticDisplayLevels="5">
    </asp:TreeView>
</asp:Content>

