<%@ Page Title="Make Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="M06_Roles.Tipster.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblResult" runat="server" />

            <asp:MultiView ID="mtvMakeTips" ActiveViewIndex="0" runat="server">
                <asp:View ID="viewSelectTippingRound" runat="server">
                    <asp:Panel ID="panelSelectRound" runat="server" CssClass="container">
                        <h3>Round View</h3>
                        <br />
                        <%--The ‘Activate’ event handler of View 1 should check whether this logged-in tipster has tipped for all rounds. If so, a message should be displayed in View 1 advising the tipster about this, and the dropdown list and the ‘Make Tips’ button should be made invisible.--%>
                        <div class="row">
                            <asp:Label AssociatedControlID="ddlTippingRounds" runat="server" Text="Pick a round:" CssClass="control-label col-md-2"></asp:Label>
                            <div class="col-md-2 text-md-center">
                                <asp:DropDownList ID="ddlTippingRounds" runat="server" DataSourceID="RoundDataSource" DataTextField="roundID" DataValueField="roundID" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div class="col-md-1 col-md-offset-2">
                            <asp:Button ID="btnSelectRound" runat="server" Text="Make Tips" CssClass="btn btn-primary" OnClick="btnSelectRound_Click" />
                        </div>
                    </asp:Panel>
                </asp:View>

                <asp:View runat="server" ID="displayRound">
                    <h3>
                        <asp:Label ID="lblRoundId" runat="server" />
                    </h3>
                    <asp:PlaceHolder ID="tableHolder" runat="server"></asp:PlaceHolder>
                    <br />
                    <div class="row">
                        <asp:Button ID="btnSelectRound2" Text="Select Round" CausesValidation="false" UseSubmitBehavior="false" CssClass="btn btn-default col-md-3 col-md-offset-5" runat="server" OnClick="btnSelectRound2_Click" />
                        <asp:Button ID="btnSubmitTips" Text="Submit" CssClass="btn btn-primary col-md-2 col-md-offset-1" runat="server" OnClick="btnSubmitTips_Click" />
                    </div>
                </asp:View>

            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="RoundDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.roundID FROM fixtures WHERE (roundID NOT IN (SELECT roundID FROM tips WHERE username=@username))
 ">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
