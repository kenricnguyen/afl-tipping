<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AFLTippingSite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <div runat="server" id="anonymousDiv" visible="false">
        <p >This is an AFL tipping website. In order to access greater functionality please log in.</p>
    </div>

    <div runat="server" id="tipsterDiv" visible="false">
        <h3>Welcome, <%: Context.User.Identity.GetUserName() %> !</h3>
        <ul class="list-group">
            <li class="list-group-item"><b>Home</b>: Will take you to this page, describing each of the pages and links</li>
            <li class="list-group-item"><b>Fixtures</b>: Will allow you look at the fixtures of any AFL round.</li>
            <li class="list-group-item"><b>Make Tips</b>: Where you go to make your tips. </li>
            <li class="list-group-item"><b>MyTips</b>: Where you go to view your submitted tips.</li>
            <li class="list-group-item"><b>My Ranks</b>: Show the ranking of all tipsters for a given round </li>
            <li class="list-group-item"><b>Logout</b>: Logs you out of the site.</li>
        </ul>
    </div>

    <div runat="server" id="adminDiv" visible="false">
        <h3>Welcome, <%: Context.User.Identity.GetUserName() %> !</h3>
        <ul class="list-group">
            <li class="list-group-item"><b>Home</b>: Will take you to this page, describing each of the pages and links.</li>
            <li class="list-group-item"><b>Modify Tips</b>: Allows you to delete, insert or modify tips.</li>
            <li class="list-group-item"><b>Statistics</b>: Will allow you look at the statistics of user tips.</li>
            <li class="list-group-item"><b>Logout</b>: Logs you out of the site.</li>
        </ul>
    </div>

</asp:Content>
