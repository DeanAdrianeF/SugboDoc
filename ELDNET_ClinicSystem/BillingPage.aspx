<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingPage.aspx.cs" Inherits="ELDNET_ClinicSystem.BillingPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #48856c;
            height: auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .auto-style2 {
            width: 680px;
            height: 80%;
            border: 1px solid #48E5A4;
            background-color: #48E5A4;
        }
        .auto-style3 {
            text-align: center;
            height: 77px;
        }
        .auto-style6 {
            height: 59px;
            width: 245px;
            text-align: center;
        }
        .auto-style7 {
            height: 59px;
            width: 246px;
            text-align: center;
        }
        .auto-style9 {
            width: 245px;
        }
        .auto-style10 {
            width: 246px;
        }
        .auto-style12 {
            height: 59px;
            width: 35px;
        }
        .auto-style13 {
            width: 35px;
        }
        .auto-style26 {
            width: 100%;
        }
        .auto-style28 {
            width: 35px;
            height: 108px;
        }
        .auto-style29 {
            height: 108px;
        }
        .auto-style31 {
            height: 65px;
        }
        .auto-style32 {
            height: 65px;
            width: 35px;
        }
        .auto-style34 {
            height: 30px;
        }
        .auto-style35 {
            height: 30px;
            width: 35px;
        }
        .auto-style36 {
            width: 246px;
            text-align: right;
        }
        .auto-style37 {
            text-align: center;
        }
        .auto-style38 {
            height: 16px;
            text-align: left;
        }
        .auto-style39 {
            height: 16px;
            width: 35px;
        }
        .auto-style40 {
            text-align: left;
        }
        #BillingGridview
        {
            width: 100%;
        }
        .auto-style43 {
            text-align: right;
            width: 97px;
        }
        #Panel1
        {
            Width: 100%;
        }
        #Panel2
        {
            width: 100%;
        }
        #BillingPatCodetb
        {
            width: 70%;
        }
        #BillingPatNametb
        {
            width: 70%;
        }
        #BillingAgetb
        {
            width: 40%;
        }
        BillingImmNotb
        {
            width: 100%;
        }
        .auto-style45 {
            width: 597px;
        }
        .auto-style48 {
            width: 45px;
        }
        .auto-style49 {
            width: 46px;
        }
        .auto-style50 {
            width: 449px;
        }
        .auto-style51 {
            height: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3" colspan="4">PEDIATRIC CLINICAL SYSTEM<br />
                        DAPPY&#39;S AND ELI&#39;S GENERAL HOSPITAL<br />
                        BILLING</td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="Billing No."></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="BillingNotb" runat="server" Width="90px" Placeholder="BILL00" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BillingNotb" Display="Dynamic" ErrorMessage="* Please Input Billing Number." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="BillingDatetb" runat="server" Placeholder="MM/DD/YYYY" Width="90px" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BillingDatetb" Display="Dynamic" ErrorMessage="* Please provide Date." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="BillingDatetb" Display="Dynamic" ErrorMessage="* Please follow &quot;MM/DD/YYYY&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{2}/\d{2}/\d{4}">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style39"></td>
                    <td class="auto-style38" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" ShowMessageBox="True" />
                    </td>
                    <td class="auto-style39"></td>
                </tr>
                <tr>
                    <td class="auto-style28"></td>
                    <td class="auto-style29" colspan="2">
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Patient Info" Height="103px" BorderColor="Black" >
                            <table class="auto-style26">
                                <tr>
                                    <td class="auto-style43">
                                        <asp:Label ID="Label10" runat="server" Text="Patient&amp;nbsp; Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BillingPatCodetb" runat="server"  AutoPostBack="True" OnTextChanged="BillingPatCodetb_TextChanged" Enabled="False"></asp:TextBox>
                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BillingPatCodetb" Display="Dynamic" ErrorMessage="* Please Enter Patient Code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style43">
                                        &nbsp;<asp:Label ID="Label11" runat="server" Text="Patient Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BillingPatNametb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style43">
                                        <asp:Label ID="Label12" runat="server" Text="Age"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BillingAgetb" runat="server" BackColor="#18AD72" Enabled="False"  ForeColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="auto-style28"></td>
                </tr>
                <tr>
                    <td class="auto-style51" colspan="4">
                        <marquee direction="left"><strong>P L E A S E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S E L E C T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;S E R V I C E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T Y P E</strong></marquee>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style32"></td>
                    <td class="auto-style31" colspan="2">
                        <asp:Panel ID="Panel2" runat="server" GroupingText="Service Type">
                            <table class="auto-style45">
                                <tr>
                                    <td class="auto-style48">&nbsp;</td>
                                    <td class="auto-style48">&nbsp;</td>
                                    <td class="auto-style48">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style50">
                                        <asp:CheckBox ID="BillingConsultationCbox" runat="server" Text="Consultation" AutoPostBack="True" OnCheckedChanged="BillingConsultationCbox_CheckedChanged" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="BillingImmunizationCbox" runat="server" AutoPostBack="True" OnCheckedChanged="BillingImmunizationCbox_CheckedChanged" Text="Immunization" />
                                    </td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                    <td class="auto-style49">&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="auto-style32"></td>
                </tr>
                <tr>
                    <td class="auto-style35"></td>
                    <td class="auto-style34" colspan="2">
                        <asp:Label ID="Label13" runat="server" Text="Consultation No. / Immunization No."></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="BillingConsu_ImmNotb" runat="server" Enabled="False" Width="345px" AutoPostBack="True" Placeholder="Enter CONS00 for Consultation & IMMREF00 for Immunization" OnTextChanged="BillingImmNotb_TextChanged"></asp:TextBox>
                    </td>
                    <td class="auto-style35"></td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style40" colspan="2">
                        <asp:Panel ID="Panel3" runat="server" GroupingText="Consultation/Vaccine Taken">
                            <div class="auto-style37">
                                <asp:GridView ID="BillingGridview" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="601px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Count" />
                                        <asp:BoundField HeaderText="Description" />
                                        <asp:BoundField HeaderText="Amount" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style9">&nbsp;&nbsp;<asp:Label ID="Label17" runat="server" Text="Prepared By:"></asp:Label>
&nbsp;<asp:Label ID="lblBillPrep" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style36">
                        <asp:Label ID="Label14" runat="server" Text="Total Amount"></asp:Label>
&nbsp;&nbsp;
                        <asp:TextBox ID="BillingTotAmttb" runat="server" BackColor="#18AD72" BorderStyle="None" Height="20px" Width="70px" ForeColor="White" AutoPostBack="True" Enabled="False"></asp:TextBox>
&nbsp; </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style37" colspan="2">
                        <asp:Button ID="SaveBtn" runat="server" Text="SAVE" Width="63px" Height="35px" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="CLEAR" Height="36px" OnClick="Button2_Click" OnClientClick="BillingPage.aspx" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Height="35px" OnClick="Button3_Click1" OnClientClick="CheckOutMenu.aspx" Text="EXIT" Width="63px" />
                        </td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
