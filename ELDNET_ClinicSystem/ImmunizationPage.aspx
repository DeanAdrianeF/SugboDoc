<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="ImmunizationPage.aspx.cs" Inherits="ELDNET_ClinicSystem.ImmunizationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 852px;
            height: 496px;
            border: 1px solid #48e5a4;
            background-color: #48e5a4;
        }
        .auto-style6 {
            text-align: right;
            width: 291px;
            height: 85px;
        }
        .auto-style9 {
            width: 291px;
            height: 85px;
        }
        .auto-style10 {
            width: 487px;
            height: 85px;
        }
        .auto-style11 {
            background-color: #82edc1;
            height: 50px;
        }
    .auto-style12 {
        text-align: left;
        height: 131px;
        margin-left: 40px;
    }
        .auto-style40 {
            width: 120px;
        }
        .auto-style49 {
            width: 158px;
            height: 22px;
        text-align: left;
    }
        .auto-style56 {
            width: 173px;
            height: 22px;
        text-align: left;
    }
        .auto-style45 {
            width: 124px;
            height: 22px;
        }
        .auto-style31 {
            width: 842px;
        }
        .auto-style61 {
        width: 62px;
        text-align: left;
    }
    .auto-style62 {
        width: 62px;
    }
    .auto-style63 {
        width: 62px;
        height: 22px;
    }
    .auto-style65 {
        width: 120px;
        height: 22px;
    }
    .auto-style66 {
        width: 124px;
        text-align: left;
    }
    .auto-style68 {
        width: 89px;
        text-align: left;
    }
    .auto-style69 {
        width: 89px;
    }
    .auto-style70 {
        width: 89px;
        height: 22px;
    }
    .auto-style81 {
        margin-left: 0px;
    }
    .auto-style86 {
        width: 158px;
        text-align: left;
    }
    .auto-style88 {
        width: 173px;
        text-align: left;
    }
    .auto-style89 {
        width: 100%;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
    }
    .auto-style91 {
        background-color: #82edc1;
        height: 106px;
            text-align: left;
        }
        .auto-style93 {
            height: 29px;
            text-align: left;
        }
        .auto-style72 {
            width: 846px;
        }
        .auto-style77 {
            width: 121px;
        }
        .auto-style78 {
            width: 121px;
            text-align: right;
            height: 32px;
        }
        .auto-style94 {
            width: 121px;
            text-align: left;
            height: 32px;
        }
    .auto-style95 {
        width: 117px;
        height: 85px;
    }
        .auto-style96 {
            text-align: left;
        }
        .auto-style97 {
            background-color: #82edc1;
            height: 20px;
            text-align: left;
        }
        .auto-style98 {
            width: 200px;
        }
        .auto-style99 {
            width: 231px;
        }
        #ImmunizationGridview
        {
            width: auto;
        }
        .auto-style100 {
            width: 120px;
            height: 32px;
        }
        .auto-style101 {
            text-align: left;
            height: 32px;
        }
        .auto-style102 {
            width: 121px;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <h1>IMMUNIZATION ENTRY</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceContent" runat="server">
    <table align="center" class="auto-style5">
        <tr>
            <td class="auto-style6">
                <img alt="" class="auto-style95" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" /></td>
            <td class="auto-style10">PEDIATRIC CLINICAL SYSTEM<br />DAPPY&#39;S AND ELI&quot;S GENERAL HOSPITAL<br />
                <br />
                IMMUNIZATION ENTRY</td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style11">
                <asp:Label ID="Label1" runat="server" Text="Immunization Code"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="ImmunizationCodetb" runat="server" Placeholder="IMMREF00" Width="183px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ImmunizationCodetb" Display="Dynamic" ErrorMessage="* Please enter Immunization code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                &nbsp;<asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="ImmunizationCdatetb" runat="server" Placeholder="MM/DD/YYYY" Width="159px" AutoPostBack="True"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ImmunizationCdatetb" Display="Dynamic" ErrorMessage="* Please provide date." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ImmunizationCdatetb" Display="Dynamic" ErrorMessage="* Please follow &quot;MM/DD/YYYY&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{2}/\d{2}/\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style97">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style12">
                <asp:Panel ID="Panel1" runat="server" GroupingText="Patient Information">
                    <table class="auto-style31">
                        <tr>
                            <td class="auto-style86">
                                <asp:Label ID="Label4" runat="server" Text="Patient Code"></asp:Label>
                            </td>
                            <td class="auto-style99">
                                <asp:TextBox ID="ImmPatientCodetb" runat="server" AutoPostBack="True" OnTextChanged="ImmPatientCodetb_TextChanged" Enabled="False"></asp:TextBox>
                                &nbsp;&nbsp;</td>
                            <td class="auto-style88">
                                <asp:Label ID="Label8" runat="server" Text="Father's Name"></asp:Label>
                            </td>
                            <td class="auto-style98">
                                <asp:TextBox ID="ImmPatienFathtb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style66">
                                <asp:Label ID="Label12" runat="server" Text="Age"></asp:Label>
                            </td>
                            <td class="auto-style68">
                                <asp:TextBox ID="ImmPatientAgetb" runat="server" BackColor="#18AD72" Width="65px" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style61">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style86">
                                <asp:Label ID="Label5" runat="server" Text="Patient Name"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ImmPatientNametb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style88">
                                <asp:Label ID="Label9" runat="server" Text="Mother's Name"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ImmPatientMothtb" runat="server" BackColor="#18AD72" Enabled="False" CssClass="auto-style81" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style66">
                                <asp:Label ID="Label13" runat="server" Text="Weight"></asp:Label>
                            </td>
                            <td class="auto-style69">
                                <asp:TextBox ID="ImmPatientWtb" runat="server" Width="65px" AutoPostBack="True"></asp:TextBox>
                            </td>
                            <td class="auto-style62">
                                <asp:Label ID="Label16" runat="server" Text="kg."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style86">
                                <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ImmPatientAddtb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style88">
                                <asp:Label ID="Label10" runat="server" Text="Gender"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ImmPatientGentb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style66">
                                <asp:Label ID="Label14" runat="server" Text="Height"></asp:Label>
                            </td>
                            <td class="auto-style69">
                                <asp:TextBox ID="ImmPatientHtb" runat="server" Width="65px" AutoPostBack="True"></asp:TextBox>
                            </td>
                            <td class="auto-style62">
                                <asp:Label ID="Label17" runat="server" Text="cm."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style49">
                                <asp:Label ID="Label7" runat="server" Text="Telephone"></asp:Label>
                            </td>
                            <td class="auto-style65">
                                <asp:TextBox ID="ImmPatientTeltb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style56">
                                <asp:Label ID="Label11" runat="server" Text="Birthday"></asp:Label>
                            </td>
                            <td class="auto-style65">
                                <asp:TextBox ID="ImmPatientBdatetb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style45"></td>
                            <td class="auto-style70"></td>
                            <td class="auto-style63"></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style91">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Vaccine Information" Height="88px">
                    <table class="auto-style89">
                        <tr>
                            <td class="auto-style93">
                                <asp:Label ID="Label18" runat="server" Text="Vaccine Code"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="ImmPatientVaccCode" runat="server" Placeholder="VAC00" AutoPostBack="True" OnTextChanged="ImmPatientVaccCode_TextChanged" Width="140px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label26" runat="server" ForeColor="Red"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label19" runat="server" Text="Shot Number"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="ImmPatientShotNum" runat="server" AutoPostBack="True" OnTextChanged="ImmPatientShotNum_TextChanged" Width="110px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style96">
                                <asp:Label ID="Label20" runat="server" Text="Reaction"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="ImmPatientReaction" runat="server" Width="450px" AutoPostBack="True" OnTextChanged="ImmPatientReaction_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table align="center" class="auto-style89">
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:GridView ID="ImmunizationGridview" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="830px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="Vaccine Code" />
                                    <asp:BoundField HeaderText="Name" />
                                    <asp:BoundField HeaderText="Description" />
                                    <asp:BoundField HeaderText="Shot Number" />
                                    <asp:BoundField HeaderText="Reaction" />
                                </Columns>                              
                            </asp:GridView>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table class="auto-style72">
                    <tr>
                        <td class="auto-style100"></td>
                        <td class="auto-style100">
                            <asp:Label ID="Label21" runat="server" Text="Prepared By:"></asp:Label>
                        </td>
                        <td class="auto-style101" colspan="2">
                            &nbsp; &nbsp;<asp:Label ID="ImmPrepby" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style78">
                            <asp:Button ID="Button8" runat="server" Height="28px" Text="Save" Width="70px" OnClick="Button8_Click" />
                        </td>
                        <td class="auto-style94">
                            <asp:Button ID="Button9" runat="server" Height="28px" Text="Clear" Width="70px" OnClick="Button9_Click" OnClientClick="WebForm3.aspx" />
                        </td>
                        <td class="auto-style102"></td>
                    </tr>
                    <tr>
                        <td class="auto-style40">&nbsp;</td>
                        <td class="auto-style40">
                            <asp:Label ID="Label22" runat="server" Text="Immunized By:"></asp:Label>
                        </td>
                        <td class="auto-style40">
                            <asp:TextBox ID="ImmedBy" runat="server" Placeholder="EMP00" Width="60px" AutoPostBack="True" OnTextChanged="ImmedBy_TextChanged"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ImmedBy" Display="Dynamic" ErrorMessage="* Please enter immunizer code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;<asp:Label ID="Label27" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style77">
                            <asp:TextBox ID="ImmunizerName" runat="server" BackColor="#18AD72" Width="150px" ForeColor="White" Enabled="False"></asp:TextBox>
                        </td>
                        <td colspan="2">
                            <asp:Button ID="Button10" runat="server" Height="28px" Text="Exit" Width="144px" OnClick="Button10_Click" OnClientClick="WebForm1.aspx" />
                        </td>
                        <td class="auto-style77">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    &copy; Copyright 2020 |&copy; Copyright 2020 | <b>NB</b> | all rights reserved.
</asp:Content>
