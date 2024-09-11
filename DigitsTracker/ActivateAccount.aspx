<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivateAccount.aspx.cs" Inherits="DigitsLicenseManagement.ActivateAccount" %>
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
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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


	<script type="text/javascript">
        $(document).ready(function () {
            // Toggle password visibility on hover
            $('#show_password').hover(function () {
                // Change the attribute to text
               
                $('#oldPassword').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    // Change the attribute back to password
                    $('#oldPassword').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });

            // Checkbox to show/hide password
            $('#ShowPassword').click(function () {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>

    <body data-kt-name="metronic" id="kt_body" class="app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

    <!--begin::Theme mode setup on page load-->
    <script>if (document.documentElement) { const defaultThemeMode = "system"; const name = document.body.getAttribute("data-kt-name"); let themeMode = localStorage.getItem("kt_" + (name !== null ? name + "_" : "") + "theme_mode_value"); if (themeMode === null) { if (defaultThemeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } else { themeMode = defaultThemeMode; } } document.documentElement.setAttribute("data-theme", themeMode); }</script>
    <!--end::Theme mode setup on page load-->
    <!--begin::Root-->
    <div class="d-flex flex-column flex-root" id="kt_app_root">
        <!--begin::Page bg image-->
        <style>
            body {
                background-image: url('BO_DIgits/assets/media/bg/bg4.jpg');
            }

            [data-theme="dark"] body {
                background-image: url('assets/media/auth/bg4-dark.jpg');
            }

             .rounded-extra {
        border-radius: 1.6rem; /* Adjust the value as needed for extra rounding */
    }
        </style>
        <!--end::Page bg image-->
        <!--begin::Authentication - Sign-in -->
        <div class="d-flex flex-column flex-column-fluid flex-lg-row">
            <!--begin::Aside-->
            <div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10 mt-5 me-5">
                <!--begin::Aside-->
                <div class="d-flex flex-column">
                    <!--begin::Logo-->
                    <a href="../../demo1/dist/index.html" class="mb-7">
                        <img alt="Logo" src="BO_DIgits/assets/media/bg/logo.svg"/>
                    </a>
                    <!--end::Logo-->
                    <!--begin::Title-->
                    <h2 class="text-white fw-normal m-0">Track everyday project work for each employee</h2>
                    <!--end::Title-->
                </div>
                <!--begin::Aside-->
            </div>
            <!--begin::Aside-->
            <!--begin::Body-->
            <div class="d-flex flex-center w-lg-50 p-10">
                <!--begin::Card-->
                <div class="card w-md-550px rounded-extra shadow">
<form id="frmLogin" runat="server" class="form w-100">
								 <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
								<div class="card-body">
									<!--begin::Heading-->
									<div class="text-start mb-10">
										<!--begin::Title-->
										<h1 class="text-dark mb-3 fs-3x" data-kt-translate="sign-in-title">Sign In</h1>
										<!--end::Title-->
										<!--begin::Text-->
										<div class="text-gray-400 fw-semibold fs-6" data-kt-translate="general-desc">DigiTs Work Tracker</div>
										<!--end::Link-->
									</div>

									<asp:Literal ID="ltrlError" runat="server" ></asp:Literal>
									<!--begin::Heading-->
									<!--begin::Input group=-->
									<div>
									<div class="fv-row mb-8 input-group">
										<asp:TextBox ID="oldPassword" runat="server" autocomplete="off" placeholder="Enter Old Password"  class="form-control form-control-solid" TextMode="Password"  data-toogle="oldPassword"></asp:TextBox>

											<div class="input-group-append ms-2 mt-3">
                                        <button id="show_password" type="button" class=" btn-lg">
                                            <span> <i class="fa fa-eye"></i></span>
                                        </button>
                                    </div>

									</div>
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

								

									<%--<div class="d-grid mb-10">
										<telerik:RadAjaxPanel ID="pnl" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

												<asp:LinkButton ID="lnkSignIn" runat="server" class='btn btn-primary btn-rounded btn-lg' CausesValidation="true" OnClientClick="Confirm()" OnClick="lnkSignIn_Click" CommandName="Login" ValidationGroup="claim">
											
											<span class="indicator-label" data-kt-translate="sign-in-submit">Sign In</span>
											<span class="indicator-progress">
												<span data-kt-translate="general-progress">Please wait...</span>
												<span class="spinner-border spinner-border-sm align-middle ms-2"></span>
											</span>
										
										</asp:LinkButton>--%>
                                    <div class="d-grid mb-10">

                                    <telerik:RadAjaxPanel ID="pnl" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                  
                                 <asp:LinkButton ID="LinkButton1" runat="server" class='btn btn-primary btn-rounded btn-lg' CausesValidation="true" OnClientClick="Confirm()" OnClick="lnkSignIn_Click" CommandName="Login" ValidationGroup="claim">

                                    <!--begin::Indicator label-->
                                    <span class="indicator-label">Sign In</span>
                                    <!--end::Indicator label-->
                                    <!--begin::Indicator progress-->
                                    <span class="indicator-progress">
                                        Please wait...
                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                    </span>
                                    <!--end::Indicator progress-->
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
								
    

		<div class="modal fade" id="kt_modal_1_8" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" style="height:auto" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"> <span id="spnMsgs"></span> </h5>
                    </div>
                                        
                    <div class="modal-footer">
                        <asp:LinkButton ID="lnkbtnSucc" runat="server" OnClick="lnkbtnSucc_Click" class="btn btn-sm fw-bold btn-secondary">Login Now </asp:LinkButton>
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
                        
                        <!--end::Form-->
                    </div>
                
                    <!--end::Card body-->
                </div>
            
                <!--end::Card-->
            </div>
        
        
            <!--end::Body-->
        
    
        <!--end::Authentication - Sign-in-->
   
    <!--end::Root-->
    <!--begin::Javascript-->
    <script>var hostUrl = "assets/";</script>
    <!--begin::Global Javascript Bundle(used by all pages)-->
    <script src="BO_Digits/assets/plugins/global/plugins.bundle.js"></script>
    <script src="BO_Digits/assets/js/scripts.bundle.js"></script>
    <!--end::Global Javascript Bundle-->
    <!--begin::Custom Javascript(used by this page)-->
    <script src="BO_Digits/assets/js/custom/authentication/sign-in/general.js"></script>
    <!--end::Custom Javascript-->
    <!--end::Javascript-->


    <svg id="SvgjsSvg1001" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;"><defs id="SvgjsDefs1002"></defs><polyline id="SvgjsPolyline1003" points="0,0"></polyline><path id="SvgjsPath1004" d="M0 0 "></path></svg>
        </div>
</body>


    </html>