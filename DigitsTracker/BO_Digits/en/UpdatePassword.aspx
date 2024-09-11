<%@ Page Title="" Language="C#" MasterPageFile="~/BO_Digits/en/en_master.Master" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="DigitsLicenseManagement.BO_Digits.en.UpdatePassword" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" runat="server">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	 <style>
        .custom-alert {
            display: none; 
            position: fixed;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
    </style>

    <script>
        function showSuccessNotification() {
            var successNotification = document.getElementById("successNotification");
            successNotification.style.display = "block";
        }

        function showFailureNotification() {
            var failureNotification = document.getElementById("failureNotification");
            failureNotification.style.display = "block";
        }

        function redirectToPage(page) {
            window.location.href = page;
        }
         function ClientValidate(source, clientside_arguments) {

             //Test whether the length of the value is more than 6 characters

             if (clientside_arguments.Value.length >= 6) {

                 clientside_arguments.IsValid = true;

             }

             else { clientside_arguments.IsValid = false };

         }


    </script>
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
		<div class="row">
			<div class="col-lg-12">
				<!--begin::Portlet-->
				<div class="kt-portlet" style="background-color:white; padding:20px;">
						<div class="kt-portlet__head" style="padding-top: 20px; padding-bottom: 20px;">
						<div class="kt-portlet__head-label">
							<h3 class="kt-portlet__head-title">User Password Update
							</h3>
						</div>

					</div>
					<div class="kt-portlet__body">
						<asp:Label ID="ltrlMessage" runat="server"></asp:Label>
						<div class="col-lg-12 row">
							<div class="col-lg-6 form-group">
								<label class="control-label col-lg-12">User Name</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="form-control" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
										ControlToValidate="txtEmail" ErrorMessage="Please Enter UserName" ForeColor="Red"
										SetFocusOnError="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="col-lg-6 form-group">
								<label class="control-label col-lg-12">First Name</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtFirstName" runat="server" MaxLength="100" CssClass="form-control" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
										ControlToValidate="txtFirstName" ErrorMessage="Please Enter First Name" ForeColor="Red"
										SetFocusOnError="True"></asp:RequiredFieldValidator>
								</div>
							</div>
						</div>
						<div class="col-lg-12 row">
							<div class="col-lg-6 form-group">
								<label class="control-label col-lg-12 mt-5">Last Name</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtLastName" runat="server" MaxLength="100" CssClass="form-control" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
								</div>
							</div>
							<div class="col-lg-6 form-group">
								<label class="control-label col-lg-12 mt-5">Contact No</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtContactInfo" runat="server" MaxLength="100" CssClass="form-control" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
								</div>
							</div>
						</div>
						<div class="col-lg-12 row">
							<div class="col-lg-4 form-group">
								<label class="control-label col-lg-12 mt-5">Old Password</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtOldPassword" runat="server" MaxLength="100" CssClass="form-control" TextMode="Password" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
										ControlToValidate="txtOldPassword" ErrorMessage="Please Enter Old Password" ForeColor="Red"
										SetFocusOnError="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="col-lg-4 form-group">
								<label class="control-label col-lg-12 mt-5">New Password</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtNewPassword" runat="server" MaxLength="100" CssClass="form-control" TextMode="Password" Width="100%" RenderMode="Lightweight" ></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
										ControlToValidate="txtNewPassword" ErrorMessage=" " ForeColor="Red"
										SetFocusOnError="True"></asp:RequiredFieldValidator>
<%--									<small>Password must contain minimum 8 characters with a combination of uppercase and lowercase letter and number</small>--%>
									<%--<asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="ClientValidate"
										ControlToValidate="txtNewPassword" runat="server" ErrorMessage="The password must be more than 6 characters."
										Display="Dynamic"></asp:CustomValidator>--%>
										 <asp:RegularExpressionValidator ID="reg1" runat="server" ControlToValidate="txtNewPassword"  
														 ValidationExpression="(?=^.{8,15}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{:;'?/>.<,])(?!.*\s).*$" 
														 ErrorMessage="Password must contain minimum 8 characters with a combination of uppercase and lowercase letter and number" Display="Dynamic" ForeColor="Red"> 
													 </asp:RegularExpressionValidator>
								</div>

							</div>
							<div class="col-lg-4 form-group">
								<label class="control-label col-lg-12 mt-5">Retype Password</label>
								<div class="col-lg-12 mt-3">
									<asp:TextBox ID="txtRetypePassword" runat="server" MaxLength="100" CssClass="form-control" TextMode="Password" RenderMode="Lightweight" ></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
										ControlToValidate="txtRetypePassword" ErrorMessage="*" ForeColor="Red"
										SetFocusOnError="True"></asp:RequiredFieldValidator>
									<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
										ControlToValidate="txtRetypePassword" Display="Dynamic" ErrorMessage="Password don't match."
										ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
								</div>
							</div>
						</div>
						<div class="col-lg-12 form-actions">
							<div class="col-lg-12 row">
								<div class="col-md-9 mt-5">
									<asp:LinkButton ID="btnSave" Width="100px" runat="server" OnClick="btnSave_Click" Text='Proceed' CssClass="btn btn-primary" />
									<asp:LinkButton ID="btnCancel" runat="server"
										OnClick="btnCancel_Click" Width="100px" Text="Cancel" CssClass="btn btn-secondary"
										CausesValidation="False" />

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="clearfix"></div>	
	

	<!-- Success Notification -->
  <div id="successNotification" class="custom-alert">
        Password updated successfully!
        <asp:LinkButton ID="LinkButton1" runat="server"
										OnClick="btnCancel_Click" Width="50px" Text="OK" CssClass="btn btn-sm fw-bold btn-secondary"
										CausesValidation="False" />

    </div>

    <!-- Failure Notification -->
    <div id="failureNotification" class="custom-alert" style="background-color: #FF6347;">
        Oops..! Something went wrong. Please refresh the page.
    </div>

    <style type="text/css">
        .modal-center {
            position: absolute;
            top: 50% !important;
            transform: translate(0, -50%) !important;
            -ms-transform: translate(0, -50%) !important;
            -webkit-transform: translate(0, -50%) !important;
            margin: auto 5%;
        }
    </style>
	

	<a href="javascript:;" class="page-quick-sidebar-toggler">
		<i class="icon-login"></i>
	</a>
		
</asp:Content>
