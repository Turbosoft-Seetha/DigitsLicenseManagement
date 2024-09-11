using DigitsLicenseManagement;
using DigitsLicenseManagement.BO_Digits;
using ExcelLibrary.BinaryFileFormat;
using GoogleApi.Entities.Common.Enums;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace DigitsTracker.BO_Digits.en
{
    public partial class ListProjectCustomers : System.Web.UI.Page
    {
        GeneralFunctions Obj = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["Id"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Customers();
                HeaderData();
            }
        }
        public void Customers()
        {
            try
            {
                string Project = ResponseID.ToString();
                ddlCustomer.DataSource = Obj.loadList("SelCustomerforDropdown", "sp_Masters",Project);
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

        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = Obj.loadList("SelProjectDetailHeaderByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblProjectCode = (Label)rp.FindControl("lblProjectCode");
                Label lblProjectName = (Label)rp.FindControl("lblProjectName");
                Label lblProjectEmail = (Label)rp.FindControl("lblProjectEmail");
                Label lblContactPerson = (Label)rp.FindControl("lblContactPerson");
                Label lblContactNum = (Label)rp.FindControl("lblContactNum");
                Label lblStatus = (Label)rp.FindControl("lblStatus");
                Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblModifiedDate = (Label)rp.FindControl("lblModifiedDate");

                lblProjectCode.Text = lstDatas.Rows[0]["prj_Code"].ToString();
                lblProjectName.Text = lstDatas.Rows[0]["prj_Name"].ToString();
                lblProjectEmail.Text = lstDatas.Rows[0]["prj_Email"].ToString();
                lblContactPerson.Text = lstDatas.Rows[0]["prj_ContactPerson"].ToString();
                lblStatus.Text = lstDatas.Rows[0]["Status"].ToString();
                lblContactNum.Text = lstDatas.Rows[0]["prj_ContactNumber"].ToString();
                lblCreatedDate.Text = lstDatas.Rows[0]["CreatedDate"].ToString();
                lblModifiedDate.Text = lstDatas.Rows[0]["ModifiedDate"].ToString();

            }
        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = Obj.loadList("ListProjectCustomers", "sp_Masters", ResponseID.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("cpt_ID").ToString();
                ViewState["cpt_ID"] = ID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
                grvRpt.Rebind();
            }          
        }
        public void Delete(string ID)
        {
            DataTable lstUsr = default(DataTable);
            lstUsr = Obj.loadList("DeleteProjectCustomers", "sp_Masters", ID);

            string Res = lstUsr.Rows[0]["Res"].ToString();

            if (Res == "1")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project Customer deleted Successfully');</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }
        }

        protected void lnkDel_Click(object sender, EventArgs e)
        {
            string ID = ViewState["cpt_ID"].ToString();
            Delete(ID);
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListProjectCustomers.aspx?Id=" + ResponseID);
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
            string Customer = GetItemFromGrid();
            string Project = ResponseID.ToString();
            string user = UICommon.GetCurrentUserID().ToString();

            try
            {
                string[] arr = { Customer, user };
                string Value = Obj.SaveData("sp_Masters", "InsProjectCustomer", Project, arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project Customer Inserted Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddProjectCustomers.aspx Save()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }
        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>SaveConfim();</script>", false);
        }

        protected void lnkSaveCus_Click(object sender, EventArgs e)
        {
            Save();
        }
    }
}