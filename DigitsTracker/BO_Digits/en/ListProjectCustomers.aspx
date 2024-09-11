<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="ListProjectCustomers.aspx.cs" Inherits="DigitsTracker.BO_Digits.en.ListProjectCustomers" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
    <script type="text/javascript">
        function Confim() {
            $('#modalConfirm').modal('show');
        }
        function SaveConfim() {
            $('#SaveModalConfirm').modal('show');
        }
        function Succcess(a) {
            $('#modalConfirm').modal('hide');
            $('#SaveModalConfirm').modal('hide');
            $('#kt_modal_1_4').modal('show');

            $('#success').text(a);
        }
        function Failure() {
            $('#modalConfirm').modal('hide');
            $('#SaveModalConfirm').modal('hide');
            $('#kt_modal_1_5').modal('show');
        }
        function failedModal(res) {
            $('#modalConfirm').modal('hide');
            $('#SaveModalConfirm').modal('hide');
            $('#kt_modal_1_2').modal('show');
            $('#failres').text(res);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="lnkAdd">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="SaveModalConfirm" />
                    <telerik:AjaxUpdatedControl ControlID="grvRpt" />
                </UpdatedControls>
            </telerik:AjaxSetting>

        </AjaxSettings>

    </telerik:RadAjaxManagerProxy>

    <div class="card-body" style="padding: 20px; background-color: white;">

        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12 mb-3" Width="100%" ID="RadPanelBar0" runat="server">
            <Items>
                <telerik:RadPanelItem Font-Bold="true" Expanded="true" BackColor="white">

                    <ContentTemplate>
                        <div class="kt-portlet__body mt-5 mb-2" style="background-color: white; display: grid; padding-left: 20px;">
                            <table>

                                <td style="width: 30%">
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Project Code:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblProjectCode" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Project Name:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblProjectName" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Email:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblProjectEmail" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                </td>
                                <td style="width: 30%">
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Contact Person:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblContactPerson" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Contact Number:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblContactNum" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Status:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblStatus" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                </td>
                                <td style="width: 30%">


                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">CreatedDate:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblCreatedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">ModifiedDate:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblModifiedDate" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>


                                </td>

                            </table>
                        </div>

                    </ContentTemplate>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>



        <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <div class="col-lg-12 row pt-2 mb-4">
                <div class="col-lg-4 form-group pt-2">
                    <label class="control-label col-lg-12">Customer<span class="required"></span></label>
                    <div class="col-lg-12">
                        <telerik:RadComboBox ID="ddlCustomer" Skin="Silk" runat="server" EmptyMessage="Select Customers" RenderMode="Lightweight" CheckBoxes="true" Width="100%" Filter="Contains"></telerik:RadComboBox>
                        <asp:RequiredFieldValidator Filter="Contains" ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ValidationGroup="form"
                            ControlToValidate="ddlCustomer" ErrorMessage="Please select customers" ForeColor="Red"
                            SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    </div>
                </div>
                <div class="col-lg-2 pt-5 mt-2" style="text-align: center;">
                    <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-sm fw-bold btn-primary" ValidationGroup="form" OnClick="lnkAdd_Click" Width="100px">
                                      Add
                    </asp:LinkButton>
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


        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
        <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
            ID="grvRpt" GridLines="None"
            ShowFooter="True" AllowSorting="True"
            OnNeedDataSource="grvRpt_NeedDataSource"
            OnItemCommand="grvRpt_ItemCommand"
            AllowFilteringByColumn="true"
            ClientSettings-Resizing-ClipCellContentOnResize="true"
            EnableAjaxSkinRendering="true"
            AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="Small" CanRetrieveAllData="false"
                ShowFooter="false" DataKeyNames="cpt_ID"
                EnableHeaderContextMenu="true">
                <Columns>

                    <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText=" Code" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="200px"
                        HeaderStyle-Font-Size="Smaller" HeaderText=" Name" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="cus_ContactPerson" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Contact Person" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_ContactPerson">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="cus_ContactNumber" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Contact Number" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_ContactNumber">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="cus_Email" AllowFiltering="true" HeaderStyle-Width="200px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Email" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_Email">
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
            <ClientSettings EnableRowHoverStyle="true" AllowColumnsReorder="True">
                <Resizing AllowColumnResize="true"></Resizing>
                <Selecting AllowRowSelect="True" EnableDragToSelectRows="true"></Selecting>
            </ClientSettings>
        </telerik:RadGrid>
    </div>

    <div class="clearfix"></div>
    <div class="modal fade modal-center" id="modalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="Confirm">Are you sure you want to Delete..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                        <asp:LinkButton ID="lnkDel" runat="server" Text="Yes" OnClick="lnkDel_Click" CssClass="btn btn-sm fw-bold btn-primary" />
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
    <div class="modal fade modal-center" id="SaveModalConfirm" tabindex="-1" role="dialog" style="height: auto" data-backdrop="static" data-keyboard="false" aria-labelledby="exampleModalLabels" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="SaveConfirm">Are you sure you want to Save..??
                    </h5>
                </div>
                <div class="modal-footer">
                    <telerik:RadAjaxPanel ID="RadAjaxPanel3" runat="server" LoadingPanelID="RadAjaxLoadingPanel3">
                        <asp:LinkButton ID="lnkSaveCus" runat="server" Text="Yes" OnClick="lnkSaveCus_Click" CssClass="btn btn-sm fw-bold btn-primary" CausesValidation="false" />
                    </telerik:RadAjaxPanel>
                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel3" EnableEmbeddedSkins="false"
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
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
