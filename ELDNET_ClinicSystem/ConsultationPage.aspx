<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="ConsultationPage.aspx.cs" Inherits="ELDNET_ClinicSystem.ConsultationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style5 {
            background-color: #48e5a4;
            width: 852px;
            height: 496px;
        }
        .auto-style11 {
            text-align: right;
            width: 291px;
            height: 85px;
        }
        .auto-style14 {
            width: 495px;
            height: 91px;
            background-color: #48E5A4;
        }
        .auto-style27 {
            width: 284px;
            height: 91px;
        }
        .auto-style28 {
            background-color: #82edc1;
            height: 50px;
            text-align: center;
        }
        .auto-style29 {
            height: 56px;
            text-align: left;
        }
        .auto-style30 {
            height: 109px;
            text-align: left;
        }
        .auto-style31 {
            width: 842px;
        }
        .auto-style40 {
            width: 120px;
        }
        .auto-style41 {
            width: 120px;
            height: 26px;
        }
        .auto-style45 {
            width: 415px;
            height: 26px;
        }
        .auto-style49 {
            width: 489px;
            height: 26px;
        }
        .auto-style50 {
            width: 489px;
        }
        .auto-style54 {
            width: 415px;
        }
        .auto-style55 {
            width: 520px;
        }
        .auto-style56 {
            width: 520px;
            height: 26px;
        }
        .auto-style57 {
            width: 125px;
        }
        .auto-style58 {
            width: 125px;
            height: 26px;
        }
        .auto-style71 {
            background-color: #82edc1;
            height: 30px;
            text-align: right;
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
            
        }
        .auto-style79 {
            width: 117px;
            height: 85px;
        }
        .auto-style84 {
            text-align: center;
        }
        
        .auto-style91 {
            background-color: #82edc1;
            height: 10px;
            text-align: left;
        }
        .auto-style92 {
            width: 100px;
        }

        .auto-style93 {
            width: 121px;
            text-align: center;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <h1>CONSULTATION ENTRY</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceContent" runat="server">
    <table align="center" class="auto-style5">
        <tr>
            <td class="auto-style11">
                <img alt="" class="auto-style79" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" /></td>
            <td class="auto-style14">PEDIATRIC CLINICAL SYSTEM<br />DAPPY&#39;S AND ELI&quot;S GENERAL HOSPITAL<br />
                <br />
                CONSULTATION ENTRY</td>
            <td class="auto-style27"></td>
        </tr>
        <tr>
            <td class="auto-style28" colspan="3">
                <asp:Label ID="Label1" runat="server" Text="Consultation No."></asp:Label>
&nbsp;
                <asp:TextBox ID="Consultationtb" runat="server" Width="88px" Placeholder="CONS00" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Consultationtb" Display="Dynamic" ErrorMessage="* Please Enter Consultation Code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="*Immunization (referal) No."></asp:Label>
&nbsp;
                <asp:TextBox ID="ConsImmtb" runat="server" Placeholder="IMMREF00" Width="104px" AutoPostBack="True" OnTextChanged="ConsImmtb_TextChanged"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ConsImmtb" Display="Dynamic" ErrorMessage="* Please Enter Immunization Number." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:Label ID="Label24" runat="server" ForeColor="Red"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Date"></asp:Label>
&nbsp;
                <asp:TextBox ID="ConsuldataionDatetb" runat="server" Placeholder="MM/DD/YYYY" Width="71px"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConsuldataionDatetb" Display="Dynamic" ErrorMessage="* Please provide date." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ConsuldataionDatetb" Display="Dynamic" ErrorMessage="* Please follow &quot;MM/DD/YYYY&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{2}/\d{2}/\d{4}">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style91" colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td class="auto-style30" colspan="3">
                <asp:Panel ID="Panel1" runat="server" GroupingText="Patient Information">
                    <table class="auto-style31">
                        <tr>
                            <td class="auto-style50">
                                <asp:Label ID="Label4" runat="server" Text="Patient Code"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatCodetb" runat="server" OnTextChanged="ConsPatCodetb_TextChanged" AutoPostBack="True"></asp:TextBox>
                                <asp:Label ID="Label25" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style55">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConsPatCodetb" Display="Dynamic" ErrorMessage="* Please Enter Patient Code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:Label ID="Label8" runat="server" Text="Father's Name"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatFathtb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style54">
                                <asp:Label ID="Label12" runat="server" Text="Age"></asp:Label>
                            </td>
                            <td class="auto-style57">
                                <asp:TextBox ID="ConsPatAgetb" runat="server" BackColor="#18AD72" Enabled="False" Width="85px" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style40">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style50">
                                <asp:Label ID="Label5" runat="server" Text="Patient Name"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatNametb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style55">
                                <asp:Label ID="Label9" runat="server" Text="Mother's Name"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatMothtb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style54">
                                <asp:Label ID="Label13" runat="server" Text="Weight"></asp:Label>
                            </td>
                            <td class="auto-style57">
                                <asp:TextBox ID="ConsPatWeighttb" runat="server" Width="85px" BackColor="#18AD72" Enabled="False" ForeColor="White" OnTextChanged="ConsPatWeighttb_TextChanged"></asp:TextBox>
                            </td>
                            <td class="auto-style40">
                                <asp:Label ID="Label16" runat="server" Text="kg."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style50">
                                <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatAddtb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style55">
                                <asp:Label ID="Label10" runat="server" Text="Gender"></asp:Label>
                            </td>
                            <td class="auto-style40">
                                <asp:TextBox ID="ConsPatGentb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style54">
                                <asp:Label ID="Label14" runat="server" Text="Height"></asp:Label>
                            </td>
                            <td class="auto-style57">
                                <asp:TextBox ID="ConsPatHeighttb" runat="server" Width="85px" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style40">
                                <asp:Label ID="Label17" runat="server" Text="cm."></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style49">
                                <asp:Label ID="Label7" runat="server" Text="Telephone"></asp:Label>
                            </td>
                            <td class="auto-style41">
                                <asp:TextBox ID="ConsPatTeltb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style56">
                                <asp:Label ID="Label11" runat="server" Text="Birthday"></asp:Label>
                            </td>
                            <td class="auto-style41">
                                <asp:TextBox ID="ConsPatBdaytb" runat="server" BackColor="#18AD72" Enabled="False" ForeColor="White"></asp:TextBox>
                            </td>
                            <td class="auto-style45">
                                <asp:Label ID="Label15" runat="server" Text="Body temp."></asp:Label>
                            </td>
                            <td class="auto-style58">
                                <asp:TextBox ID="ConsPatBodyTemptb" runat="server" Width="85px" AutoPostBack="True" OnTextChanged="ConsPatBodyTemptb_TextChanged"></asp:TextBox>
                            </td>
                            <td class="auto-style41">
                                <asp:Label ID="Label18" runat="server" Text="cel."></asp:Label>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ConsPatBodyTemptb" Display="Dynamic" ErrorMessage="* Please provide body temperature." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="auto-style30" colspan="3">
                <asp:Panel ID="Panel2" runat="server" BackColor="#18AD72" GroupingText="Diagnosis Information">
                    <table class="auto-style80" align="center">
                        <tbody class="auto-style84">
                            <tr>
                                <td class="auto-style83">
                                    <asp:Label ID="Label26" runat="server" Text="Diagnosis Code"></asp:Label>
                                </td>
                                <td class="auto-style40">
                                    <asp:TextBox ID="ConsDiagCode" runat="server" Placeholder="DIAG00" AutoPostBack="True" OnTextChanged="TextBox22_TextChanged" Width="90px"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label28" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                                <td class="auto-style82">
                                    <asp:Label ID="Label27" runat="server" Text="Physician's Notes/Directions"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConsNotes" runat="server" AutoPostBack="True" OnTextChanged="ConsNotes_TextChanged" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style86"></td>
                                <td class="auto-style87"></td>
                                <td class="auto-style88"></td>
                                <td class="auto-style89"></td>
                            </tr>
                            <tr>
                                <td class="auto-style84" colspan="4">
                                    <asp:GridView ID="ConsultationGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style85" ForeColor="#333333" GridLines="None" Width="811px">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Diagnosis Code" />
                                            <asp:BoundField HeaderText="Description" />
                                            <asp:BoundField HeaderText="Physician's Notes/Direction" />
                                        </Columns>                                  
                                    </asp:GridView>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="auto-style71" colspan="3">
                <asp:CheckBox ID="CheckBox3" runat="server" Text="For Admission?" />
&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="For Laboratory Test?" />
                </td>
        </tr>
        <tr>
            <td class="auto-style29" colspan="3">
                <table class="auto-style72">
                    <tr>
                        <td class="auto-style40">&nbsp;</td>
                        <td class="auto-style40">
                            <asp:Label ID="Label21" runat="server" Text="Prepared By:"></asp:Label>
                        </td>
                        <td colspan="2">
                            &nbsp;&nbsp;<asp:Label ID="lblPrep" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style78">
                            <asp:Button ID="Button11" runat="server" Height="28px" Text="Save" Width="70px" OnClick="Button11_Click" />
                        </td>
                        <td class="auto-style77">
                            <asp:Button ID="Button9" runat="server" Height="28px" Text="Clear" Width="70px" OnClick="Button9_Click" OnClientClick="WebForm2.aspx" />
                        </td>
                        <td class="auto-style93">
                            <asp:Label ID="Label31" runat="server" ForeColor="#48E5A4"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style40">&nbsp;</td>
                        <td class="auto-style40">
                            <asp:Label ID="Label22" runat="server" Text="Examined By:"></asp:Label>
                        </td>
                        <td class="auto-style92">
                            <asp:TextBox ID="ExamBytb1" runat="server" Placeholder="EMP00" Width="60px" AutoPostBack="True" OnTextChanged="TextBox19_TextChanged"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ExamBytb1" Display="Dynamic" ErrorMessage="* Please enter Examiner Code." ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="Label30" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td class="auto-style77">
                            <asp:TextBox ID="ExamBytb2" runat="server" BackColor="#18AD72" Width="150px" ForeColor="White" OnTextChanged="ExamBytb2_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style84" colspan="2">
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
    &copy; Copyright 2020 | <b>NB</b> | all rights reserved.
</asp:Content>
