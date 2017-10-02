<%@ Page Title="Make Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="M06_Roles.Tipster.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <asp:MultiView ID="mtvMakeTips" ActiveViewIndex="0" runat="server">
        <asp:View ID="viewSelectTippingRound" runat="server" OnActivate="viewSelectTippingRound_Activate">
            <h3>Round View</h3>
            <br />
            <%--The ‘Activate’ event handler of View 1 should check whether this logged-in tipster has tipped for all rounds. If so, a message should be displayed in View 1 advising the tipster about this, and the dropdown list and the ‘Make Tips’ button should be made invisible.--%>

            <div class="container">
                <div class="row">
                    <asp:Label ID="Label1" AssociatedControlID="ddlTippingRounds" runat="server" Text="Pick a round:" CssClass="control-label col-md-2"></asp:Label>
                    <div class="col-md-2 text-md-center">
                        <asp:DropDownList ID="ddlTippingRounds" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID" CssClass="form-control "></asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="col-md-1 col-md-offset-2">
                    <asp:Button ID="btnSelectRound" runat="server" Text="Make Tips" CssClass="btn btn-primary" OnClick="btnSelectRound_Click" />
                </div>
                <asp:Label ID="lblResult" runat="server" />
            </div>
        </asp:View>

        <asp:View runat="server">
            <h3>Tipping View</h3>
            <br />

            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" DataKeyName="roundID">
                <ItemTemplate>
                    <div class="container">
                        <%--Column Titles Row--%>

                        <div class="row">

                            <%--row number--%>
                            <div class="col-md-2">
                                <asp:Label Text="Row Number" CssClass="control-label" runat="server" />
                            </div>

                            <%--home team--%>
                            <div class="col-md-2">
                                <asp:Label runat="server" CssClass="control-label" Text='Home Team' />
                            </div>

                            <%--away team--%>
                            <div class="col-md-2">
                                <asp:Label runat="server" CssClass="control-label" Text='Away Team' />
                            </div>

                            <%--Tip--%>
                            <div class="col-md-3">
                                <asp:Label runat="server" CssClass="control-label" Text='Tip' />
                            </div>

                            <%--margin--%>
                            <div class="col-md-2">
                                <asp:Label runat="server" CssClass="control-label" Text="Margin" />
                            </div>

                        </div>
                        <hr />

                        <% for (int i = 0; i < 9; i++)
                            {
                        %>
                        <div class="row">

                            <%--row number--%>
                            <span class="control-label col-md-2"><%=i+1%></span>
                            <%--<asp:Label  Text='<%=i+1%>' CssClass="control-label col-md-2" runat="server"  />--%>

                            <%--home team--%>
                            <asp:Label runat="server" CssClass="control-label col-md-2" Text='<%#Eval("home1") %>' />

                            <%--away team--%>
                            <asp:Label runat="server" CssClass="control-label col-md-2" Text='<%#Eval("away1") %>' />

                            <%--result--%>
                            <div class="col-md-3">
                                <asp:DropDownList runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Please select" Selected="True" />
                                    <asp:ListItem Text="Win" />
                                    <asp:ListItem Text="Draw" />
                                    <asp:ListItem Text="Lose" />
                                </asp:DropDownList>
                            </div>

                            <%--margin--%>
                            <div class="col-md-2">
                                <asp:TextBox runat="server" CssClass="form-control" />
                            </div>

                        </div>

                        <%
                            } %>
                        <hr />
                        <div class="row">
                            <asp:Button ID="btnSubmitTips" Text="Submit" CssClass="btn btn-primary col-md-2 col-md-offset-5" runat="server" OnClick="btnSubmitTips_Click" />
                            <asp:Button ID="btnSelectRound2" Text="Select Round" CssClass="btn btn-primary col-md-3 col-md-offset-1" runat="server" OnClick="btnSelectRound2_Click"/>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT * FROM [fixtures] WHERE ([roundID] = @roundID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTippingRounds" Name="roundID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>

    </asp:MultiView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT roundID FROM fixtures WHERE (roundID NOT IN (SELECT roundID FROM tips))"></asp:SqlDataSource>

</asp:Content>
