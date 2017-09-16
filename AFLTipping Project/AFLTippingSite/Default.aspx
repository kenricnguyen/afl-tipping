<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AFLTippingSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div runat="server" id="anonymousDiv" Visible="false">
    This is an AFL tipping website. In order to access greater functionality please log in as an administrator or tipster.
</div>

<div runat="server" id="tipsterDiv" Visible="false">
    <h3>Welcome, <%: Context.User.Identity.GetUserName() %> !</h3>
    Home: Will take you to this page, describing each of the pages and links.<br />
    Fixtures: Will allow you look at the fixtures of any AFL round. <br />
    Make Tips: Where you go to make your tips.<br />
    MyTips: Where you go to view your submitted tips. <br />
    My Ranks: Show the ranking of all tipsters for a given round<br />
    Logout: Logs you out of the site.
</div>

<div runat="server" id="adminDiv" Visible="false">
    <h3>Welcome, <%: Context.User.Identity.GetUserName() %> !</h3>
    Home: Will take you to this page, describing each of the pages and links. <br />
    Modify Tips: Allows you to delete, insert or modify tips.<br />
    Statistics: Will allow you look at the statistics of user tips. <br />
    Logout: Logs you out of the site.
</div>

</asp:Content>
