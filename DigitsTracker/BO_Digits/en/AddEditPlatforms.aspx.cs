using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class AddEditPlatforms : System.Web.UI.Page
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
            DataTable lstDatas = Obj.loadList("SelPlatformByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, code,status;
                name = lstDatas.Rows[0]["PLM_Name"].ToString();
                code = lstDatas.Rows[0]["PLM_Code"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();

                txtName.Text = name.ToString();
                txtCode.Text = code.ToString();
                txtCode.Enabled = false;
                ddlStatus.SelectedValue = status.ToString();

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
            string name, code, status;

            name = txtName.Text.ToString();
            code = txtCode.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            string user = UICommon.GetCurrentUserID().ToString();

            if (ResponseID == 0)
            {
                try
                {
                    ViewState["Value"] = "";
                    string[] arr = { code,status, user };

                    string Value = Obj.SaveData("sp_Masters", "InsertPlatform", name, arr);
                    ViewState["Value"] = Value.ToString();

                    int res = Int32.Parse(Value.ToString());
                    Session["CusID"] = res;
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Platform Inserted Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditPlatforms.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage + "Value:" + ViewState["Value"].ToString());

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('" + ViewState["Value"].ToString() + "');</script>", false);
                }

            }
            else
            {
                try
                {
                    string id = ResponseID.ToString();
                    string[] arr = { code,status, user, id };
                    string Value = Obj.SaveData("sp_Masters", "UpdatePlatform", name, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Platform Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditPlatforms.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

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
            Response.Redirect("ListPlatforms.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListPlatforms.aspx");
        }
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = Obj.loadList("CheckPlatformCode", "sp_Masters", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                LinkSave.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                LinkSave.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }
    }
}