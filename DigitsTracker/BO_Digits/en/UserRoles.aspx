<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="UserRoles.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.UserRoles" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script>
        function ErrorModal(res) {
            $('#spnMsg').text(res);
            $('#kt_modal_1_6').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="ContentAction" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
        <asp:LinkButton ID="btnSave" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="btnSave_Click"></asp:LinkButton>
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
    <asp:LinkButton ID="btnCancel" Width="100px" runat="server"
        Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary"
        CausesValidation="False" OnClick="btnCancel_Click" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <div class="kt-portlet__body">

                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                OnItemDataBound="grvRpt_ItemDataBound"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="10" CellSpacing="0"  >
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="RoleId"
                                    EnableHeaderContextMenu="true">
                                    <Columns>

                                        <telerik:GridClientSelectColumn UniqueName="GridCheckBoxColumn" HeaderStyle-Width="2px" >
                                        </telerik:GridClientSelectColumn>

                                        <telerik:GridBoundColumn DataField="RoleName" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Role Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="RoleName">
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="IsRole" Display="false" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="IsRole" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="IsRole">
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                                <GroupingSettings CaseSensitive="false" />
                                <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                                    <Resizing AllowColumnResize="true"></Resizing>
                                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                                </ClientSettings>
                            </telerik:RadGrid>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="kt_modal_1_6" tabindex="-1" role="dialog" style="height:auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span id="spnMsg"></span></h5>
                </div>
                <div class="modal-footer">

                    <asp:LinkButton ID="lnkClose" runat="server" OnClick="btnCancel_Click" CssClass="btn btn-secondary" Text="OK"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
