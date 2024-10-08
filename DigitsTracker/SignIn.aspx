<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="DigitsLicenseManagement.SignIn" %>

<!DOCTYPE html>

<html lang="en" data-theme="light">
<!--begin::Head-->
<head>
    <base href="../../../">
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<!--end::Head-->

<%--<script type="text/javascript">  
    $(document).ready(function () {
        $('#show_password').hover(function show() {
            //Change the attribute to text  
            $('#txtPassword').attr('type', 'text');
            $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
        },
            function () {
                //Change the attribute back to password  
                $('#txtPassword').attr('type', 'password');
                $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
            });
        //CheckBox Show Password  
        $('#ShowPassword').click(function () {
            $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
        });
    });
</script>--%>

<script type="text/javascript">
    function button_click(objTextBox, objBtnID) {
        if (window.event.keyCode == 13) {
            document.getElementById(objBtnID).focus();
            document.getElementById(objBtnID).click();
        }
    }
</script>

<!--begin::Body-->
<body data-kt-name="metronic" id="kt_body" class="app-blank app-blank">
    <!--begin::Theme mode setup on page load-->
    <script>if (document.documentElement) { const defaultThemeMode = "system"; const name = document.body.getAttribute("data-kt-name"); let themeMode = localStorage.getItem("kt_" + (name !== null ? name + "_" : "") + "theme_mode_value"); if (themeMode === null) { if (defaultThemeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } else { themeMode = defaultThemeMode; } } document.documentElement.setAttribute("data-theme", themeMode); }</script>
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
                        <form class="form w-100" runat="server">
                            <!--begin::Body-->
                            <div class="card-body">
                                <!--begin::Heading-->
                                <div class="text-start mb-10">
                                    <!--begin::Title-->
                                    <h1 class="text-dark mb-3 fs-3x" data-kt-translate="sign-in-title">Sign In</h1>
                                    <!--end::Title-->
                                    <!--begin::Text-->
                                    <div class="text-gray-400 fw-semibold fs-6" data-kt-translate="general-desc">Business To Business</div>
                                    <!--end::Link-->
                                </div>

                                <asp:Literal ID="ltrlError" runat="server"></asp:Literal>
                                <!--begin::Heading-->
                                <!--begin::Input group=-->
                                <div class="fv-row mb-8">
                                    <asp:TextBox ID="txtUsername" runat="server" autocomplete="off" placeholder="Email" class="form-control form-control-solid"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter username" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="input-group">
                                    <%--class="fv-row mb-7"--%>
                                    <asp:TextBox ID="txtPassword" runat="server" autocomplete="off" placeholder="Password" TextMode="Password" class="form-control form-control-solid" data-toogle="txtPassword"></asp:TextBox>

                                    
                                    <%--<div class="input-group-append">
                                        <span id="show_password" style="cursor: pointer; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
                                            <i class="fa fa-eye"></i>
                                        </span>

                                       <%-- <button id="show_password" type="button">
                                            <span> <i class="fa fa-eye"></i></span>
                                        </button>-
                                    </div>--%>

                                    <asp:RequiredFieldValidator ID="reqPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>

                                </div>

                                <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-10">
                                    <div>
                                        <asp:CheckBox ID="chkRemember" runat="server" Text="Remember" CssClass="sign-in-custom-checkbox" />
                                    </div>
                                    <a href="Password.aspx" class="link-primary" data-kt-translate="sign-in-forgot-password">Forgot Password ?</a>
                                </div>
                                <div class="d-flex flex-stack">

                                    <asp:LinkButton ID="lnkSignIn" runat="server" CausesValidation="true" OnClick="lnkSignIn_Click">
											<div  class="btn btn-primary me-2 flex-shrink-0">
											<span class="indicator-label" data-kt-translate="sign-in-submit">Sign In</span>
											<span class="indicator-progress">
												<span data-kt-translate="general-progress">Please wait...</span>
												<span class="spinner-border spinner-border-sm align-middle ms-2"></span>
											</span>
										</div>
                                    </asp:LinkButton>

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
            <div class="d-none d-lg-flex flex-lg-row-fluid w-50 bgi-size-cover bgi-position-y-center bgi-position-x-start bgi-no-repeat" style="background-image: url(BO_DIgits/assets/media/bg/Group_2279.png)"></div>
            <!--begin::Body-->
        </div>
        <!--end::Authentication - Sign-in-->
    </div>


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
    <script src="BO_Digits/assets/js/custom/authentication/sign-in/i18n.js"></script>
    <!--end::Custom Javascript-->
    <!--end::Javascript-->
</body>
<!--end::Body-->
</html>
