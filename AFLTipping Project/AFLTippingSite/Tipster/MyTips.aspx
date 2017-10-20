<%@ Page Title="My Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTips.aspx.cs" Inherits="M06_Roles.MyTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <h3>Select a round</h3>
    <br />
    <div class="container">
        <div class="col-md-2">
            <asp:Label Text="Round Id:" runat="server" CssClass="control-label" AssociatedControlID="DropDownList1" />
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" CssClass="form-control"  AutoPostBack="false" />
        </div>
        <asp:Button ID="Button1" runat="server" Text="View" CssClass="btn btn-primary" OnClick="Button1_Press" />
    </div>    
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE [username] = @username ORDER BY [roundID]">
        <SelectParameters>
            <asp:Parameter Name="username" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Literal ID="PageText" runat="server"></asp:Literal>
    <table id="TipsTable" class="table" runat="server">
        <tr>
            <td>
                <asp:Label ID="rowNumberHeading" Text="<b>Game</b>" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeamHeading" Text="<b>Home</b>" runat="server" />
            </td>
            <td>
                <asp:Label ID="windorlossHeading" Text="<b>Result</b>" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeamHeading" Text="<b>Away</b>" runat="server" />
            </td>
            <td>
                <asp:Label ID="marginHeading" Text="<b>Point Margin</b>" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber1" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam1" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss1" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam1" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin1" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber2" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam2" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss2" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam2" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin2" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber3" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam3" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss3" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam3" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin3" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber4" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam4" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss4" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam4" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin4" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber5" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam5" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss5" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam5" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin5" runat="server" />
            </td>
        </tr>
        <tr style="">
            <td>
                <asp:Label ID="rowNumber6" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam6" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss6" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam6" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin6" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber7" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam7" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss7" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam7" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin7" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber8" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam8" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss8" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam8" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin8" runat="server" />
            </td>
        </tr>

        <tr style="">
            <td>
                <asp:Label ID="rowNumber9" runat="server" />
            </td>
            <td>
                <asp:Label ID="homeTeam9" runat="server" />
            </td>
            <td>
                <asp:Label ID="winorloss9" runat="server" />
            </td>
            <td>
                <asp:Label ID="awayTeam9" runat="server" />
            </td>
            <td>
                <asp:Label ID="margin9" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
