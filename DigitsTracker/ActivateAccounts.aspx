<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivateAccounts.aspx.cs" Inherits="DigitsLicenseManagement.ActivateAccounts" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head><base href="../../../" />
   
		<meta charset="utf-8" />
		<title>DigiTS | Activate Account </title>
		<meta name="description" content="Activate Account - IssueTracker"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

		<meta property="og:locale" content="en_US" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="DigiTS - Business Management Solutions" />
		<meta property="og:url" content="https://turbosoft.technology" />
		<meta property="og:site_name" content="DigiTS - Business Management Solutions" />
		<link rel="canonical" href="https://turbosoft.technology" />
		<link rel="shortcut icon" href="BO_Digits/assets/media/logos/favicon.ico" />
		<!--begin::Fonts-->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Global Stylesheets Bundle(used by all pages)-->
		<link href="BO_Digits/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
		<link href="BO_Digits/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
		<!--end::Global Stylesheets Bundle-->

	<script>
        function Confirm() {
            if (Page_ClientValidate("claim")) {

                return;
            }

        }

        function SuccessModal(res) {

            $('#spnMsgs').text(res);
            $('#kt_modal_1_8').modal('show');
        }
        function ErrorModal(res) {

            $('#spnMsgsx').text(res);
            $('#kt_modal_1_9').modal('show');
        }
    </script>
    
