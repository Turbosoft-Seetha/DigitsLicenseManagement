using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class AddEditProjects : System.Web.UI.Page
    {
        GeneralFunctions Obj = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillForm();
            }

        }
        public void FillForm()
        {
            DataTable lstDatas = Obj.loadList("SelProjectsByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string prjname, licenseType, contactnumber, contactperson, email, status;
                prjname = lstDatas.Rows[0]["prj_Name"].ToString();
                licenseType = lstDatas.Rows[0]["prj_LicenseType"].ToString();
                email = lstDatas.Rows[0]["prj_Email"].ToString();
                contactnumber = lstDatas.Rows[0]["prj_ContactNumber"].ToString();
                contactperson = lstDatas.Rows[0]["prj_ContactPerson"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();

                txtName.Text = prjname.ToString();
                txttype.Text = licenseType.ToString();
                txtNum.Text = contactnumber.ToString();
                txtEmail.Text = email.ToString();
                ddlStatus.SelectedValue = status.ToString();
                txtContactPerson.Text = contactperson.ToString();

            }
        }
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["Id"], out ResponseID);

                return ResponseID;
            }
        }

        protected void Save()

        {
            string prjname, licenseType, contactnumber, contactperson, email, status;

            prjname = txtName.Text.ToString();
            licenseType = txttype.Text.ToString();
            contactperson = txtContactPerson.Text.ToString();
            email = txtEmail.Text.ToString();
            contactnumber = txtNum.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            string user = UICommon.GetCurrentUserID().ToString();

            if (ResponseID == 0)
            {
                try
                {
                    ViewState["Value"] = "";
                    string[] arr = { licenseType, contactnumber, contactperson, email, status, user };

                    string Value = Obj.SaveData("sp_Masters", "InsertProjects", prjname, arr);
                    ViewState["Value"] = Value.ToString();

                    int res = Int32.Parse(Value.ToString());
                    Session["prjID"] = res;
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project Inserted Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditProjects.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage + "Value:" + ViewState["Value"].ToString());

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('" + ViewState["Value"].ToString() + "');</script>", false);
                }

            }
            else
            {
                try
                {
                    string id = ResponseID.ToString();
                    string[] arr = { licenseType, contactnumber, contactperson, email, status, user, id };
                    string Value = Obj.SaveData("sp_Masters", "UpdateProjects", prjname, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditProjects.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }

            }
        }
        protected void LinkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void LinkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProjects.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProjects.aspx");
        }

    }
}