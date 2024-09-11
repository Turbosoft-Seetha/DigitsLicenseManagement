<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="AddEditPlatforms.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.AddEditPlatforms" %>

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

    <telerik:RadAjaxPanel ID="rdd" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">

        <asp:LinkButton ID="LinkCancel" runat="server" Text="Cancel" OnClick="LinkCancel_Click" CssClass="btn btn-sm fw-bold btn-secondary" CausesValidation="False" />

        <asp:LinkButton ID="LinkSave" runat="server" OnClick="LinkSave_Click" Text='<i class="icon-ok"></i>Proceed' CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="true" ValidationGroup="form" />

    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card-body" style="background-color: white; padding: 20px;">
        <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
            <div class="row">
                <div class="col-lg-12">
                    <!--begin::Portlet-->
                    <div class="kt-portlet">

                        <div class="kt-portlet__body" style="margin: 10px;">

                            <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                                <div class="col-lg-12 fw-bold fs-3">Basic Info    </div>

                                <div class="col-lg-12 row pt-2">

                                    <div class="col-lg-4 form-group pt-2">
                                        <label class="control-label col-lg-12">Code <span class="required"></span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadTextBox ID="txtCode" runat="server" RenderMode="Lightweight" CssClass="form-control" Width="100%" OnTextChanged="txtCode_TextChanged" AutoPostBack="true"></telerik:RadTextBox>
                                            <asp:RequiredFieldValidator Filter="Contains" ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ValidationGroup="form"
                                                ControlToValidate="txtCode" ErrorMessage="Please Enter Code " ForeColor="Red"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                            <asp:Label ID="lblCodeDupli" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 form-group pt-2">
                                        <label class="control-label col-lg-12">Name <span class="required"></span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadTextBox ID="txtName" runat="server" RenderMode="Lightweight" Rows="2" CssClass="form-control" Width="100%"></telerik:RadTextBox>
                                            <br />
                                            <asp:RequiredFieldValidator Filter="Contains" ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ValidationGroup="form"
                                                ControlToValidate="txtName" ErrorMessage="Please Enter Name " ForeColor="Red"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
  
                                    <div class="col-lg-4 form-group pt-4">
                                        <label class="control-label col-lg-12">Status <span class="required"></span></label>
                                        <div class="col-lg-12">
                                            <telerik:RadDropDownList ID="ddlStatus" Filter="Contains" runat="server" RenderMode="Lightweight" Width="100%" DefaultMessage="Please Select">
                                                <Items>
                                                    <telerik:DropDownListItem Text="Active" Value="Y" Selected="true" />
                                                    <telerik:DropDownListItem Text="Inactive" Value="N" />
                                                </Items>
                                            </telerik:RadDropDownList>

                                        </div>
                                    </div>

                                </div>

                            </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
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
        </div>
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
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="save" runat="server" Text="Yes" OnClick="save_Click" CssClass="btn btn-sm fw-bold btn-primary" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
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
            <div class="modal-content" style="width: 650px;">
                <div class="modal-header">
                    <h5 class="modal-title">Success</h5>
                </div>
                <div class="modal-body">
                    <span id="success"></span>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel4" runat="server" LoadingPanelID="RadAjaxLoadingPanel4">
                        <asp:LinkButton ID="btnOK" runat="server" OnClick="btnOK_Click" CssClass="btn btn-sm fw-bold btn-secondary">OK</asp:LinkButton>
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel4" EnableEmbeddedSkins="false"
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
