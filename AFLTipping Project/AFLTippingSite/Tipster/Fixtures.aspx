<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fixtures.aspx.cs" Inherits="M06_Roles.Tipster.Fixtures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Please select the round you want to see the fixture: " Font-Bold="True"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT [roundID] FROM [fixtures]"></asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="roundID" DataValueField="roundID"></asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
        <br />
    </p>
    <div runat="server" id="fixtureDiv" visible="false">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home1, fixtures.away1, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home1 = h.teamname INNER JOIN teams AS a ON fixtures.away1 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Game 1" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home1Label" runat="server" Text='<%# Eval("home1") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away1Label" runat="server" Text='<%# Eval("away1") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home Team</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away Team</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home2, fixtures.away2, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home2 = h.teamname INNER JOIN teams AS a ON fixtures.away2 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Game 2" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home2Label" runat="server" Text='<%# Eval("home2") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away2Label" runat="server" Text='<%# Eval("away2") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home3, fixtures.away3, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home3 = h.teamname INNER JOIN teams AS a ON fixtures.away3 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Game 3" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home3Label" runat="server" Text='<%# Eval("home3") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away3Label" runat="server" Text='<%# Eval("away3") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home4, fixtures.away4, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home4 = h.teamname INNER JOIN teams AS a ON fixtures.away4 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Game 4" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource5">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home4Label" runat="server" Text='<%# Eval("home4") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away4Label" runat="server" Text='<%# Eval("away4") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home5, fixtures.away5, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home5 = h.teamname INNER JOIN teams AS a ON fixtures.away5 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Game 5" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView5" runat="server" DataSourceID="SqlDataSource6">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home5Label" runat="server" Text='<%# Eval("home5") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away5Label" runat="server" Text='<%# Eval("away5") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home6, fixtures.away6, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home6 = h.teamname INNER JOIN teams AS a ON fixtures.away6 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Game 6" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView6" runat="server" DataSourceID="SqlDataSource7">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home6Label" runat="server" Text='<%# Eval("home6") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away6Label" runat="server" Text='<%# Eval("away6") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home7, fixtures.away7, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home7 = h.teamname INNER JOIN teams AS a ON fixtures.away7 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Game 7" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView7" runat="server" DataSourceID="SqlDataSource8">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home7Label" runat="server" Text='<%# Eval("home7") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away7Label" runat="server" Text='<%# Eval("away7") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home8, fixtures.away8, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home8 = h.teamname INNER JOIN teams AS a ON fixtures.away8 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Game 8" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView8" runat="server" DataSourceID="SqlDataSource9">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home8Label" runat="server" Text='<%# Eval("home8") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away8Label" runat="server" Text='<%# Eval("away8") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />


        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:AFLTipping %>" SelectCommand="SELECT fixtures.home9, fixtures.away9, h.homestate AS h, a.homestate AS a FROM fixtures INNER JOIN teams AS h ON fixtures.home9 = h.teamname INNER JOIN teams AS a ON fixtures.away9 = a.teamname AND fixtures.roundID = @roundID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="roundID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label9" runat="server" Text="Game 9" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <br />
        <asp:ListView ID="ListView9" runat="server" DataSourceID="SqlDataSource10">
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
                    <td>
                        <asp:Label ID="home9Label" runat="server" Text='<%# Eval("home9") %>' />
                    </td>
                    <td>
                        <asp:Label ID="hLabel" runat="server" Text='<%# Eval("h") %>' />
                    </td>
                    <td>
                        <asp:Label ID="away9Label" runat="server" Text='<%# Eval("away9") %>' />
                    </td>
                    <td>
                        <asp:Label ID="aLabel" runat="server" Text='<%# Eval("a") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                    <th runat="server">Home</th>
                                    <th runat="server">Home State</th>
                                    <th runat="server">Away</th>
                                    <th runat="server">Away State</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <br />
    </div>
</asp:Content>
