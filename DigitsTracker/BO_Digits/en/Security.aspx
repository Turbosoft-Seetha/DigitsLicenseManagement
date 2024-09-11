<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="Security.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.Security" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

       <div class="card-body p-8" style="background-color:white;"> 

                        <asp:UpdatePanel ID="pnlNavigation" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td valign="top">
                                            <telerik:RadTreeView ID="treeSecurity" runat="server" OnNodeClick="treeSecurity_NodeClick"
                                                BorderStyle="Solid" BorderWidth="1px" EnableDragAndDrop="True" Font-Size="Medium"
                                                EnableDragAndDropBetweenNodes="false" Height="380px" Width="500px"
                                                OnNodeDrop="radSiteMap_NodeDrop">
                                            </telerik:RadTreeView>
                                        </td>
                                        <td valign="top">
                                            <asp:CheckBoxList ID="chkRoles" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" OnSelectedIndexChanged="chkRoles_SelectedIndexChanged" AutoPostBack="True" />
                                        </td>

                                    </tr>

                                </table>

                                <div class="form-actions">
                                    <asp:LinkButton ID="btnSave" runat="server" Text='<i class="icon-ok"></i>Save'
                                        Visible="false" CssClass="btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air m-btn--pill " OnClick="btnSave_Click" />
                                </div>
                                <%--<uc2:ProgressBar ID="ProgressBar1" runat="server" />--%>
                            </ContentTemplate>

                        </asp:UpdatePanel>

                    </div>

     <style>
        #MainContent_chkRoles label {
            display: inline !important;
            padding-left: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
