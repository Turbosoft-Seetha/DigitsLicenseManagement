<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="LicenseManagement.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.LicenseManagement" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
     <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
        <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-sm fw-bold btn-primary" Text="Add" OnClick="lnkAdd_Click" CausesValidation="false"></asp:LinkButton>
        
     </telerik:RadAjaxPanel>

                    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
                        BackColor="Transparent"
                        ForeColor="Blue">
                        <div class="col-lg-12 text-center mt-5">
                            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
                        </div>
                    </telerik:RadAjaxLoadingPanel>
    <asp:LinkButton ID="lnkResetGridFilter" runat="server"  CssClass="btn btn-sm fw-bold btn-secondary" Text="Reset Grid" OnClick="lnkResetGridFilter_Click" Visible="false"></asp:LinkButton>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card-body p-8" style="background-color: white;">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">

        <%-- Filter starts --%>

        <div class="col-lg-12 row mb-4" hidden="hidden">

            <div class="col-lg-2">
                <label class="control-label col-lg-12">From Date</label>
                <div class="col-lg-12">
                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdfromDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                    </telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="From Date is mandatory" ForeColor="Red" ControlToValidate="rdfromDate"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="col-lg-2">
                <label class="control-label col-lg-12">To Date</label>
                <div class="col-lg-12">
                    <telerik:RadDatePicker RenderMode="Lightweight" ID="rdendDate" DateInput-DateFormat="dd-MMM-yyyy" runat="server" Width="100%">
                    </telerik:RadDatePicker>
                    <asp:CompareValidator ID="dd" runat="server" ControlToValidate="rdendDate" ControlToCompare="rdfromDate" ErrorMessage="End date must be greater"
                        Display="Dynamic" ForeColor="Red" Operator="GreaterThanEqual"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="l" runat="server" Display="Dynamic" ErrorMessage="To Date is mandatory" ForeColor="Red" ControlToValidate="rdendDate"></asp:RequiredFieldValidator>
                </div>
            </div>
           

            <div class="col-lg-2 pt-5 mt-2" style="text-align: center;">
                <asp:LinkButton ID="lnkFilter" runat="server" CssClass="btn btn-sm btn-primary me-2" BackColor="#DAE9F8" ForeColor="#009EF7" OnClick="lnkFilter_Click">
                                             Apply Filter
                </asp:LinkButton>
            </div>
            <div class="col-lg-2 pt-5 mt-2">
                <asp:LinkButton ID="lnkReset" runat="server" CssClass="btn btn-sm btn-secondary me-2" CausesValidation="false" OnClick="lnkReset_Click">
                          Reset
                </asp:LinkButton>
            </div>

        </div>

        <%-- Filter ends --%>

        <%-- Grid starts --%>

        <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
        <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
            ID="grvRpt" GridLines="None"
            ShowFooter="True" AllowSorting="True"
            OnNeedDataSource="grvRpt_NeedDataSource"
            OnItemCommand="grvRpt_ItemCommand"
            OnItemDataBound="grvRpt_ItemDataBound"
            AllowFilteringByColumn="true"
            ClientSettings-Resizing-ClipCellContentOnResize="true"
            EnableAjaxSkinRendering="true"
            AllowPaging="true" PageSize="10" CellSpacing="0" PagerStyle-AlwaysVisible="true">
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500px"></Scrolling>
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                ShowFooter="false" DataKeyNames="ID"
                EnableHeaderContextMenu="true">
                <Columns>
                     <telerik:GridTemplateColumn HeaderStyle-Width="40px" AllowFiltering="false" HeaderText="Edit" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Edit">
                         <ItemTemplate>
                             <asp:ImageButton CommandName="Edit" ID="Edit" Visible="true" AlternateText="Edit" runat="server" CausesValidation="false"
                                 ImageUrl="../assets/media/svg/general/edit.svg"></asp:ImageButton>
                         </ItemTemplate>
                     </telerik:GridTemplateColumn>

                    <telerik:GridTemplateColumn HeaderStyle-Width="50px" AllowFiltering="false" HeaderText="Detail" HeaderStyle-Font-Size="Smaller" HeaderStyle-Font-Bold="true" UniqueName="Detail">
                        <ItemTemplate>
                            <asp:ImageButton CommandName="Detail" ID="Detail" Visible="true" AlternateText="Detail" runat="server" CausesValidation="false"
                                ImageUrl="../assets/media/icons/Detail.png" Width="22px"></asp:ImageButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                      <telerik:GridBoundColumn DataField="pke_LicenseNumber" AllowFiltering="true" HeaderStyle-Width="150px"
                          HeaderStyle-Font-Size="Smaller" HeaderText="License Number" FilterControlWidth="100%"
                          CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                          HeaderStyle-Font-Bold="true" UniqueName="pke_LicenseNumber">
                      </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="cus_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Customer Code" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="cus_Code">
                    </telerik:GridBoundColumn>
                    
                     <telerik:GridBoundColumn DataField="cus_Name" AllowFiltering="true" HeaderStyle-Width="200px"
                         HeaderStyle-Font-Size="Smaller" HeaderText="Customer Name" FilterControlWidth="100%"
                         CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                         HeaderStyle-Font-Bold="true" UniqueName="cus_Name">
                     </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="prj_Code" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Project Code" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="prj_Code">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="prj_Name" AllowFiltering="true" HeaderStyle-Width="200px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Project Name" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="prj_Name">
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="pke_LicenseKey" AllowFiltering="true" HeaderStyle-Width="350px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="License Key" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="pke_LicenseKey">
                    </telerik:GridBoundColumn>

                     <telerik:GridBoundColumn DataField="pke_LicenseType" AllowFiltering="true" HeaderStyle-Width="150px"
                         HeaderStyle-Font-Size="Smaller" HeaderText="License Type" FilterControlWidth="100%"
                         CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                         HeaderStyle-Font-Bold="true" UniqueName="pke_LicenseType">
                     </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="CreatedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="CreatedDate" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="CreatedDate">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="StartDate" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="StartDate" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="StartDate">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="ExpiryDate" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="ExpiryDate" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="ExpiryDate">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="BufferPeriodInDays" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Buffer Period In Days" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="BufferPeriodInDays">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="NeedExpiryNotification" AllowFiltering="true" HeaderStyle-Width="100px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Expiry Notification" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="NeedExpiryNotification">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Prior_Exp_Notfctn_Intrvl_InDays" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="Prior Expiry Notification Intervel in Days" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="Prior_Exp_Notfctn_Intrvl_InDays">
                    </telerik:GridBoundColumn> 

                    <telerik:GridBoundColumn DataField="ModifiedDate" AllowFiltering="true" HeaderStyle-Width="150px"
                        HeaderStyle-Font-Size="Smaller" HeaderText="ModifiedDate" FilterControlWidth="100%"
                        CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                        HeaderStyle-Font-Bold="true" UniqueName="ModifiedDate">
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

        <%-- Grid ends --%>
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel2" EnableEmbeddedSkins="false"
        BackColor="Transparent"
        ForeColor="Blue">
        <div class="col-lg-12 text-center mt-5">
            <img alt="Loading..." src="../assets/media/bg/loader.gif" style="border: 0px;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
