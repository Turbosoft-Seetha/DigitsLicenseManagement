using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Ecosoft.DAL;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.Configuration;
using Telerik.Web.UI;
using System.Xml;
using System.IO;
using Org.BouncyCastle.Asn1.Ocsp;
using GoogleApi.Entities.Common.Enums;
using System.Security.Cryptography;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class AddEditUser : System.Web.UI.Page
    {


        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (string.IsNullOrEmpty(Request.Params["Id"]))
                    {
                        this.chkActive.Checked = true;
                    }
                   
                    //UserTypes();
                   
                   
                    Status();
                   // Levels();
                    this.FillForm();


                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Add Edit User");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditUser.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);



            }
        }



        private void FillForm()
        {
            if (string.IsNullOrEmpty(Request.Params["Id"]))
            {
                return;
            }


            UserProfile userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(Request.Params["Id"])).First();

            this.txtUsername.Text = userProfile.UserName;
            this.txtContactInfo.Text = userProfile.ContacInfo;
            this.txtFirstName.Text = userProfile.FirstName;
            this.txtLastName.Text = userProfile.LastName;
            this.txtEmail.Text = userProfile.Email;

            MembershipUser user = Membership.GetUser(this.txtUsername.Text);

            this.chkActive.Checked = user.IsApproved;
            this.txtUsername.Enabled = false;

            string ID = userProfile.ID.ToString();

            DataTable lstemp = ObjclsFrms.loadList("SelectEmployeeFromID", "sp_Masters", ID.ToString());
            if (lstemp.Rows.Count > 0)
            {
                string PLFNAME = lstemp.Rows[0]["plf_Name"].ToString();
                string Status = lstemp.Rows[0]["Sts_Name"].ToString();
                string level = lstemp.Rows[0]["lvl_ID"].ToString();
                string IsEmp= lstemp.Rows[0]["IsEmployee"].ToString();
                ddlLevel.SelectedValue = level;
                string[] ar = PLFNAME.Split('-');
                string[] arry = Status.Split('-');


              
                for (int i = 0; i < arry.Length; i++)
                {
                    foreach (RadComboBoxItem items in ddlStatus.Items)
                    {
                        if (items.Value == arry[i])
                        {
                            items.Checked = true;
                        }
                    }
                }

            }

            DataTable lstCode = ObjclsFrms.loadList("SelectEmployeeCodeForUser", "sp_Masters", ID.ToString());
            if (lstCode.Rows.Count > 0)
            {
                string code = lstCode.Rows[0]["EmployeeCode"].ToString();
            }

        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                UserProfile userProfile = new UserProfile();
                MembershipUser user;
                //string password = Membership.GeneratePassword(8, 1);
                string password = ConfigurationManager.AppSettings.Get("DeffPass").ToString();
                //string password = "User@123";
                if (!string.IsNullOrEmpty(Request.Params["Id"]))
                {
                    userProfile = DALHelper.GetUsers(userCriteria => userCriteria.UserId == new Guid(Request.Params["id"])).First();
                    user = Membership.GetUser(this.txtUsername.Text);
                }
                else
                {
                    if (Membership.GetUser(this.txtUsername.Text) != null)
                    {
                        //this.ltrlMessage.Text = UICommon.GetErrorMessage("User already exists");
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>fail();</script>", false);

                        //System.Windows.Forms.MessageBox.Show("User already exists", "Add Edit User");
                        return;
                    }

                    //string password = "user@123";
                    user = Membership.CreateUser(this.txtUsername.Text, password);

                    userProfile.CreatedDate = DateTime.Now;
                    userProfile.CreatedBy = UICommon.GetCurrentUserID();
                }

                user.IsApproved = this.chkActive.Checked;
                Membership.UpdateUser(user);
                userProfile.ModifiedDate = DateTime.Now;
                userProfile.ModifiedBy = UICommon.GetCurrentUserID();
                userProfile.UserId = new Guid(user.ProviderUserKey.ToString());
                userProfile.FirstName = this.txtFirstName.Text;
                userProfile.LastName = this.txtLastName.Text;
                userProfile.Email = this.txtEmail.Text;
                userProfile.ContacInfo = this.txtContactInfo.Text;
                userProfile.CreatedDate = DateTime.Now;
                userProfile.Active = this.chkActive.Checked;
                userProfile.UserName = user.UserName;
                //int USTID = Int32.Parse(this.ddlUserType.SelectedValue.ToString());
              //  userProfile.ust_ID = USTID;
                // userProfile.UserType = ViewState["UserType"].ToString();
                int Id = DALHelper.UpdateUserProfile(userProfile);
                ViewState["userID"] = Id.ToString();

                int CreatedBY = UICommon.GetCurrentUserID();
                string Status = GetStatusFromDrop();
                string IsEmp = ddlIsEmp.SelectedValue.ToString();
                string[] arr = {  Status.ToString(), CreatedBY.ToString(),ddlLevel.SelectedValue.ToString() ,IsEmp.ToString()};
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertEmployee", Id.ToString(), arr);
                int res = Int32.Parse(Value.ToString());



                string[] arry = {  Status.ToString(), CreatedBY.ToString(), ddlLevel.SelectedValue.ToString(), IsEmp.ToString() };
                string Values = ObjclsFrms.SaveData("sp_Masters", "UpdateEmployee", Id.ToString(), arry);
                int resp = Int32.Parse(Values.ToString());



            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Add Edit User");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditUser.aspx btnSave_Click()", "Error : " + ex.Message.ToString() + " - " + innerMessage);


            }
            Response.Redirect("Users.aspx");
        }



        // Example method to create a node for RadComboBox items in XML
        private void createNode(string value,  XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("Platfrm_ID");
            writer.WriteString(value);
            writer.WriteEndElement();

           




            writer.WriteEndElement();
        }


        public string GetStatusFromDrop()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;



                    // Retrieve selected items from RadComboBox
                    foreach (RadComboBoxItem item in ddlStatus.Items)
                    {
                        if (item.Checked)
                        {
                            createNodeStatus(item.Value,  writer);
                            c++; // Incrementing counter for selected RadComboBox items
                        }
                    }

                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();

                    if (c == 0)
                    {
                        return "";
                    }
                    else
                    {
                        return sw.ToString();
                    }
                }
            }
        }

        // Example method to create a node for RadComboBox items in XML
        private void createNodeStatus(string value, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("Status_ID");
            writer.WriteString(value);
            writer.WriteEndElement();

         




            writer.WriteEndElement();
        }




        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        public void UserTypes()
        {
            DataTable dt = ObjclsFrms.loadList("SelectUserTypeFromDrop", "sp_Masters");
            ddlUserType.DataSource = dt;
            ddlUserType.DataTextField = "ust_Name";
            ddlUserType.DataValueField = "ust_ID";
            ddlUserType.DataBind();
        }

       
        public void Levels()
        {
            DataTable dt = ObjclsFrms.loadList("SelectLevels", "sp_Masters");
            ddlLevel.DataSource = dt;
            ddlLevel.DataTextField = "lvl_Desc";
            ddlLevel.DataValueField = "lvl_ID";
            ddlLevel.DataBind();

        }
        public void Status()
        {
            DataTable dt = ObjclsFrms.loadList("SelectStatus", "sp_Masters");
            ddlStatus.DataSource = dt;
            ddlStatus.DataTextField = "sts_Name";
            ddlStatus.DataValueField = "sts_ID";
            ddlStatus.DataBind();

        }
    }
}