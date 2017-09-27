<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeTips.aspx.cs" Inherits="M06_Roles.Tipster.MakeTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="roundID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="roundID" HeaderText="roundID" ReadOnly="True" SortExpression="roundID" />
                </Columns>
            </asp:GridView>--%>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT roundID FROM results WHERE (roundID NOT IN (SELECT roundID FROM tips))"></asp:SqlDataSource>

</asp:Content>
