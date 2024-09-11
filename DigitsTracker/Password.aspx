<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="DigitsLicenseManagement.Password" %>

<!DOCTYPE html>

<html lang="en" data-theme="light">
	<!--begin::Head-->
	<head><base href="../../../">
		<title>DigiTS | Login</title>
		<meta charset="utf-8" />
		<meta name="description" content="A complete b2b solution for the business" />
		<meta name="keywords" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
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

			<script type="text/javascript">
                function SuccessModal(res) {

                    $('#spnMsg').text(res);
                    $('#kt_modal_1_8').modal('show');
                }
</script>

	</head>
	<!--end::Head-->
	<!--begin::Body-->
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
							
								<form class="form w-100" runat="server" >
								<!--begin::Heading-->
								<div class="text-start mb-10">
									<!--begin::Title-->
									<h1 class="text-dark mb-3 fs-3x" data-kt-translate="password-reset-title">Forgot Password ?</h1>
									<!--end::Title-->
									<!--begin::Text-->
									<div class="text-gray-400 fw-semibold fs-6" data-kt-translate="password-reset-desc">Enter your email to reset your password.</div>
									<!--end::Link-->
								</div>
								<!--begin::Heading-->
								<!--begin::Input group-->

									<asp:Literal ID="ltrlMessage" runat="server" ></asp:Literal>
								<div class="fv-row mb-10">
									
									<asp:TextBox ID="txtUsername" runat="server" autocomplete="off" placeholder="Email" class="form-control form-control-solid" ></asp:TextBox>
											<asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter Email" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>


								</div>
								<!--end::Input group-->
								<!--begin::Actions-->
								<div class="d-flex flex-stack">
									<!--begin::Link-->
									<div class="m-0">
										<asp:LinkButton ID="lnkReset" runat="server" CausesValidation="true" OnClick="lnkReset_Click" >
										<button class="btn btn-primary me-2" data-kt-translate="password-reset-submit">
											<!--begin::Indicator label-->
											<span class="indicator-label">Submit</span>
											<!--end::Indicator label-->
											<!--begin::Indicator progress-->
											<span class="indicator-progress">Please wait...
											<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
											<!--end::Indicator progress-->
										</button>
											</asp:LinkButton>
										<a href="SignIn.aspx" class="btn btn-lg btn-light-primary fw-bold" data-kt-translate="password-reset-cancel">Cancel</a>
									</div>
									<!--end::Link-->
								</div>
								<!--end::Actions-->
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
				<div class="d-none d-lg-flex flex-lg-row-fluid w-50 bgi-size-cover bgi-position-y-center bgi-position-x-start bgi-no-repeat" style="background-image: url(BO_DIgits/assets/media/bg/bg11.png)"></div>
				<!--begin::Body-->
			</div>
			<!--end::Authentication - Sign-in-->
		</div>
		<div class="modal fade" id="kt_modal_1_8" tabindex="-1" data-backdrop="static" data-keyboard="false"  role="dialog" aria-labelledby="exampleModalLabel" style="height:auto" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title"><span id="spnMsg"></span></h5>
								</div>

								<div class="modal-footer">
									<asp:LinkButton ID="lnkOk" runat="server" OnClick="lnkOk_Click" Text="OK"  CssClass="btn btn-secondary" ></asp:LinkButton>
								</div>
							</div>
						</div>
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
	<!--end::Body-->
</html>