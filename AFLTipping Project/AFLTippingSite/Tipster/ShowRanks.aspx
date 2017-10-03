<%@ Page Title="Show Ranks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowRanks.aspx.cs" Inherits="M06_Roles.ShowRanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <%--dropdownlist to display round ids which have tips--%>
            <h3>Select a round</h3>
            <br />
            <div class="container">

                <div class="col-md-2">
                    <asp:Label Text="Round Id:" runat="server" CssClass="control-label" AssociatedControlID="ddlTippedRounds" />
                </div>

                <div class="col-md-2">
                    <asp:DropDownList ID="ddlTippedRounds" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" CssClass="form-control" OnSelectedIndexChanged="ddlTippedRounds_SelectedIndexChanged" AutoPostBack="true" />
                </div>

            </div>
            <br />
            <h3>Ranking for the selected round</h3>
            <br />
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
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="Rank" HeaderText="Rank" ReadOnly="True" SortExpression="Rank" />
                    <asp:BoundField DataField="gname" HeaderText="First Name" SortExpression="gname" />
                    <asp:BoundField DataField="sname" HeaderText="Family Name" SortExpression="sname" />
                    <asp:BoundField DataField="ErrorPoints" HeaderText="Error Points" ReadOnly="True" SortExpression="ErrorPoints" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT RANK() OVER (ORDER BY (abs(tips.game1 - results.game1) + abs(tips.game2 - results.game2) + abs(tips.game3 - results.game3) + abs(tips.game4 - results.game4) + abs(tips.game5 - results.game5) + abs(tips.game6 - results.game6) + abs(tips.game7 - results.game7) + abs(tips.game8 - results.game8) + abs(tips.game9 - results.game9)) ASC) AS Rank, tipsters.gname, tipsters.sname,( abs(tips.game1 - results.game1) + abs(tips.game2 - results.game2) + abs(tips.game3 - results.game3) + abs(tips.game4 - results.game4) + abs(tips.game5 - results.game5) + abs(tips.game6 - results.game6) + abs(tips.game7 - results.game7) + abs(tips.game8 - results.game8) + abs(tips.game9 - results.game9)) AS ErrorPoints FROM results INNER JOIN tips ON results.roundID = tips.roundID INNER JOIN tipsters ON tips.username = tipsters.username WHERE tips.roundID =@roundID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTippedRounds" Name="roundID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT [roundID] FROM [tips] WHERE username=@username">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
