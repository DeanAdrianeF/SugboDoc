<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MembershipRegistration.aspx.cs" Inherits="ELDNET_ClinicSystem.MembershipRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        #Label3{
            font-size: 15px;
        }
        .auto-style1 {
            background-color: #1f1f1f;
            height: 619px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .auto-style2 {
            width: auto;
            height: 20px;
            background-color: white;
        }
        .auto-style3 {
            text-align: center;
            height: 36px;
        }
        
        #Button1:hover{
            background-color: #8e8e8e;
        }

        #Button2:hover{
            background-color: #8e8e8e;
        }
        .auto-style20 {
            width: 112px;
            text-align: right;
            height: 42px;
        }
        .auto-style21 {
            width: 199px;
            text-align: left;
            height: 42px;
        }
        .auto-style24 {
            height: 25px;
        }
        .auto-style25 {
            height: 19px;
        }
        .auto-style26 {
            width: 112px;
            text-align: right;
            height: 43px;
        }
        .auto-style27 {
            width: 199px;
            text-align: left;
            height: 43px;
        }
        .auto-style30 {
            width: 112px;
            text-align: right;
            height: 40px;
        }
        .auto-style31 {
            width: 199px;
            text-align: left;
            height: 40px;
        }
        .auto-style8 {
            width: 84px;
            height: 62px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style3" colspan="2">
                            <h1>
                                <img alt="" class="auto-style8" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" />Member Registration</h1>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style30">
                            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style31">
                            <strong>
                            <asp:TextBox ID="TextBox1" runat="server" Width="167px" placeholder="Username" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True" ></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Enter Username" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">*Required</asp:RequiredFieldValidator>
                            &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style20">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style21">
                            <strong>
                            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" Width="167px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True">*Required</asp:RequiredFieldValidator>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style26">
                            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                            <br />
                            <br />
                        </td>
                        <td class="auto-style27">
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Re-type Password" Width="167px" TextMode="Password"></asp:TextBox>
                            <br />
                            <strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Please Re-type password" ForeColor="Red" SetFocusOnError="True">*Please Re-type Password</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Password not match" ForeColor="Red" SetFocusOnError="True">*Password does not match</asp:CompareValidator>
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style24">
                            <asp:Button ID="registerButton" runat="server" Text="Register" Width="250px" BorderStyle="None" Height="25px" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style24">
                            <asp:Button ID="Button2" runat="server" Text="Login" Width="250px" BorderStyle="None" Height="25px" OnClick="Button2_Click" OnClientClick="~/Login.aspx" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style25">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>