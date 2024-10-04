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
    public partial class AddEditLicenseTypes : System.Web.UI.Page
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
            DataTable lstDatas = Obj.loadList("SelLicenseTypeByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, code;
                name = lstDatas.Rows[0]["typ_Name"].ToString();
                code = lstDatas.Rows[0]["typ_Value"].ToString();

                txtName.Text = name.ToString();
                txtCode.Text = code.ToString();
                txtCode.Enabled = false;

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
            string name, code;

            name = txtName.Text.ToString();
            code = txtCode.Text.ToString();
            string user = UICommon.GetCurrentUserID().ToString();

            if (ResponseID == 0)
            {
                try
                {
                    string[] arr = { code };
                    DataTable dt = Obj.loadList("InsertLicenseTypes", "sp_Masters", name, arr);
                    string res = dt.Rows[0]["transID"].ToString();

                    if (res == "1")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('License Type Inserted Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseTypes.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage + "Value:" + ViewState["Value"].ToString());

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('" + ViewState["Value"].ToString() + "');</script>", false);
                }

            }
            else
            {
                try
                {
                    string id = ResponseID.ToString();
                    string[] arr = { code, id };
                    DataTable dt = Obj.loadList("UpdateLicenseTypes", "sp_Masters", name, arr);
                    string res = dt.Rows[0]["transID"].ToString();

                    if (res == "1")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('License Type Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseTypes.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

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
            Response.Redirect("ListLicenseTypes.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListLicenseTypes.aspx");
        }
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = Obj.loadList("CheckLicenseTypeCode", "sp_Masters", code);
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