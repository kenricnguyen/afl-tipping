﻿<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AFLTippingSite.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />

        <%--Email group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" >test001@gmail.com</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>

        <%--Password group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password"  CssClass="form-control" >Whatever1.</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>

        <%--confirm password group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" >Whatever1.</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <%--Given name group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtGivenName" CssClass="col-md-2 control-label">Given name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtGivenName" CssClass="form-control" >john</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtGivenName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Given name is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtGivenName" CssClass="text-danger" ErrorMessage="English letters, apostrophe and hyphen only" ValidationExpression="^[a-zA-Z-']{1,20}$"></asp:RegularExpressionValidator>
            </div>
        </div>

        <%--Family name group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFamilyName" CssClass="col-md-2 control-label">Family name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFamilyName" CssClass="form-control" >doe</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFamilyName"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Family name is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtFamilyName" CssClass="text-danger" ErrorMessage="English letters, apostrophe and hyphen only" ValidationExpression="^[a-zA-Z-']{1,20}$"></asp:RegularExpressionValidator>
            </div>
        </div>

        <%--Birthday group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBirthday" CssClass="col-md-2 control-label">Birthday</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBirthday" CssClass="form-control" Width="280" >01/01/1980</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBirthday"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Birthday is required." />

                <%--**Need to implement Compare Validator here--%>
            </div>
        </div>

        <%--Address group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtAddress" CssClass="col-md-2 control-label">Address</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" >test001 avenue</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Address is required." />

            </div>
        </div>

        <%--Suburb group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSuburb" CssClass="col-md-2 control-label">Suburb</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtSuburb" CssClass="form-control" >nothingville</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtSuburb"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="Suburb is required." />

            </div>
        </div>

        <%--State group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlState" CssClass="col-md-2 control-label">State</asp:Label>
            <div class="col-xs-10">
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" Width="280">
                    <asp:ListItem>Please Select</asp:ListItem>
                    <asp:ListItem Selected="True">NSW</asp:ListItem>
                    <asp:ListItem>QLD</asp:ListItem>
                    <asp:ListItem>SA</asp:ListItem>
                    <asp:ListItem>TAS</asp:ListItem>
                    <asp:ListItem>VIC</asp:ListItem>
                    <asp:ListItem>WA</asp:ListItem>
                    <asp:ListItem>NT</asp:ListItem>
                    <asp:ListItem>ACT</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlState"
                    CssClass="text-danger" ErrorMessage="State required" InitialValue="Please Select"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--PostCode group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPostCode" CssClass="  col-md-2 control-label">Post Code</asp:Label>
            <div class="col-xs-10">
                <asp:TextBox ID="txtPostCode" CssClass="form-control" runat="server">0000</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPostCode"
                    CssClass="text-danger" ErrorMessage="Postcode required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPostCode"
                    CssClass="text-danger" ErrorMessage="4 digit number only" ValidationExpression="\d{4}">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <%--Phone group--%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMobilePhone" CssClass="col-md-2 control-label">Mobile Phone</asp:Label>
            <div class="col-xs-10">
                <asp:TextBox ID="txtMobilePhone" CssClass="form-control" runat="server">0404123456</asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobilePhone"
                    CssClass="text-danger" ErrorMessage="Mobile Phone required">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMobilePhone" ErrorMessage="Must be in the format of 04dddddddd, where 'd' is a digit" CssClass="text-danger" ValidationExpression="(04)\d{8}"></asp:RegularExpressionValidator>

                <%--More regex is required to validate phone number--%>
            </div>
        </div>

        <%--Register button group--%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
