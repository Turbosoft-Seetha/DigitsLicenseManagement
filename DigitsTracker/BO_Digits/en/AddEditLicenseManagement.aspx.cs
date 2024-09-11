using System;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Xml;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class AddEditLicenseManagement : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Project();
                ProjectCustomers();
                Platforms();
                LicenseType();

                rdfromDate.SelectedDate = DateTime.Now;
                rdendDate.SelectedDate = DateTime.Now.AddDays(30);

                FillplmForm();
            }
        }
        public void Project()
        {
            try
            {
                ddlProject.DataSource = ObjclsFrms.loadList("SelProjectsforDropdown", "sp_License");
                ddlProject.DataTextField = "prj_Name";
                ddlProject.DataValueField = "prj_ID";
                ddlProject.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        public void ProjectCustomers()
        {
            try
            {
                ddlProjectCus.DataSource = ObjclsFrms.loadList("SelCustomersforDropdown", "sp_License");
                ddlProjectCus.DataTextField = "cus_Name";
                ddlProjectCus.DataValueField = "cus_ID";
                ddlProjectCus.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        public void Platforms()
        {
            try
            {
                string plmID = "";
                string PlatformData = PlatformIDs();
                if (PlatformData == "PlmID")
                {
                    plmID = "";
                }
                else
                {
                    plmID = " where plm_ID not in (" + PlatformData + ")";
                }
               
                ddlPlatform.DataSource = ObjclsFrms.loadList("SelPlatformforDropdown", "sp_License" , plmID);
                ddlPlatform.DataTextField = "plm_Name";
                ddlPlatform.DataValueField = "plm_ID";
                ddlPlatform.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        public void LicenseType()
        {
            try
            {
                ddlType.DataSource = ObjclsFrms.loadList("SelLicenseTypeforDropdown", "sp_License");
                ddlType.DataTextField = "typ_Name";
                ddlType.DataValueField = "typ_ID";
                ddlType.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        public string PlatformIDs()
        {
            var ColelctionMarkets = RadGrid2.Items;
            int MarCount = ColelctionMarkets.Count;
            string PID = "";
            int j = 0;

            if (ColelctionMarkets.Count > 0)
            {
                foreach (GridDataItem dr in ColelctionMarkets)
                {

                    string ID = dr["PlmID"].Text.ToString();
                    if (j == 0)
                    {
                        PID += ID.ToString() + ",";
                    }
                    else if (j > 0)
                    {
                        PID += ID.ToString() + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        PID += ID.ToString();
                    }
                    j++;
                }
                return PID;
            }
            else
            {
                return "PlmID";
            }


        }
        protected void lnkAddPlatfom_Click(object sender, EventArgs e)
        {
            addTable();
            Platforms();
        }
        public void addTable()
        {
            try
            {
                string PlmID , Platform, NoOfUsers;
                PlmID = ddlPlatform.SelectedValue.ToString();
                Platform = ddlPlatform.SelectedItem.Text.ToString();           
                NoOfUsers = txtNoOfUsers.Text.ToString();

                DataTable dts = default(DataTable);

                if (ViewState["DataTable"] == null)
                {
                    dts = new DataTable();
                    dts.Columns.Add("PlmID");
                    dts.Columns.Add("Platform");
                    dts.Columns.Add("NoOfUsers");
                }
                else
                {
                    dts = (DataTable)ViewState["DataTable"];
                }
                if (dts.Rows.Count > 0)
                {
                    PlmID = PlmID.ToString();
                    Platform = Platform.ToString();
                    NoOfUsers = NoOfUsers.ToString();

                    dts.Rows.Add(PlmID,Platform, NoOfUsers);
                }
                else
                {
                    PlmID = PlmID.ToString();
                    Platform = Platform.ToString();
                    NoOfUsers = NoOfUsers.ToString();

                    dts.Rows.Add(PlmID,Platform, NoOfUsers);
                }


                ViewState["DataTable"] = dts;
                DataTable dt = (DataTable)ViewState["DataTable"];
                RadGrid2.DataSource = dt;
                RadGrid2.DataBind();

                ddlPlatform.ClearSelection();
                txtNoOfUsers.Text = "";
                

            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }

        public void List()
        {
            try
            {
                DataTable dt = (DataTable)ViewState["DataTable"];
                RadGrid2.DataSource = dt;
                RadGrid2.DataBind();
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            List();
        }

        protected void RadGrid2_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string Platform = dataItem["Platform"].Text.ToString();
                DataTable dts = (DataTable)ViewState["DataTable"];

                // Find the DataRow based on the "MinValue" column
                DataRow drs = null;
                foreach (DataRow row in dts.Rows)
                {
                    if (row["Platform"].ToString() == Platform)
                    {
                        drs = row;
                        break;
                    }
                }

                if (drs != null)
                {
                    // Delete the DataRow
                    drs.Delete();
                    dts.AcceptChanges();
                    ViewState["DTable"] = dts;
                    ViewState["DataTable"] = dts;

                    DataTable dt = (DataTable)ViewState["DTable"];
                    RadGrid2.DataSource = dt;
                    RadGrid2.DataBind();

                    Platforms();
                }

            }
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LicenseManagement.aspx");
        }

        protected void lnkProceed_Click(object sender, EventArgs e)
        {
            String PlatformData = GetItemFromGrid();

            if(PlatformData == null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            }
            
        }
        public string GetItemFromGrid()
        {
            using (var sw = new StringWriter())
            {
                int c = 0;
                using (var writer = XmlWriter.Create(sw))
                {

                    writer.WriteStartDocument(true);
                    writer.WriteStartElement("q");

                    DataTable dsc = new DataTable();
                    foreach (GridDataItem dr in RadGrid2.Items)
                    {

                        string Platform = dr["PlmID"].Text.ToString();
                        string NoOfUsers = dr["NoOfUsers"].Text.ToString();
                        createNode4(Platform, NoOfUsers, writer);
                        c++;
                    }
                    writer.WriteEndElement();
                    writer.WriteEndDocument();
                    writer.Close();

                }
                if (c == 0)
                {

                    return null;
                }
                else
                {
                    string ss = sw.ToString();
                    return sw.ToString();
                }
            }
        }
        private void createNode4(string Platform,string NoOfUsers, XmlWriter writer)
        {
            writer.WriteStartElement("Values");

            writer.WriteStartElement("Platform");
            writer.WriteString(Platform);
            writer.WriteEndElement();

             writer.WriteStartElement("NoOfUsers");
            writer.WriteString(NoOfUsers);
            writer.WriteEndElement();

            writer.WriteEndElement();
        }

        public void GenerateLicenseKey()
        {
            try
            {
                string Project = ddlProjectCus.SelectedItem.Text.ToString() + DateTime.Now;
                string licenseKey;
                byte[] projectBytes = Encoding.UTF8.GetBytes(Project);

                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] hashBytes = sha256.ComputeHash(projectBytes);

                     licenseKey = System.Convert.ToBase64String(hashBytes);

                    ViewState["LicenseKey"] = licenseKey;
                }

                DataTable dts = ObjclsFrms.loadList("SelectLicenseKey", "sp_License", licenseKey);
                string Count = dts.Rows[0]["LicenseCount"].ToString();

                if (Count != "0")
                {
                    GenerateLicenseKey();
                }
                else
                {
                    ViewState["LicenseKey"] = licenseKey;
                }

            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "AddEditLicenseManagement.aspx", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }

        }
        protected void Save()
        {
            string Project, LicenseKey,ProjectCus, StartDate,ExpiryDate,BufferPeriod, Notification , PriorNotification , Status, User , PlatformData , Type ;

            GenerateLicenseKey();
            LicenseKey = ViewState["LicenseKey"].ToString();           
            Project = ddlProject.SelectedValue.ToString();
            ProjectCus = ddlProjectCus.SelectedValue.ToString();
            StartDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd"); 
            ExpiryDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd"); 
            BufferPeriod = txtBufferPeriod.Text.ToString();
            Notification = ddlNotification.SelectedValue.ToString();
            PriorNotification = txtPriorNoti.Text.ToString();
            Status = ddlStatus.SelectedValue.ToString();
            User = UICommon.GetCurrentUserID().ToString();
            Type = ddlType.SelectedValue.ToString();

            PlatformData = GetItemFromGrid();
           
            if (ResponseID.Equals("") || ResponseID == 0)
            {

                string[] arr = { LicenseKey,ProjectCus, StartDate, ExpiryDate, BufferPeriod, Notification, Status, User , PlatformData , PriorNotification , Type };
                DataTable dt = ObjclsFrms.loadList("InsProjectLicense", "sp_License", Project, arr);
                string res = dt.Rows[0]["Res"].ToString();
                
                if (res == "1")
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project License Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
            else
            {
                string ID = ResponseID.ToString();
                string[] arr = { Project , ProjectCus, StartDate, ExpiryDate, BufferPeriod, Notification, Status, User , PlatformData , PriorNotification , Type };
                DataTable dt = ObjclsFrms.loadList("UpdateProjectLicense", "sp_License", ID, arr);
                string res = dt.Rows[0]["Res"].ToString();
                if (res == "1")

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Project License Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }


        }
        public void FillplmForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelectProjectLicenseByID", "sp_License", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string Project, ProjectCus, LicenseType , StartDate, ExpiryDate, BufferPeriod, Notification, NotificationIntervel, Status;
                Project = lstDatas.Rows[0]["pke_prj_ID"].ToString();
                ProjectCus = lstDatas.Rows[0]["pke_cus_ID"].ToString();
                LicenseType = lstDatas.Rows[0]["pke_LicenseType"].ToString ();
                StartDate = lstDatas.Rows[0]["StartDate"].ToString();
                ExpiryDate = lstDatas.Rows[0]["ExpiryDate"].ToString();
                BufferPeriod = lstDatas.Rows[0]["BufferPeriodInDays"].ToString();
                Notification = lstDatas.Rows[0]["NeedExpiryNotification"].ToString();
                NotificationIntervel = lstDatas.Rows[0]["Prior_Exp_Notfctn_Intrvl_InDays"].ToString();
                Status = lstDatas.Rows[0]["Status"].ToString();

                ddlProject.SelectedValue = Project.ToString();
                ddlProjectCus.SelectedValue = ProjectCus.ToString();
                ddlType.SelectedValue = LicenseType.ToString();
                rdfromDate.SelectedDate = DateTime.Parse(StartDate.ToString());
                rdendDate.SelectedDate = DateTime.Parse(ExpiryDate.ToString()); 
                txtBufferPeriod.Text = BufferPeriod.ToString();
                ddlNotification.SelectedValue = Notification.ToString();
                txtPriorNoti.Text = NotificationIntervel.ToString();
                ddlStatus.SelectedValue = Status.ToString();

                DataTable dt = ObjclsFrms.loadList("SelectProjectDetailsByID", "sp_License", ResponseID.ToString());
                RadGrid2.DataSource = dt;
                ViewState["DataTable"] = dt;
                RadGrid2.Rebind();
                Platforms();
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();       
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("LicenseManagement.aspx");
        }
    }
}