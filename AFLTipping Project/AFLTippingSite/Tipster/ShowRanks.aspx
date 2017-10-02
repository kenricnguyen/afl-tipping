<%@ Page Title="Show Ranks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowRanks.aspx.cs" Inherits="M06_Roles.ShowRanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <%--dropdownlist to display round ids which have tips--%>

    <div class="container">

        <div class="col-md-2">
            <asp:Label Text="Round Id:" runat="server" CssClass="control-label" AssociatedControlID="ddlTippedRounds" />
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlTippedRounds" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" CssClass="form-control" OnSelectedIndexChanged="ddlTippedRounds_SelectedIndexChanged" />
        </div>

    </div>

    <%--check whether there is no tip from the current user--%>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div class="row">
                <asp:Label Text="There is no tip yet!" runat="server" CssClass="control-label col-md-2" />
            </div>
        </EmptyDataTemplate>
    </asp:FormView>

    <%--display ranking of tipster based on round id selected--%>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT RANK() OVER (PARTITION BY sub.ErrorPoints ORDER BY sub.ErrorPoints),
sub.gname, sub.sname, sub.ErrorPoints
FROM     
(
SELECT tipsters.gname, tipsters.sname, 
abs(tips.game1-results.game1)+abs(tips.game2-results.game2)+
abs(tips.game3-results.game3)+abs(tips.game4-results.game4)+ 
abs(tips.game5-results.game5)+abs(tips.game6-results.game6)+
abs(tips.game7-results.game7)+abs(tips.game8-results.game8)+
abs(tips.game9-results.game9) as ErrorPoints
FROM     results INNER JOIN
                  tips ON results.roundID = tips.roundID INNER JOIN
                  tipsters ON tips.username = tipsters.username
WHERE tips.roundID=@roundID
)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTippedRounds" Name="roundID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT [roundID] FROM [tips]"></asp:SqlDataSource>

</asp:Content>
