using Ecosoft.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        string Mode = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    this.FillForm();
                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Update Password");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "UpdatePassword.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

            }
        }


        private void FillForm()
        {
            if (string.IsNullOrEmpty(UICommon.GetCurrentUserID().ToString()))
            {
                return;
            }


            string ID = UICommon.GetCurrentUserID().ToString();
            DataTable dt = default(DataTable);


            Mode = "SelectUserByID";
            dt = ObjclsFrms.loadList(Mode, "sp_User", ID);



            UserProfile userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(dt.Rows[0]["UserId"].ToString())).First();

            this.txtEmail.Text = userProfile.UserName;
            this.txtContactInfo.Text = userProfile.ContacInfo;
            this.txtFirstName.Text = userProfile.FirstName;
            this.txtLastName.Text = userProfile.LastName;

            MembershipUser user = Membership.GetUser(this.txtEmail.Text);

            //this.chkActive.Checked = user.IsApproved;

            this.txtEmail.Enabled = false;
            this.txtContactInfo.Enabled = false;
            this.txtFirstName.Enabled = false;
            this.txtLastName.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(UICommon.GetCurrentUserID().ToString()))
                {
                    return;
                }

                MembershipUser user;
                user = Membership.GetUser(this.txtEmail.Text);

                Boolean isSuccess = user.ChangePassword(txtOldPassword.Text, txtNewPassword.Text);
                if (isSuccess)
                {
                    String ID = UICommon.GetCurrentUserID().ToString();
                    DataTable dt = default(DataTable);
                    Mode = "SelectUserByID";
                    dt = ObjclsFrms.loadList(Mode, "sp_User", ID);
                    UserProfile userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(dt.Rows[0]["UserId"].ToString())).First();
                    userProfile.AccessCode = txtNewPassword.Text.ToString();
                    DALHelper.UpdateUserProfile(userProfile);

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showSuccess", "showSuccessNotification();", true);
                    //Response.Redirect("ListTracker.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showFailure", "showFailureNotification();", true);
                }

            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Add Edit User");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "UpdatePassword.aspx btnSave_Click()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListTracker.aspx");
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListTracker.aspx");
        }
    }
}