<%@ Page Title="Make Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="M06_Roles.Tipster.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <asp:MultiView ID="mtvMakeTips" ActiveViewIndex="0" runat="server">
        <asp:View ID="viewSelectTippingRound" runat="server" OnActivate="viewSelectTippingRound_Activate">
            <h3> Round View</h3>
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
            <asp:Label ID="Label2" runat="server" Text="Label">Hello, this is VIEW 2</asp:Label>
        </asp:View>

    </asp:MultiView>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT roundID FROM results WHERE (roundID NOT IN (SELECT roundID FROM tips))"></asp:SqlDataSource>

</asp:Content>
