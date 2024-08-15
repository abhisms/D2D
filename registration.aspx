<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="project1.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Add your custom styles here if needed */
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: auto; width: 50%;">
        <h2>Registration</h2>
        <hr />

        <table class="style2"   style="border-collapse: collapse; width: 100%;">
            <tr>
                <td class="style4">Username</td>
                <td class="style5">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter username*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">Email</td>
                <td class="style5">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter email*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">Password</td>
                <td class="style5">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter password*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">Confirm Password</td>
                <td class="style5">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm password*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match." Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">Country</td>
                <td class="style5">
                    <asp:DropDownList ID="ddlCountry" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                        <asp:ListItem Text="Select Country" Value="" />
                        <asp:ListItem Text="INDIA" Value="1" />
                        <asp:ListItem Text="JAPAN" Value="2" />
                        <asp:ListItem Text="RUSSIA" Value="3" />
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <!-- Add validators if needed -->
                </td>

            </tr>
            <tr>

                <td colspan="3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClientClick="return confirm('Are you sure you want to reset?');" />
                </td>
               
                <td class="auto-style1">
  
                    <asp:HyperLink ID="HyperLink1"  style="color:black" runat="server" NavigateUrl="~/login.aspx">Click here to login&gt;</asp:HyperLink>
               </td>
            </tr>
        </table>
    </div>
</asp:Content>
