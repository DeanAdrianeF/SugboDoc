<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOutMenu.aspx.cs" Inherits="ELDNET_ClinicSystem.CheckOutMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Out Menu</title>
    <style type="text/css">
        .auto-style1 {
            background-color: #1f1f1f;
            height: 619px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .auto-style2 {
            width: 408px;
            height: 50%;
            border-color: #FFFFFF;
            background-color: #FFFFFF;
        }
        .auto-style3 {
            height: 83px;
            text-align: left;
            width: 203px;
        }
        .auto-style4 {
            width: 84px;
            height: 62px;
            float: right;
        }
        .auto-style5 {
            height: 83px;
            width: 90px;
        }

        #Button1{
            width:100%;
            height:100%;
        }

        #Button2{
            width:100%;
            height:100%;
        }

        #Button3{
            width:100%;
            height:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table align="center" class="auto-style2">
                <tr>
                    <td class="auto-style5">
                        <img alt="" class="auto-style4" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" /></td>
                    <td class="auto-style3">
                        <h2>CHECK OUT MENU</h2>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <marquee direction="left"><strong>P L E A S E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S E L E C T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T R A N S A C T I O N</strong></marquee>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="PRESCRIPTION" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button2" runat="server" Text="BILLING" OnClick="Button2_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button3" runat="server" Text="EXIT" OnClick="Button3_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
