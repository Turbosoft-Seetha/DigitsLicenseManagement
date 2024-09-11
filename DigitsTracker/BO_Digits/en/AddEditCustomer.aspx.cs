using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class AddEditCustomer : System.Web.UI.Page
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
            DataTable lstDatas = Obj.loadList("SelCustomerByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, code, contactnumber, contactperson,email,  status;
                name = lstDatas.Rows[0]["cus_Name"].ToString();
                code = lstDatas.Rows[0]["cus_Code"].ToString();
                email = lstDatas.Rows[0]["cus_Email"].ToString();
                contactnumber = lstDatas.Rows[0]["cus_ContactNumber"].ToString();
                contactperson = lstDatas.Rows[0]["cus_ContactPerson"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();

                txtName.Text = name.ToString();
                txtCode.Text = code.ToString();
                txtCode.Enabled = false;
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
            string name, code, contactnumber, contactperson, email, status;

            name = txtName.Text.ToString();
            code = txtCode.Text.ToString();
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
                    string[] arr = { code, contactnumber, contactperson, email, status ,user };

                    string Value = Obj.SaveData("sp_Masters", "InsertCustomer", name, arr);
                    ViewState["Value"] = Value.ToString();

                    int res = Int32.Parse(Value.ToString());
                    Session["CusID"] = res;
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
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditCustomer.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage + "Value:" + ViewState["Value"].ToString());

                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('" + ViewState["Value"].ToString() + "');</script>", false);
                }

            }
            else
            {
                try
                {
                    string id = ResponseID.ToString();
                    string[] arr = { code, contactnumber, contactperson, email, status, user ,id};
                    string Value = Obj.SaveData("sp_Masters", "UpdateCustomer", name, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditCustomer.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

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
            Response.Redirect("ListCustomer.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomer.aspx");
        }
        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = Obj.loadList("CheckCustomerCode", "sp_Masters", code);
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