<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="M06_Roles.Admin.Statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <h2>Chart Statistics</h2>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Select Chart Type: "></asp:Label>
            <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Column</asp:ListItem>
                <asp:ListItem>Pie</asp:ListItem>
                <asp:ListItem>Line</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Select Dimenson: "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                <asp:ListItem>2D</asp:ListItem>
                <asp:ListItem>3D</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.roundID AS Category, COUNT(*) AS Count FROM fixtures INNER JOIN tips ON fixtures.roundID = tips.roundID GROUP BY fixtures.roundID"></asp:SqlDataSource>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <Titles>
                    <asp:Title Text="The number of tip sets for each round" ForeColor="Red"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" XValueMember="Category" YValueMembers="Count"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Round ID" TitleForeColor="Red"></AxisX>
                        <AxisY Title="Number of tip sets" TitleForeColor="red"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <br />

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT DATENAME(Weekday, tiptime) AS Category2, Count(*) As Count2  FROM tips GROUP BY DATENAME(weekday, tiptime)"></asp:SqlDataSource>
            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                <Titles>
                    <asp:Title Text="The number of tip sets submitted on each weekday" ForeColor="Red"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series2" XValueMember="Category2" YValueMembers="Count2"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea2">
                        <AxisX Title="Weekday" TitleForeColor="Red"></AxisX>
                        <AxisY Title="Number of tip sets" TitleForeColor="red"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
