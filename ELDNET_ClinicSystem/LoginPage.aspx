<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ELDNET_ClinicSystem.LoginPage" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
    <style>
.content {
  max-width: 500px;
  margin: auto;
}
</style>
<body>
    <div class="content">

    <form id="form1" runat="server">
        <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3" colspan="2">
                            <h1>
                                <img alt="" class="auto-style8" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" /></h1>
                            <h1 class="auto-style1">
                                Member Login</h1>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="userNameLabel" runat="server" Text="Username"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style6">
                            <strong>
                            <asp:TextBox ID="LoginUsername" placeholder="Username" runat="server" OnTextChanged="LoginUsername_TextChanged"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="userNameRequiredFieldValidator" runat="server" ControlToValidate="LoginUsername" ErrorMessage="Please enter Username" ForeColor="Red" SetFocusOnError="True">*Required</asp:RequiredFieldValidator>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="passWordLabel" runat="server" Text="Password"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style6">
                            <strong>
                            <asp:TextBox ID="LoginPassword" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="passWordRequiredFieldValidator" runat="server" ControlToValidate="LoginPassword" ErrorMessage="Please enter Password" ForeColor="Red" SetFocusOnError="True">*Required</asp:RequiredFieldValidator>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="250px" Height="25px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style9">
                            <asp:Button ID="Button2" runat="server" Text="Register" Width="250px" OnClick="Button2_Click" Height="25px" OnClientClick="~/MemberRegistration.aspx" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    </form>
          <!-- Page content -->
</div>
</body>
</html>
