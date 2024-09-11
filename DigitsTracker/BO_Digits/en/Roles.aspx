<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.Roles" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Actions" runat="server">
      <asp:PlaceHolder ID="pnlButton" runat="server">
                            <div class="kt-portlet__head-actions">
                                <asp:LinkButton ID="lnkAddRole" runat="server" CssClass="btn btn-sm fw-bold btn-primary" OnClick="lnkAddRole_Click">
                                                    Add
                                </asp:LinkButton>
                            </div>
                        </asp:PlaceHolder>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="card-body p-8" style="background-color:white;"> 

                            <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Material" />
                            <telerik:RadGrid RenderMode="Lightweight" runat="server" EnableLinqExpressions="false" AllowMultiRowSelection="false"
                                ID="grvRpt" GridLines="None"
                                ShowFooter="True" AllowSorting="True"
                                OnNeedDataSource="grvRpt_NeedDataSource"
                                AllowFilteringByColumn="true"
                                ClientSettings-Resizing-ClipCellContentOnResize="true"
                                EnableAjaxSkinRendering="true"
                                AllowPaging="true" PageSize="50" CellSpacing="0">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" ScrollHeight="500"></Scrolling>
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" FilterItemStyle-Font-Size="XX-Small" CanRetrieveAllData="false"
                                    ShowFooter="false" DataKeyNames="RoleId"
                                    EnableHeaderContextMenu="true">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="RoleName" AllowFiltering="true" HeaderStyle-Width="60px"
                                            HeaderStyle-Font-Size="Smaller" HeaderText="Role Name" FilterControlWidth="100%"
                                            CurrentFilterFunction="Contains" AutoPostBackOnFilter="true" ShowFilterIcon="false"
                                            HeaderStyle-Font-Bold="true" UniqueName="RoleName">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerScripts" runat="server">
</asp:Content>
