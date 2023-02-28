<%@ Page Language="C#" MasterPageFile="~/MainPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ELDNET_ClinicSystem.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
        width: 1305px;
        height: 510px;
    }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHeader" runat="server">
    <h1>WELCOME HOME&nbsp;<asp:Label ID="labelHome" runat="server"></asp:Label></h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceContent" runat="server">
    <img alt="" class="auto-style6" src="Pictures/asdasdasdasd.PNG" />  
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceFooter" runat="server">
    &copy; Copyright 2020 | <b>NB</b> | all rights reserved.
</asp:Content>