</head>
<body data-kt-name="metronic" id="kt_body" class="app-blank app-blank">
    <!--begin::Theme mode setup on page load-->
		<script>if ( document.documentElement ) { const defaultThemeMode = "system"; const name = document.body.getAttribute("data-kt-name"); let themeMode = localStorage.getItem("kt_" + ( name !== null ? name + "_" : "" ) + "theme_mode_value"); if ( themeMode === null ) { if ( defaultThemeMode === "system" ) { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } else { themeMode = defaultThemeMode; } } document.documentElement.setAttribute("data-theme", themeMode); }</script>
		<!--end::Theme mode setup on page load-->
		<!--begin::Root-->

			<div class="d-flex flex-column flex-root" id="kt_app_root">
			<!--begin::Authentication - Sign-in -->
			<div class="d-flex flex-column flex-lg-row flex-column-fluid">
				<!--begin::Logo-->
			
				<!--end::Logo-->
				<!--begin::Aside-->
				<div class="d-flex flex-column flex-column-fluid flex-center w-lg-50 p-10">
					<!--begin::Wrapper-->
					<div class="d-flex justify-content-between flex-column-fluid flex-column w-100 mw-450px">
						<!--begin::Header-->
						<div class="d-flex flex-stack py-2">
							<!--begin::Back link-->
							<div class="me-2"></div>
							
						</div>
						<!--end::Header-->
						<!--begin::Body-->
						<div class="py-20">
							<!--begin::Form-->
							<form id="frmLogin" runat="server" class="form w-100">
								 <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
								<div class="card-body">
									<!--begin::Heading-->
									<div class="text-start mb-10">
										<!--begin::Title-->
										<h1 class="text-dark mb-3 fs-3x" data-kt-translate="sign-in-title">Sign In</h1>
										<!--end::Title-->
										<!--begin::Text-->
										<div class="text-gray-400 fw-semibold fs-6" data-kt-translate="general-desc">Sales Force Automation</div>
										<!--end::Link-->
									</div>

									<asp:Literal ID="ltrlError" runat="server" ></asp:Literal>
									<!--begin::Heading-->
									<!--begin::Input group=-->
									<div class="fv-row mb-8">
										<asp:TextBox ID="oldPassword" runat="server" autocomplete="off" placeholder="Enter Old Password"  class="form-control form-control-solid" TextMode="Password"></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldPassword" ValidationGroup="claim" ErrorMessage="Enter Old Password" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
									</div>

									<div class="fv-row mb-7">
										<asp:TextBox ID="newPass" runat="server" autocomplete="off" placeholder="Enter New Password" TextMode="Password" class="form-control form-control-solid" ></asp:TextBox>
											<%--<small>Password Must contain lower, upper cases , special charecters and numbers and between 8-15</small>--%>
										<asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="newPass" ErrorMessage="Password Must contain lower, upper cases , special charecters and numbers and between 8-15" 
											Display="Dynamic" ForeColor="Red" ValidationGroup="claim"></asp:RequiredFieldValidator>
										<asp:RegularExpressionValidator ID="reg1" runat="server" ControlToValidate="newPass" 
														 ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" 
														 ErrorMessage="Password Must contain lower, upper cases , special charecters and numbers and between 8-15" Font-Size="Smaller" Display="Dynamic" ForeColor="Red"> 
													 </asp:RegularExpressionValidator>
									</div>
									
									<div class="fv-row mb-7">
										<asp:TextBox ID="ConPass" runat="server" autocomplete="off" placeholder="Enter confirm password" TextMode="Password" class="form-control form-control-solid" ></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ConPass" ErrorMessage="Please Enter confirm password" Display="Dynamic" 
												ForeColor="Red" ValidationGroup="claim"></asp:RequiredFieldValidator>
										<asp:CompareValidator ID="clp" runat="server" ValidationGroup="claim" ErrorMessage="Password Mismatch" ControlToCompare="newPass" 
														 ControlToValidate="ConPass"
														 Display="Dynamic" ForeColor="Red" Operator="Equal"></asp:CompareValidator>
									</div>

								

									<div class="d-flex flex-stack">
										<telerik:RadAjaxPanel ID="pnl" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

												<asp:LinkButton ID="lnkSignIn" runat="server" CausesValidation="true" OnClientClick="Confirm()" OnClick="lnkSignIn_Click" CommandName="Login" ValidationGroup="claim">
											<div  class="btn btn-primary me-2 flex-shrink-0">
											<span class="indicator-label" data-kt-translate="sign-in-submit">Sign In</span>
											<span class="indicator-progress">
												<span data-kt-translate="general-progress">Please wait...</span>
												<span class="spinner-border spinner-border-sm align-middle ms-2"></span>
											</span>
										</div>
										</asp:LinkButton>

										</telerik:RadAjaxPanel>

										 <telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false"
												BackColor="Transparent"
												ForeColor="Blue">
												<div class="col-lg-12 text-center mt-5">
													<img alt="Loading..." src="/Media/loader.gif" style="border: 0px;" />
												</div>
										  </telerik:RadAjaxLoadingPanel>
													<%--<telerik:RadAjaxLoadingPanel runat="server" Skin="Sunset" ID="RadAjaxLoadingPanel1" EnableEmbeddedSkins="false" BackColor="Transparent" ForeColor="Blue">
                                                <div class="col-lg-12 text-center mt-5">
                                                    <img alt="Loading..." src="/Media/loader.gif" style="border: 0px;" />
                                                </div>  
                                            </telerik:RadAjaxLoadingPanel>--%>
									</div>
								</div>

		<div class="modal fade" id="kt_modal_1_8" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" style="height:auto" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"> <span id="spnMsgs"></span> </h5>
                    </div>
                                        
                    <div class="modal-footer">
                        <asp:LinkButton ID="lnkbtnSucc" runat="server" OnClick="lnkbtnSucc_Click" class="btn btn-sm fw-bold btn-secondary" > OK</asp:LinkButton>
                    </div>
                </div>
            </div>
         </div>

			
        <div class="modal fade" id="kt_modal_1_9" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" style="height:auto" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"> <span id="spnMsgsx"></span> </h5>
                    </div>
                                        
                    <div class="modal-footer">
						<button class="btn btn-sm fw-bold btn-secondary" data-modal="dismiss" >Try Again after some time</button>
                        
                    </div>
                </div>
            </div>
         </div>

							</form>
							</div>
					
						<div class="m-0">
							
						
						</div>
						<!--end::Footer-->
					</div>
					<!--end::Wrapper-->
				</div>
				<!--end::Aside-->
				<!--begin::Body-->
				<div class="d-none d-lg-flex flex-lg-row-fluid w-50 bgi-size-cover bgi-position-y-center bgi-position-x-start bgi-no-repeat" style="background-image: url(BO_DIgits/assets/media/bg/Group_1863.png)"></div>
				<!--begin::Body-->
			</div>
			<!--end::Authentication - Sign-in-->
		</div>
	
		
		<!--end::Root-->
		<!--begin::Javascript-->
		<script>var hostUrl = "assets/";</script>
		<!--begin::Global Javascript Bundle(used by all pages)-->
		<script src="BO_Digits/assets/plugins/global/plugins.bundle.js"></script>
		<script src="BO_Digits/assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Custom Javascript(used by this page)-->
		<script src="BO_Digits/assets/js/custom/authentication/sign-in/general.js"></script>
		<script src="BO_Digits/assets/js/custom/authentication/sign-in/i18n.js"></script>
		<!--end::Custom Javascript-->
		<!--end::Javascript-->
</body>
</html>
