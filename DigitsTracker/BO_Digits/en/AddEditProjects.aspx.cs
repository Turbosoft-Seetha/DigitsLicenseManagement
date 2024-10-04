using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;
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
                Customers();
                FillForm();
            }

        }
        public void Customers()
        {
            try
            {
                ddlCustomer.DataSource = Obj.loadList("SelCusProjectforDropdown", "sp_Masters");
                ddlCustomer.DataTextField = "cus_Name";
                ddlCustomer.DataValueField = "cus_ID";
                ddlCustomer.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                Obj.LogMessageToFile(UICommon.GetLogFileName(), "ListProjectCustomers.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        public void LicenseType()
        {
            try
            {              
                ddlType.DataSource = Obj.loadList("SelLicenseTypeforDropdown", "sp_Masters");
                ddlType.DataTextField = "typ_Name";
                ddlType.DataValueField = "typ_ID";
                ddlType.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditProjects.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }

        public void FillForm()
        {
            DataTable lstDatas = Obj.loadList("SelProjectsByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string prjname, prjCode, licenseType, contactnumber, contactperson, email, status , customer;
                prjname = lstDatas.Rows[0]["prj_Name"].ToString();
                prjCode = lstDatas.Rows[0]["prj_Code"].ToString();
                licenseType = lstDatas.Rows[0]["prj_LicenseType"].ToString();
                email = lstDatas.Rows[0]["prj_Email"].ToString();
                contactnumber = lstDatas.Rows[0]["prj_ContactNumber"].ToString();
                contactperson = lstDatas.Rows[0]["prj_ContactPerson"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
                customer = lstDatas.Rows[0]["customer"].ToString();
                string[] ar = customer.Split('-');

                txtName.Text = prjname.ToString();
                txtCode.Text = prjCode.ToString();
                txtCode.Enabled = false;
                ddlType.SelectedValue = licenseType.ToString();
                txtNum.Text = contactnumber.ToString();
                txtEmail.Text = email.ToString();
                ddlStatus.SelectedValue = status.ToString();
                txtContactPerson.Text = contactperson.ToString();


                for (int i = 0; i < ar.Length; i++)
                {
                    foreach (RadComboBoxItem items in ddlCustomer.Items)
                    {
                        if (items.Value == ar[i])
                        {
                            items.Checked = true;
                        }
                    }
                }
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
        public string GetItemFromGrid()
        {
            using (var sw = new StringWriter())
            {
                using (var writer = XmlWriter.Create(sw))
                {
                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("r");
                    int c = 0;

                    var ColelctionMarkets = ddlCustomer.CheckedItems;
                    int MarCount = ColelctionMarkets.Count;
                    if (ColelctionMarkets.Count > 0)
                    {
                        foreach (var item in ColelctionMarkets)
                        {
                            RadComboBoxItem Item = (RadComboBoxItem)item;
                            string cus_ID = Item.Value;
                            createNode(cus_ID, writer);
                            c++;
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
                        string ss = sw.ToString();
                        return sw.ToString();
                    }
                }
            }
        }
        private void createNode(string cus_ID, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("cus_ID");
            writer.WriteString(cus_ID);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }
        protected void Save()
        {
            string prjname,prjCode, licenseType, contactnumber, contactperson, email, status;

            string Customer = GetItemFromGrid();
            prjname = txtName.Text.ToString();
            prjCode = txtCode.Text.ToString();
            licenseType = ddlType.SelectedValue.ToString();
            contactperson = txtContactPerson.Text.ToString();
            email = txtEmail.Text.ToString();
            contactnumber = txtNum.Text.ToString();
            status = ddlStatus.SelectedValue.ToString();
            string user = UICommon.GetCurrentUserID().ToString();

            if (ResponseID == 0)
            {
                try
                {
                    string[] arr = { prjCode, contactnumber, contactperson, email, status, user , Customer };

                    DataTable dt = Obj.loadList("InsertProjects", "sp_Masters", prjname, arr);

                    string res = dt.Rows[0]["transID"].ToString();

                    if (res == "1")
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
                    string[] arr = { prjCode, contactnumber, contactperson, email, status, user, id , Customer };

                    DataTable dt = Obj.loadList("UpdateProjects", "sp_Masters", prjname, arr);

                    string res = dt.Rows[0]["transID"].ToString();

                    if (res == "1")
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

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = Obj.loadList("CheckProjectsCode", "sp_Masters", code);
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