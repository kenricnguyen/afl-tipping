<%@ Page Title="Modify Tips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyTips.aspx.cs" Inherits="M06_Roles.ModifyTips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2><%: Title %></h2>
            <hr />
            <h3>Delete, edit or insert tips from below</h3>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="tipsetID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditItem" CausesValidation="True" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" />
                        </td>
                        <td>
                            <asp:Label ID="tipsetIDLabel1" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>

                        <td>
                            <asp:TextBox ID="usernameTextBox1Edit" runat="server" Text='<%# Bind("username") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdit" runat="server" ErrorMessage="A username is required" ControlToValidate="usernameTextBox1Edit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1Edit" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="usernameTextBox1Edit" ValidationGroup="EditItem" ValidationExpression=".+\@.+\..+" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="roundIDTextBoxEdit" runat="server" Text='<%# Bind("roundID") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2Edit" runat="server" ErrorMessage="A roundID is required" ControlToValidate="roundIDTextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1Edit" runat="server" ErrorMessage="Please enter a value between 1 and 20" ControlToValidate="roundIDTextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="1" MaximumValue="20" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game1TextBoxEdit" runat="server" Text='<%# Bind("game1") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game1TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game1TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game2TextBoxEdit" runat="server" Text='<%# Bind("game2") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game2TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator3Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game2TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game3TextBoxEdit" runat="server" Text='<%# Bind("game3") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game3TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator4Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game3TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game4TextBoxEdit" runat="server" Text='<%# Bind("game4") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game4TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator5Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game4TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game5TextBoxEdit" runat="server" Text='<%# Bind("game5") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game5TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator10Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game5TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game6TextBoxEdit" runat="server" Text='<%# Bind("game6") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game6TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator6Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game6TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game7TextBoxEdit" runat="server" Text='<%# Bind("game7") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game7TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator7Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game7TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game8TextBoxEdit" runat="server" Text='<%# Bind("game8") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game8TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator8Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game8TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game9TextBoxEdit" runat="server" Text='<%# Bind("game9") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10Edit" runat="server" ErrorMessage="This field is required" ControlToValidate="game9TextBoxEdit" ValidationGroup="EditItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator9Edit" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game9TextBoxEdit" ValidationGroup="EditItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertItem" CausesValidation="True" CssClass="btn btn-primary" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="False" CssClass="btn" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A username is required" ControlToValidate="usernameTextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="usernameTextBox" ValidationGroup="InsertItem" ValidationExpression=".+\@.+\..+" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="roundIDTextBox" runat="server" Text='<%# Bind("roundID") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A roundID is required" ControlToValidate="roundIDTextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please enter a value between 1 and 20" ControlToValidate="roundIDTextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="1" MaximumValue="20" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game1TextBox" runat="server" Text='<%# Bind("game1") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" ControlToValidate="game1TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game1TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game2TextBox" runat="server" Text='<%# Bind("game2") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required" ControlToValidate="game2TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game2TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game3TextBox" runat="server" Text='<%# Bind("game3") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required" ControlToValidate="game3TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game3TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game4TextBox" runat="server" Text='<%# Bind("game4") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required" ControlToValidate="game4TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator5" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game4TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game5TextBox" runat="server" Text='<%# Bind("game5") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required" ControlToValidate="game5TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator10" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game5TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game6TextBox" runat="server" Text='<%# Bind("game6") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="This field is required" ControlToValidate="game6TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator6" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game6TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game7TextBox" runat="server" Text='<%# Bind("game7") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="This field is required" ControlToValidate="game7TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator7" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game7TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game8TextBox" runat="server" Text='<%# Bind("game8") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required" ControlToValidate="game8TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator8" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game8TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="game9TextBox" runat="server" Text='<%# Bind("game9") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="This field is required" ControlToValidate="game9TextBox" ValidationGroup="InsertItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator9" runat="server" ErrorMessage="Please enter an integer between -200 and 200" ControlToValidate="game9TextBox" ValidationGroup="InsertItem" Type="Integer" MinimumValue="-200" MaximumValue="200" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="False" CssClass="btn btn-warning" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="False" UseSubmitBehavior="False" CssClass="btn" />
                        </td>
                        <td>
                            <asp:Label ID="tipsetIDLabel" runat="server" Text='<%# Eval("tipsetID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roundIDLabel" runat="server" Text='<%# Eval("roundID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game1Label" runat="server" Text='<%# Eval("game1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game2Label" runat="server" Text='<%# Eval("game2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game3Label" runat="server" Text='<%# Eval("game3") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game4Label" runat="server" Text='<%# Eval("game4") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game5Label" runat="server" Text='<%# Eval("game5") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game6Label" runat="server" Text='<%# Eval("game6") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game7Label" runat="server" Text='<%# Eval("game7") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game8Label" runat="server" Text='<%# Eval("game8") %>' />
                        </td>
                        <td>
                            <asp:Label ID="game9Label" runat="server" Text='<%# Eval("game9") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server" style="">
                            <th runat="server"></th>
                            <th runat="server">tipsetID</th>
                            <th runat="server">username</th>
                            <th runat="server">roundID</th>
                            <th runat="server">game1</th>
                            <th runat="server">game2</th>
                            <th runat="server">game3</th>
                            <th runat="server">game4</th>
                            <th runat="server">game5</th>
                            <th runat="server">game6</th>
                            <th runat="server">game7</th>
                            <th runat="server">game8</th>
                            <th runat="server">game9</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="width: 50px"></td>
                        </tr>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" DeleteCommand="DELETE FROM [tips] WHERE [tipsetID] = @tipsetID" InsertCommand="INSERT INTO [tips] ([username], [roundID], [game1], [game2], [game3], [game4], [game5], [game6], [game7], [game8], [game9]) VALUES (@username, @roundID, @game1, @game2, @game3, @game4, @game5, @game6, @game7, @game8, @game9)" SelectCommand="SELECT [tipsetID], [username], [roundID], [game1], [game2], [game3], [game4], [game5], [game6], [game7], [game8], [game9] FROM [tips]" UpdateCommand="UPDATE [tips] SET [username] = @username, [roundID] = @roundID, [game1] = @game1, [game2] = @game2, [game3] = @game3, [game4] = @game4, [game5] = @game5, [game6] = @game6, [game7] = @game7, [game8] = @game8, [game9] = @game9 WHERE [tipsetID] = @tipsetID">
        <DeleteParameters>
            <asp:Parameter Name="tipsetID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="game1" Type="Int32" />
            <asp:Parameter Name="game2" Type="Int32" />
            <asp:Parameter Name="game3" Type="Int32" />
            <asp:Parameter Name="game4" Type="Int32" />
            <asp:Parameter Name="game5" Type="Int32" />
            <asp:Parameter Name="game6" Type="Int32" />
            <asp:Parameter Name="game7" Type="Int32" />
            <asp:Parameter Name="game8" Type="Int32" />
            <asp:Parameter Name="game9" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="roundID" Type="Int32" />
            <asp:Parameter Name="game1" Type="Int32" />
            <asp:Parameter Name="game2" Type="Int32" />
            <asp:Parameter Name="game3" Type="Int32" />
            <asp:Parameter Name="game4" Type="Int32" />
            <asp:Parameter Name="game5" Type="Int32" />
            <asp:Parameter Name="game6" Type="Int32" />
            <asp:Parameter Name="game7" Type="Int32" />
            <asp:Parameter Name="game8" Type="Int32" />
            <asp:Parameter Name="game9" Type="Int32" />
            <asp:Parameter Name="tipsetID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
