<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditLicenseManagement.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.AddEditLicenseManagement" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');

            $('#success').text(a);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
        function failedModal(res) {
            $('#modalConfirm').modal('hide');
            $('#kt_modal_1_2').modal('show');
            $('#failres').text(res);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CssClass="btn btn-sm fw-bold btn-secondary" CausesValidation="False" OnClick="lnkCancel_Click" />
        <asp:LinkButton ID="lnkProceed" runat="server" ValidationGroup="frm" OnClick="lnkProceed_Click" UseSubmitBehavior="false" Text='<i class="icon-ok"></i>Proceed'
            CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" />

    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="lnkAddPlatfom">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                    <%--<telerik:AjaxUpdatedControl ControlID="ddlPlatform" />--%>
                </UpdatedControls>
            </telerik:AjaxSetting> 
            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlPlatform" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>

    </telerik:RadAjaxManagerProxy>


    <div class="card-body p-8" style="background-color: white;">

        <div class="col-lg-12 mt-0 row mb-4">
            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-2" style="color: #464646;">Customer</label>
                <div class="col-lg-12">
                    <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlProjectCus" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" Skin="Silk" EmptyMessage="Select Customer">
                    </telerik:RadComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Select Project Customer"
                        ForeColor="Red" ControlToValidate="ddlProjectCus" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-2" style="color: #464646;">Project</label>
                <div class="col-lg-12">
                    <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlProject" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" Skin="Silk" EmptyMessage="Select Project">
                    </telerik:RadComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Select Project"
                        ForeColor="Red" ControlToValidate="ddlProject" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                 <label class="control-label col-lg-10 pt-2 pb-2" style="color: #464646;">Licence Type</label>
                 <div class="col-lg-12">
                     <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlType" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" Skin="Silk" EmptyMessage="Select License Type">
                     </telerik:RadComboBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Display="Dynamic" ErrorMessage="Select License Type"
                         ForeColor="Red" ControlToValidate="ddlType" ValidationGroup="frm"></asp:RequiredFieldValidator>
                 </div>
             </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-2" style="color: #464646;">Start Date</label>
                <div class="col-lg-12">
                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" Skin="Silk">
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="Start Date is mandatory"
                        ForeColor="Red" ControlToValidate="rdfromDate" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-2" style="color: #464646;">Expiry Date</label>
                <div class="col-lg-12">
                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%" Skin="Silk">
                    </telerik:RadDatePicker>
                    <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                        Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="End Date is mandatory"
                        ForeColor="Red" ControlToValidate="rdendDate" ValidationGroup="frm"></asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-1" style="color: #464646;">Buffer Period in Days</label>
                <div class="col-lg-12">
                    <telerik:RadNumericTextBox RenderMode="Lightweight" ID="txtBufferPeriod" runat="server" Width="100%" Skin="Silk" NumberFormat-DecimalDigits="0">
                    </telerik:RadNumericTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="txtBufferPeriod is mandatory"
                        ForeColor="Red" ControlToValidate="txtBufferPeriod" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-1" style="color: #464646;">Expiry Notification</label>
                <div class="col-lg-12">
                    <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlNotification" runat="server" Width="100%" Skin="Silk">
                        <Items>
                            <telerik:RadComboBoxItem Value="Y" Text="Yes" Selected="true" />
                            <telerik:RadComboBoxItem Value="N" Text="No" />
                        </Items>
                    </telerik:RadComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="txtBufferPeriod is mandatory"
                        ForeColor="Red" ControlToValidate="ddlNotification" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-1" style="color: #464646;">Prior Expiry Notification Intervel in Days</label>
                <div class="col-lg-12">
                    <telerik:RadTextBox RenderMode="Lightweight" ID="txtPriorNoti" runat="server" Width="100%" Skin="Silk">
                    </telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ErrorMessage="Prior Expiry Notification Intervel in Days is mandatory"
                        ForeColor="Red" ControlToValidate="txtPriorNoti" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-4 pt-2">
                <label class="control-label col-lg-10 pt-2 pb-1" style="color: #464646;">Status</label>
                <div class="col-lg-12">
                    <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlStatus" runat="server" Width="100%" Skin="Silk">
                        <Items>
                            <telerik:RadComboBoxItem Value="Y" Text="Active" Selected="true"/>
                            <telerik:RadComboBoxItem Value="CN" Text="Cancel" />                           
                        </Items>
                    </telerik:RadComboBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="Status is mandatory"
                        ForeColor="Red" ControlToValidate="ddlStatus" ValidationGroup="frm"></asp:RequiredFieldValidator>
                </div>
            </div>


        </div>

        <div class="col-lg-12 mt-6 mb-6 d-flex fw-bold fs-5">
            Project Platform:
        </div>

        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
            <div class="col-lg-12 row">
                <div class="col-lg-3">
                    <label class="control-label col-lg-10 pt-2 pb-1" style="color: #464646;">Platform</label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox RenderMode="Lightweight" Filter="Contains" ID="ddlPlatform" runat="server" Width="100%" Skin="Silk" EmptyMessage="Select Project Platform">
                        </telerik:RadComboBox>
                        <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="Select Platform"
                            ForeColor="Red" ControlToValidate="ddlPlatform" ValidationGroup="form"></asp:RequiredFieldValidator>


                    </div>
                </div>

                <div class="col-lg-3">
                    <label class="control-label col-lg-12 pt-2 pb-1" style="color: #464646;">No of Users</label>
                    <div class="col-lg-12">
                        <telerik:RadNumericTextBox RenderMode="Lightweight" ID="txtNoOfUsers" runat="server" Width="100%" Skin="Silk">
                        </telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="No Of Users is mandatory"
                            ForeColor="Red" ControlToValidate="txtNoOfUsers" ValidationGroup="form"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="col-lg-3 pt-9">
                    <asp:LinkButton ID="lnkAddPlatfom" runat="server" OnClick="lnkAddPlatfom_Click" UseSubmitBehavior="false"
                        Text='<i class="icon-ok"></i>Add' CssClass="btn btn-sm fw-bold btn-Primary" CausesValidation="true" ValidationGroup="form"
                        BorderStyle="Solid" ForeColor="DeepSkyBlue" BorderWidth="2px" Style="display: inline;" />
                </div>


            </div>

        </telerik:RadAjaxPanel>
        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center mt-5">
                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>

        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">

            <div class="col-lg-12 mt-8 d-flex" style="padding-bottom: 10px">
                <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="true"
                    ID="RadGrid2" GridLines="None"
                    ShowFooter="True" AllowSorting="True"
                    OnNeedDataSource="RadGrid2_NeedDataSource"
                    OnItemCommand="RadGrid2_ItemCommand"
                    AllowFilteringByColumn="true"
                    ClientSettings-Resizing-ClipCellContentOnResize="true"
                    EnableAjaxSkinRendering="true"
                    AllowPaging="true" PageSize="500" CellSpacing="0" Skin="Material">
                    <ClientSettings>
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="250px"></Scrolling>
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                        ShowFooter="false"
                        EnableHeaderContextMenu="true">
                        <Columns>
                            <telerik:GridBoundColumn DataField="PlmID" AllowFiltering="true" HeaderStyle-Width="150px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="PlmID" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="PlmID" Display="false">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Platform" AllowFiltering="true" HeaderStyle-Width="150px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="Platform" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="Platform">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="NoOfUsers" AllowFiltering="true" HeaderStyle-Width="150px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="No Of Users" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="NoOfUsers">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn HeaderStyle-Width="70px" AllowFiltering="false" HeaderText="Delete" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton CommandName="Delete" ID="Delete" Visible="true" AlternateText="Delete" runat="server"
                                        ImageUrl="../assets/media/svg/general/Trash.svg"></asp:ImageButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>


                        </Columns>
                    </MasterTableView>
                    <PagerStyle AlwaysVisible="true" />
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings AllowDragToGroup="True" EnableRowHoverStyle="true" AllowColumnsReorder="True">
                        <Resizing AllowColumnResize="true"></Resizing>
                        <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
                    </ClientSettings>
                </telerik:RadGrid>
            </div>

        </telerik:RadAjaxPanel>
        <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
            BackColor="Transparent"
            ForeColor="Blue">
            <div class="col-lg-12 text-center mt-5">
                <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
            </div>
        </telerik:RadAjaxLoadingPanel>
    </div>

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="false" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(modalConfirm);">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!--begin::SuccessModal-->
    <div class="modal fade" id="kt_modal_1_4" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel5">
                        <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel5" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
                </div>

            </div>
        </div>
    </div>
    <!--end::SuccessModal-->

    <!--begin::FailedModal-->
    <div class="modal fade" id="kt_modal_1_5" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span>Something went wrong, please try again later.</span>
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_5);">Ok</button>
                </div>
            </div>
        </div>
    </div>
    <!--end::FailedModal-->
    <div class="modal fade" id="kt_modal_1_2" tabindex="-1" role="dialog" style="height: auto" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Oops..!</h5>
                </div>
                <div class="modal-body">
                    <span id="failres"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm fw-bold btn-secondary" onclick="cancelModal(kt_modal_1_2);">Ok</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
