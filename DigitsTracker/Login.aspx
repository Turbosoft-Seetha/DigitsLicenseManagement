<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigitsLicenseManagement.Login" %>
<html lang="en" data-theme="light">
<head>
    <base href="../../../">
    <title>DigiTS | Login</title>
    <meta charset="utf-8">
    <meta name="description" content="A complete b2b solution for the business">
    <meta name="keywords" content=" ">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:locale" content="en_US">
    <meta property="og:type" content="article">
    <meta property="og:title" content="DigiTS - License Management">
    <meta property="og:url" content="https://turbosoft.technology">
    <meta property="og:site_name" content="DigiTS - License Management">
    <link rel="canonical" href="https://turbosoft.technology">
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico">
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700">
    <!--end::Fonts-->
    <!--begin::Global Stylesheets Bundle(used by all pages)-->
    <link href="BO_Digits/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css">
    <link href="BO_Digits/assets/css/style.bundle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--end::Global Stylesheets Bundle-->
</head>


    <script type="text/javascript">
        $(document).ready(function () {
            // Toggle password visibility on hover
            $('#show_password').hover(function () {
                // Change the attribute to text

                $('#txtPassword').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    // Change the attribute back to password
                    $('#txtPassword').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });

            // Checkbox to show/hide password
            $('#ShowPassword').click(function () {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>

    	<script type="text/javascript">
            function button_click(objTextBox, objBtnID) {
                if (window.event.keyCode == 13) {
                    document.getElementById(objBtnID).focus();
                    document.getElementById(objBtnID).click();
                }
            }
       </script>

<body data-kt-name="metronic" id="kt_body" class="app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

    <!--begin::Theme mode setup on page load-->
    <script>if (document.documentElement) { const defaultThemeMode = "system"; const name = document.body.getAttribute("data-kt-name"); let themeMode = localStorage.getItem("kt_" + (name !== null ? name + "_" : "") + "theme_mode_value"); if (themeMode === null) { if (defaultThemeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: light)").matches ? "light" : "light"; } else { themeMode = defaultThemeMode; } } document.documentElement.setAttribute("data-theme", themeMode); }</script>
    <!--end::Theme mode setup on page load-->
    <!--begin::Root-->
    <div class="d-flex flex-column flex-root" id="kt_app_root">
        <!--begin::Page bg image-->
        <style>
            body {
                background-image: url('BO_DIgits/assets/media/bg/bg4.jpg');
            }

            [data-theme="light"] body {
                background-image: url('BO_DIgits/assets/media/bg/bg4.jpg');
            }

             .rounded-extra {
        border-radius: 1.6rem; /* Adjust the value as needed for extra rounding */
    }

              .link-primary {
        text-decoration: none;
    }
        </style>
        <!--end::Page bg image-->
        <!--begin::Authentication - Sign-in -->
        <div class="d-flex flex-column flex-column-fluid flex-lg-row">
            <!--begin::Aside-->
            <div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10">
                <!--begin::Aside-->
                <div class="d-flex flex-column">
                    <!--begin::Logo-->
                    <div  class="mb-7">
                        <img alt="Logo" src="BO_DIgits/assets/media/bg/logo.svg" style="width:500px;">
                    </div>
                    <!--end::Logo-->
                    <!--begin::Title-->
                    <h2 class="text-white fw-normal m-0">Streamlining Customer Project License Management.</h2>
                    <!--end::Title-->
                </div>
                <!--begin::Aside-->
            </div>
            <!--begin::Aside-->
            <!--begin::Body-->
            <div class="d-flex flex-center w-lg-50 p-10">
                <!--begin::Card-->
                <div class="card w-md-500px rounded-extra shadow">

                    <form class="form w-100" runat="server" >
                    <!--begin::Card body-->
                    <div class="card-body p-10 p-lg-20">
                        <!--begin::Form-->
                            <!--begin::Heading-->
                            <div class="text-center mb-11">
                                <!--begin::Title-->
                                <h1 class="text-dark fw-bolder mb-3">Sign In</h1>
                                <!--end::Title-->
                                <!--begin::Subtitle-->
                                <div class="text-gray-500 fw-semibold fs-6">Sign in using your credentials</div>
                                <!--end::Subtitle=-->
                            </div>
                            <!--begin::Heading-->
                            <!--begin::Login options-->
                           
                            <!--end::Login options-->
                            <!--begin::Separator-->
                          
                            <!--end::Separator-->
                            <!--begin::Input group=-->
                            <asp:Literal ID="ltrlError" runat="server" ></asp:Literal>
                           <div class="fv-row mb-8">
										<asp:TextBox ID="txtUsername" runat="server" autocomplete="off" placeholder="username"  class="form-control form-control-solid  "></asp:TextBox>								
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter username" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
									</div>
                            <!--end::Input group=-->
                          <div class="input-group"> <%--class="fv-row mb-7"--%>
										<asp:TextBox ID="txtPassword" runat="server" autocomplete="off" placeholder="Password" TextMode="Password" class="form-control form-control-solid" data-toogle="txtPassword" ></asp:TextBox>
                              <div class="input-group-append ">
                                        <button id="show_password" type="button" >
                                            <span> <i class="fa fa-eye"></i></span>
                                        </button>
                                    </div>

						</div>
                        										<asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>

                            <!--end::Input group=-->
                            <!--begin::Wrapper-->
                           <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">
                                 <div></div>
                                    <!--begin::Link-->
                                    <%--<a href="../../demo1/dist/authentication/layouts/creative/reset-password.html" class="link-primary" style="text-decoration: none;">Forgot Password ?</a>--%>
                                    <!--end::Link-->
                               <a href="ResetPassword.aspx" class="link-primary" data-kt-translate="sign-in-forgot-password">Forgot Password ?</a>
                            </div>
                            <!--end::Wrapper-->
                            <!--begin::Submit button-->
                            <div class="d-grid mb-10">
                                <asp:LinkButton runat="server" type="submit" ID="lnkSignIn" class="btn btn-primary btn-rounded" OnClick="lnkSignIn_Click">
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
                            </div>
                            <!--end::Submit button-->
                            <!--begin::Sign up-->
                           <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-10 m justify-content-center">
										<div>	
											<asp:CheckBox ID="chkRemember" runat="server"  CssClass="sign-in-custom-checkbox" /> Remember me
										</div>
                            <!--end::Sign up-->
                           
                        </div>

                          <div class=" text-gray-500  fs-6 text-center ">
                                
                              By signing into DigiTS License Management, you accept the <br><a href="#" class="link-primary">Terms and Conditions</a> and
                               <a href="License.aspx" class="link-primary">Privacy Policy</a>
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
        </div>
    
        <!--end::Authentication - Sign-in-->
   
    <!--end::Root-->
    <!--begin::Javascript-->

     <script type="text/javascript">
         document.getElementById('<%= txtPassword.ClientID %>').setAttribute(
        "onkeypress", "button_click(this, '" + '<%= lnkSignIn.ClientID %>' + "')");
    </script>


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
</body><!--end::Body-->


    </html>

