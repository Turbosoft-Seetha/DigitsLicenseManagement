using DigitsLicenseManagement.BO_Digits;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement
{
    public partial class SignIn : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //try
                //{
                //    if (Request.Params["mode"] == "exit" || Session["UserID"] == null)
                //    {
                //        Session["UserID"] = null;
                //    }
                //    else
                //    {
                //        if (Session["UserID"] != null)
                //        {
                //            string x = Session["UserID"].ToString();
                //            string URLRoot = ConfigurationManager.AppSettings.Get("WebURL") + Session["lang"] + "/ListTracker.aspx";
                //            Response.Redirect(URLRoot);
                //        }
                //    }

                //}
                //catch (Exception ex)
                //{

                //}

                Session["UserID"] = null;

                if (Request.Cookies["userid"] != null)
                {
                    txtUsername.Text = Request.Cookies["userid"].Value;
                }
                else
                {
                    txtUsername.Text = "";
                }

                if (Request.Cookies["pwd"] != null)
                {
                    txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
                }
                else
                {
                    txtPassword.Attributes.Add("value", "");
                }


                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                {
                    chkRemember.Checked = true;
                }
                else
                {
                    chkRemember.Checked = false;
                }
            }
        }

        protected void lnkSignIn_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(txtUsername.Text.ToString(), txtPassword.Text.ToString()))
            {

                string userId = Membership.GetUser(txtUsername.Text.ToString()).UserName;

                DataTable dt = ObjclsFrms.loadList("SelectUserByUserName", "sp_User", userId);

                if (dt.Rows.Count > 0)
                {
                    DataTable dtUserCus = ObjclsFrms.loadList("SelectCustomerByUserName", "sp_User", userId);
                    if (dtUserCus.Rows.Count == 0)
                    {


                        Session["UserID"] = dt.Rows[0]["ID"].ToString();
                        Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                        Session["Name"] = dt.Rows[0]["Name"].ToString();
                        if (Session["lang"] == null)
                        {
                            Session["lang"] = "en";
                        }
                        Session["dtLeftNav"] = null;
                        Session["dtLanguages"] = null;
                        DataTable dtUserStatus = ObjclsFrms.loadList("SelNewUserStatus", "sp_Masters", Session["UserID"].ToString());
                        if (dtUserStatus.Rows.Count == 0)
                        {
                            Response.Redirect("ActivateAccounts.aspx");
                        }
                        else
                        {

                            if (chkRemember.Checked)
                            {
                                Response.Cookies["userid"].Value = txtUsername.Text.ToString();
                                Response.Cookies["pwd"].Value = txtPassword.Text.ToString();
                                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                            }
                            else
                            {
                                Response.Cookies["userid"].Value = "";
                                Response.Cookies["pwd"].Value = "";
                                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                            }

                            LoginAudit(dt.Rows[0]["ID"].ToString(), dt.Rows[0]["UserName"].ToString(), "Success");
                            string URLRoot = ConfigurationManager.AppSettings.Get("WebURL") + Session["lang"] + "/ListTracker.aspx";
                            Response.Redirect(URLRoot);
                        }
                    }
                    else
                    {
                        LoginAudit("", txtUsername.Text.ToString(), "Failure");
                        ltrlError.Text = "<span style=\"color:red;\">You don't have to access to this portal</span>";
                    }
                }
            }
            else
            {
                LoginAudit("", txtUsername.Text.ToString(), "Failure");
                ltrlError.Text = "<span style=\"color:red;\">Invalid Username or Password</span>";
            }

           

        }

        public void LoginAudit(String LoginID, String UserName, String Status)
        {
            string Mode;
            string[] Paras;
            Paras = new string[2];
            Paras[0] = UserName;
            Paras[1] = Status;



            string Res = "0";
            Mode = "AuditLog";

            try
            {

                Res = ObjclsFrms.SaveData("sp_Report", Mode, LoginID, Paras);


            }
            catch (Exception ex)
            {

                //UICommon.LogException(ex, "Camera Physical");

            }
        }
    }
}