<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrescriptionPage.aspx.cs" Inherits="ELDNET_ClinicSystem.PrescriptionPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prescription</title>
    <style type="text/css">
        .auto-style1 {
            background-color: #48856c;
            height: 619px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .auto-style2 {
            width: auto;
            height: auto;
            border: 1px solid #48E5A4;
            background-color: #48E5A4;
        }
        .auto-style3 {
            text-align: center;
            height: 77px;
        }
        .auto-style5 {
            height: 36px;
            width: 35px;
        }
        .auto-style6 {
            height: 36px;
            width: 287px;
        }
        .auto-style7 {
            height: 36px;
            width: 150px;
        }
        .auto-style9 {
            height: 36px;
            width: 305px;
            margin-left: 80px;
        }
        .auto-style11 {
            width: 35px;
        }
        .auto-style12 {
            height: 122px;
        }
        .auto-style13 {
            text-align: left;
            height: auto;
            height: 189px;
        }
        .auto-style15 {
            text-align: center;
        }
        .auto-style16 {
            height:80px;
            width: 100%;
        }
        .auto-style25 {
            height: 20px;
        }
        .auto-style26 {
            width: 100%;
        }
        .auto-style28 {
            height: 20px;
            width: 146px;
        }
        .auto-style29 {
            width: 35px;
            height: 16px;
        }
        .auto-style30 {
            height: 16px;
        }
        .auto-style31 {
            height: 19px;
            width: 146px;
        }
        .auto-style32 {
            height: 19px;
        }
        #Panel2{
            height: auto;
        }
        .auto-style33 {
            height: 19px;
            text-align: center;
        }
        #Panel1
        {
            width: 100%;
        }
        .auto-style36 {
            text-align: right;
            width: 100px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="auto-style1">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3" colspan="5">

                        PEDIATRIC CLINICAL SYSTEM<br />
                        CEBU DOCTOR&#39;S UNIVERSITY HOSPITAL<br />
                        PRESCRIPTION</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="Prescription No."></asp:Label>
&nbsp;<asp:TextBox ID="PresNotb" runat="server" Width="75px" Placeholder="PRES00" OnTextChanged="PresNotb_TextChanged" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PresNotb" Display="Dynamic" ErrorMessage="* Please input Prescription Number." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Label13" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style9">
                        <asp:Label ID="Label2" runat="server" Text="Consultation No."></asp:Label>
&nbsp;<asp:TextBox ID="ConsNotb" runat="server" Width="75px" Placeholder="CONS00" AutoPostBack="True" OnTextChanged="ConsNotb_TextChanged"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ConsNotb" Display="Dynamic" ErrorMessage="* Please input Consultation Number." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="Label14" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
&nbsp;<asp:TextBox ID="PresHdatetb" runat="server" Placeholder="MM/DD/YYYY" Width="75px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PresHdatetb" Display="Dynamic" ErrorMessage="* Please provide date." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PresHdatetb" Display="Dynamic" ErrorMessage="* Please follow &quot;MM/DD/YYYY&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{2}/\d{2}/\d{4}">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style29"></td>
                    <td class="auto-style30" colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" ShowMessageBox="True" />
                    </td>
                    <td class="auto-style29"></td>
                </tr>
                <tr>
                    <td rowspan="3">&nbsp;</td>
                    <td class="auto-style12" colspan="3">
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Patient Info" Height="103px" >
                            <table class="auto-style26">
                                <tr>
                                    <td class="auto-style36">
                                        <asp:Label ID="Label10" runat="server" Text="Patient&amp;nbsp; Code"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PresHpatcodetb" runat="server" Width="520px" AutoPostBack="True" OnTextChanged="PresHpatcodetb_TextChanged" ReadOnly="True" BackColor="White" Enabled="False"></asp:TextBox>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style36">
                                        <asp:Label ID="Label11" runat="server" Text="Patient Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PresHpatnametb" runat="server" BackColor="#18AD72" Enabled="False" Width="520px" ForeColor="White" OnTextChanged="PresHpatnametb_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style36">
                                        <asp:Label ID="Label12" runat="server" Text="Age"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PresHagetb" runat="server" BackColor="#18AD72" Enabled="False" Width="520px" ForeColor="White"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                    <td class="auto-style11" rowspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style13">
                        <asp:Panel ID="Panel2" runat="server" GroupingText="Medicine to Prescribe" >
                            <table class="auto-style16">
                                <tr>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label7" runat="server" Text="Medicine Code"></asp:Label>
                                    </td>
                                    <td class="auto-style25">
                                        <asp:TextBox ID="PresHmedcodetb" runat="server" Placeholder="MED00" OnTextChanged="TextBox7_TextChanged" AutoPostBack="True" Width="470px"></asp:TextBox>
                                        &nbsp;<asp:Label ID="Label15" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style28">
                                        <asp:Label ID="Label8" runat="server" Text="Quantity"></asp:Label>
                                    </td>
                                    <td class="auto-style25">
                                        <asp:TextBox ID="TextBox8" runat="server" Width="470px" OnTextChanged="TextBox8_TextChanged" AutoPostBack="True"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style31">
                                        <asp:Label ID="Label9" runat="server" Text="Remarks"></asp:Label>
                                    </td>
                                    <td class="auto-style32">
                                        <asp:TextBox ID="TextBox9" runat="server" Width="470px" AutoPostBack="True" OnTextChanged="TextBox9_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style33" colspan="2">
                                        <asp:GridView ID="MedicineGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="Grid View is still empty." ForeColor="#333333" GridLines="None" Height="73px" OnSelectedIndexChanged="MedicineGridView_SelectedIndexChanged" ShowHeaderWhenEmpty="True" Width="705px">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderText="Med Code" />
                                                <asp:BoundField HeaderText="Name" />
                                                <asp:BoundField HeaderText="Dose" />
                                                <asp:BoundField HeaderText="Description" />
                                                <asp:BoundField HeaderText="Quantity" />
                                                <asp:BoundField HeaderText="Remarks" />
                                            </Columns>  
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style15">
                        <asp:Button ID="Button1" runat="server" Text="SAVE" Width="63px" Height="35px" OnClick="Button1_Click" />
&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="CLEAR" Height="34px" OnClick="Button2_Click" OnClientClick="PrescriptionPage.aspx" />
&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="EXIT" Width="63px" Height="35px" OnClick="Button3_Click" OnClientClick="CheckOutMenu.aspx" />
                        <br />
                        Prepared By: <asp:Label ID="lblPrep" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
