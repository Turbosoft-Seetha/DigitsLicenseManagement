<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BreadCrumb.ascx.cs" Inherits="DigitsLicenseManagement.UserControls.BreadCrumb" %>
 <style type="text/css">
        .breadcrumb>li+li:before{content:" ";padding:0 5px;color:#ccc}
        .fa-angle-right:before {content: "\f105"; }
    </style>
<asp:Literal ID="ltrlBreadCrumb" runat="server" />