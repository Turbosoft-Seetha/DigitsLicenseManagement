using DigitsLicenseManagement.BO_Digits;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lnkReset_Click(object sender, EventArgs e)
        {
            Reset();

        }
        public void Reset()
        {
            string mail = this.txtUsername.Text.ToString();
            pnlsubmit.Visible = true;

            string password = Membership.GeneratePassword(8, 1);
            MembershipUser user;
            user = Membership.GetUser(this.txtUsername.Text);
            if (user != null)
            {
                string[] arr = { };
                //CheckForgetPasswordReq
                DataTable lstUserName = ObjclsFrms.loadList("CheckForgetPasswordReq", "sp_User", user.ToString());
                if (lstUserName.Rows.Count > 0)
                {
                    pnlsubmit.Visible = false;
                    this.ltrlMessage.Text = UICommon.GetErrorMessage("Your Request already registered, Will be sharing the new password by Support Team");
                    pnlOK.Visible = true;
              
                }
                else
                {
                    string svd = ObjclsFrms.SaveData("sp_User", "InsForgetPasswordReq", user.ToString(), arr);
                    int res = svd != null ? Int32.Parse(svd.ToString()) : 0;
                    if (res > 0)
                    {
                        pnlsubmit.Visible = false;
                        this.ltrlMessage.Text = UICommon.GetErrorMessage("Request  generated successfully, Will be sharing the new password by Support Team");
                        pnlOK.Visible= true;

                    }
                    else
                    {
                        pnlsubmit.Visible = false;
                        this.ltrlMessage.Text = UICommon.GetErrorMessage("We are facing some technical issues, please try again later");
                        pnlOK.Visible = true;
                    }
                }
                
            }
            else
            {
                this.ltrlMessage.Text = UICommon.GetErrorMessage("User along with this account not Found");
            }
        }

      

        protected void lnkOk_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}