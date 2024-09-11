<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="DigitsLicenseManagement.ResetPassword" %>
<html lang="en" data-theme="light">
<head>
    <base href="../../../">
    <title>DigiTS | Login</title>
    <meta charset="utf-8">
    <meta name="description" content="A complete b2b solution for the business">
    <meta name="keywords" content="Metronic, Bootstrap, Bootstrap 5, Angular, VueJs, React, Asp.Net Core, Blazor, Django, Flask &amp; Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:locale" content="en_US">
    <meta property="og:type" content="article">
    <meta property="og:title" content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular, Asp.Net Core, Blazor, Django, Flask &amp; Laravel Admin Dashboard Theme">
    <meta property="og:url" content="https://keenthemes.com/metronic">
    <meta property="og:site_name" content="Keenthemes | Metronic">
    <link rel="canonical" href="https://preview.keenthemes.com/metronic8">
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
       
    </script>
<body data-kt-name="metronic" id="kt_body" class="app-blank bgi-size-cover bgi-position-center bgi-no-repeat">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

    <!--begin::Theme mode setup on page load-->
    <script>if ( document.documentElement ) { const defaultThemeMode = "system"; const name = document.body.getAttribute("data-kt-name"); let themeMode = localStorage.getItem("kt_" + ( name !== null ? name + "_" : "" ) + "theme_mode_value"); if ( themeMode === null ) { if ( defaultThemeMode === "system" ) { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } else { themeMode = defaultThemeMode; } } document.documentElement.setAttribute("data-theme", themeMode); }</script>
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
            <div class="d-flex flex-center w-lg-50 pt-15 pt-lg-0 px-10">
                <!--begin::Aside-->
                <div class="d-flex flex-column">
                    <!--begin::Logo-->
                   
                        <img alt="Logo" src="BO_DIgits/assets/media/bg/logo.svg">
                  
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
                <div class="card w-md-500px rounded-extra shadow">

                    <form class="form w-100" runat="server" >
                    <!--begin::Card body-->
                    <div class="card-body p-10 p-lg-20">
                        <!--begin::Form-->
                            <!--begin::Heading-->
                            <div class="text-center mb-11">
                                <!--begin::Title-->
                                <h2 class="text-dark fw-bolder mb-3">Forgot Password</h2>
                                <!--end::Title-->
                                <!--begin::Subtitle-->
                                <div class="text-gray-500 fw-semibold fs-6">Enter your UserName to reset your password.</div>
                                <!--end::Subtitle=-->
                            </div>
                            <!--begin::Heading-->
                            <!--begin::Login options-->
                           
                            <!--end::Login options-->
                            <!--begin::Separator-->
                          
                            <!--end::Separator-->
                            <!--begin::Input group=-->
                         
                        <asp:Literal ID="ltrlMessage" runat="server" ></asp:Literal>
                        <asp:PlaceHolder ID="pnlsubmit" runat="server" Visible="true">
                           <div class="fv-row mb-8">
										<asp:TextBox ID="txtUsername" runat="server" autocomplete="off" placeholder="UserName"  class="form-control form-control-solid  "></asp:TextBox>								
										<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter username" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
									</div>
                         
                           
                            
                            <div class="d-grid mb-10">
                                <div class="d-flex flex-stack justify-content-center">
									<!--begin::Link-->
									<div class="m-0">
                                    <asp:LinkButton runat="server" type="submit" ID="lnkReset" class="btn btn-primary btn-rounded" OnClick="lnkReset_Click">
                                    
                                    <span class="indicator-label">Submit</span>
                                    
                                    <span class="indicator-progress">
                                        Please wait...
                                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                    </span>
                                    <!--end::Indicator progress-->
                                </asp:LinkButton>
										<a href="Login.aspx" class="btn  btn-light-primary " data-kt-translate="password-reset-cancel">Cancel</a>
									</div>
									<!--end::Link-->
								</div>
                            </div>
                           </asp:PlaceHolder>
                         <asp:PlaceHolder ID="pnlOK" runat="server" Visible="false">
                             <asp:LinkButton runat="server" type="submit" ID="lnkOK" class="btn btn-primary btn-rounded" OnClick="lnkOk_Click"> 
                                  <span class="indicator-label">OK</span>
                             </asp:LinkButton>
                         </asp:PlaceHolder>
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

