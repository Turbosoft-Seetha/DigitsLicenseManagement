<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="LicenseManagementDetail.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.LicenseManagementDetail" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color: white;">
        <telerik:RadPanelBar RenderMode="Lightweight" CssClass="col-lg-12 mb-3" Width="100%" ID="RadPanelBar0" runat="server">
            <Items>
                <telerik:RadPanelItem Font-Bold="true" Expanded="true" BackColor="white">

                    <ContentTemplate>
                        <div class="kt-portlet__body mt-5 mb-2" style="background-color: white; display: grid; padding-left: 20px;">
                            <table>

                                <td style="width: 30%">
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">License Number:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblLicenseNumber" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Customer:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblProjectCustomer" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>


                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">StartDate:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblStartDate" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Buffer Period in days:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblBufferPeriod" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>


                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Customer Contact Person:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblContactPerson" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">API Last Upadated Time:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblAPILastAPIUpadted" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                </td>
                                <td style="width: 30%">
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">License Key:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblLicenseKey" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Project:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblProject" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">ExpiryDate:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblExpiryDate" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Expiry Notification:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblNeedExpiryNoti" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Customer Contact Number:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblContactNumber" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Status:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblStatus" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                </td>
                                <td style="width: 30%">
                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">License Type:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblLicenseType" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

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


                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Prior Expiry Notification:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblPriorExpNoti" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>

                                    <div class="col-lg-12 mb-2">
                                        <label class="col-lg-2 col-form-label" style="display: contents;">Customer Email:</label>
                                        <label class="col-lg-4 col-form-label" style="display: contents;">
                                            <asp:Label ID="lblCusEmail" Font-Bold="true" runat="server"></asp:Label></label>
                                    </div>
                                </td>

                            </table>
                        </div>

                    </ContentTemplate>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>

        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />

        <div class="col-lg-12 row">
            <div class="col-lg-12">
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
                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="300px"></Scrolling>
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                        ShowFooter="false" DataKeyNames="ID"
                        EnableHeaderContextMenu="true">
                        <Columns>

                            <telerik:GridBoundColumn DataField="plm_Name" AllowFiltering="true" HeaderStyle-Width="150px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="Project Platform" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="plm_Name">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="puc_NoOfUsers" AllowFiltering="true" HeaderStyle-Width="100px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="No Of Users" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="puc_NoOfUsers">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="puc_NoOfConsumedUsers" AllowFiltering="true" HeaderStyle-Width="100px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="No Of Consumed Users" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="puc_NoOfConsumedUsers">
                            </telerik:GridBoundColumn>


                            <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="CreatedDate" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="Status" AllowFiltering="true" HeaderStyle-Width="100px"
                                HeaderStyle-Font-Size="Smaller" HeaderText="Status" FilterControlWidth="100%"
                                CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                HeaderStyle-Font-Bold="true" UniqueName="Status">
                            </telerik:GridBoundColumn>

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
           
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
