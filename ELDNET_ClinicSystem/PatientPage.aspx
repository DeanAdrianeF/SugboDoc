<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="PatientPage.aspx.cs" Inherits="ELDNET_ClinicSystem.PatientPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            background-color: #48e5a4;
            width: 852px;
            height: 100%;
        }
        .auto-style11 {
            width: 309px;
            text-align: right;
            height: 71px;
        }

        .auto-style14 {
            width: 816px;
            height: 71px;
        }
        .auto-style26 {
            height: 256px;
            text-align: left;
        }
        .auto-style28 {
        height: 54px;
    }
        .auto-style29 {
            width: 117px;
            height: 85px;
        }
        .auto-style24 {
            width: 76%;
            height: 217px;
        }
        .auto-style20 {
            height: 25px;
        }
        .auto-style82 {
            height: 25px;
            text-align: left;
        }
        .auto-style83 {
            width: 213px;
            height: 71px;
        }
        .auto-style86 {
            height: 13px;
            width: 89px;
        }
        .auto-style87 {
            width: 89px;
            height: 25px;
        }
        .auto-style88 {
            width: 104px;
            height: 25px;
            text-align: right;
        }
        .auto-style89 {
            width: 271px;
            height: 25px;
            text-align: left;
        }
        .auto-style90 {
            height: 29px;
            text-align: left;
        }
    .auto-style91 {
        height: 54px;
        width: 315px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <h1>PATIENT REGISTRATION</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceContent" runat="server">
    <table align="center" class="auto-style5">
        <tr>
            <td class="auto-style11">
                <img alt="" class="auto-style29" src="Pictures/Hospital-Vector-PNG-HD-Isolated.png" /></td>
            <td class="auto-style14" colspan="2">
                ELECTIVE PEDIATRIC CLINIC<br />
                PATIENT REGISTRATION
            </td>
            <td class="auto-style83">
            </td>
        </tr>
        <tr>
            <td class="auto-style26" colspan="4">
                <asp:Panel ID="Panel1" runat="server" GroupingText="Patient Info." Height="286px">
                    <table align="center" class="auto-style24">
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label1" runat="server" Text="Patient Code"></asp:Label>
                                &nbsp;</td>
                            <td class="auto-style89">
                                <asp:TextBox ID="pcodeTb" runat="server" Width="87px" Placeholder="PAT00" AutoPostBack="True" OnTextChanged="pcodeTb_TextChanged"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pcodeTb" ErrorMessage="Please Enter Patient Code" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:Label ID="Label19" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style87"></td>
                            <td class="auto-style20"></td>
                        </tr>
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label15" runat="server" Text="Middle Name"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label16" runat="server" Text="Last Name"></asp:Label>
                                <br />
                            </td>
                            <td class="auto-style89">
                                <asp:TextBox ID="fname" runat="server" Width="203px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fname" ErrorMessage="Please Enter Firstname" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:TextBox ID="mname" runat="server" Width="203px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mname" ErrorMessage="Please Enter Middlename" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:TextBox ID="lastnametb" runat="server" Width="203px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lastnametb" ErrorMessage="Please Enter Lastname" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <br />
                            </td>
                            <td class="auto-style87">
                                <asp:Label ID="Label9" runat="server" Text="Gender"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="Birthday"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label11" runat="server" Text="Age"></asp:Label>
                            </td>
                            <td class="auto-style82">
                                <asp:DropDownList ID="genderddl" runat="server" Height="24px" Width="94px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Select Gender" ForeColor="Red" ControlToValidate="genderddl" SetFocusOnError="True" InitialValue="Select">*</asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:TextBox ID="bdayTb" runat="server" Placeholder="MM/DD/YYYY" OnTextChanged="TextBox7_TextChanged" Width="85px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Provide Birthdate" ForeColor="Red" ControlToValidate="bdayTb" Display="Dynamic" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="bdayTb" Display="Dynamic" ErrorMessage="Please follow &quot;MM/DD/YYYY&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{2}/\d{2}/\d{4}">*</asp:RegularExpressionValidator>
                                <br />
                                <br />
                                <asp:TextBox ID="ageTb" runat="server" Width="60px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please Provide Age" ForeColor="Red" ControlToValidate="ageTb" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td class="auto-style89">
                                <asp:TextBox ID="addrsTb" runat="server" Width="204px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Address" ForeColor="Red" ControlToValidate="addrsTb" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style86">
                                <asp:Label ID="Label12" runat="server" Text="Weight"></asp:Label>
                            </td>
                            <td class="auto-style82">
                                <asp:TextBox ID="weightTb" runat="server" Width="79px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label17" runat="server" Text="Kg."></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label4" runat="server" Text="Telephone"></asp:Label>
                            </td>
                            <td class="auto-style89" id="teltv">
                                <asp:TextBox ID="teltb" runat="server" Width="87px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Telephone Number" ForeColor="Red" ControlToValidate="teltb" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="teltb" Display="Dynamic" ErrorMessage="Please follow &quot;1111-222-3333&quot; format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{4}-\d{3}-\d{4}">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="auto-style87">
                                <asp:Label ID="Label13" runat="server" Text="Height"></asp:Label>
                            </td>
                            <td class="auto-style82">
                                <asp:TextBox ID="heightTb" runat="server" Width="79px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label18" runat="server" Text="Cm."></asp:Label>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label5" runat="server" Text="Father's Name"></asp:Label>
                            </td>
                            <td class="auto-style89">
                                <asp:TextBox ID="fathtb" runat="server" Width="203px" OnTextChanged="fathtb_TextChanged"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Provide Father's Name" ForeColor="Red" ControlToValidate="fathtb" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style86">
                                &nbsp;</td>
                            <td class="auto-style82">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style88">
                                <asp:Label ID="Label6" runat="server" Text="Mother's Name"></asp:Label>
                            </td>
                            <td class="auto-style89">
                                <asp:TextBox ID="mothTb" runat="server" Width="202px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Provide Mother's Name" ForeColor="Red" ControlToValidate="mothTb" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style87">
                                </td>
                            <td class="auto-style82">
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style90">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style91">
                <asp:Label ID="Label14" runat="server" Text="Encoded By"></asp:Label>
                :
                <asp:Label ID="lblEncBy" runat="server"></asp:Label>
            </td>
            <td colspan="2" class="auto-style28">
                <asp:Button ID="saveButton" runat="server" Height="40px" Text="Save" Width="103px" OnClick="saveButton_Click1" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="clearButton" runat="server" Text="Clear" Height="40px"  Width="103px" OnClick="clearButton_Click" OnClientClick="WebForm6.aspx" />
            </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    &copy; Copyright 2020 |&copy; Copyright 2020 | <b>NB</b> | all rights reserved.
</asp:Content>
