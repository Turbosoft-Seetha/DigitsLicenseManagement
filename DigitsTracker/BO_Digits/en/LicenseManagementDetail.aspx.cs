using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class LicenseManagementDetail : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
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
                HeaderData();
            }
        }
        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = obj.loadList("SelLicensesDetailHeaderByID", "sp_License", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblLicenseKey = (Label)rp.FindControl("lblLicenseKey");
                Label lblProject = (Label)rp.FindControl("lblProject");
                Label lblProjectCustomer = (Label)rp.FindControl("lblProjectCustomer");
                Label lblStartDate = (Label)rp.FindControl("lblStartDate");
                Label lblExpiryDate = (Label)rp.FindControl("lblExpiryDate");
                Label lblStatus = (Label)rp.FindControl("lblStatus");
                Label lblLicenseNumber = (Label)rp.FindControl("lblLicenseNumber");
                Label lblLicenseType = (Label)rp.FindControl("lblLicenseType");
                Label lblBufferPeriod = (Label)rp.FindControl("lblBufferPeriod");
                Label lblNeedExpiryNoti = (Label)rp.FindControl("lblNeedExpiryNoti");
                Label lblPriorExpNoti = (Label)rp.FindControl("lblPriorExpNoti");
                Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblContactPerson = (Label)rp.FindControl("lblContactPerson");
                Label lblContactNumber = (Label)rp.FindControl("lblContactNumber");
                Label lblCusEmail = (Label)rp.FindControl("lblCusEmail");
                Label lblModifiedDate = (Label)rp.FindControl("lblModifiedDate");

                lblLicenseKey.Text = lstDatas.Rows[0]["pke_LicenseKey"].ToString();
                lblProject.Text = lstDatas.Rows[0]["prj_Name"].ToString();
                lblProjectCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblStartDate.Text = lstDatas.Rows[0]["StartDate"].ToString();
                lblExpiryDate.Text = lstDatas.Rows[0]["ExpiryDate"].ToString();
                lblStatus.Text = lstDatas.Rows[0]["Status"].ToString();
                lblLicenseNumber.Text = lstDatas.Rows[0]["pke_LicenseNumber"].ToString();
                lblLicenseType.Text = lstDatas.Rows[0]["pke_LicenseType"].ToString();
                lblBufferPeriod.Text = lstDatas.Rows[0]["BufferPeriodInDays"].ToString();
                lblNeedExpiryNoti.Text = lstDatas.Rows[0]["NeedExpiryNotification"].ToString();
                lblPriorExpNoti.Text = lstDatas.Rows[0]["Prior_Exp_Notfctn_Intrvl_InDays"].ToString();
                lblCreatedDate.Text = lstDatas.Rows[0]["CreatedDate"].ToString();
                lblContactPerson.Text = lstDatas.Rows[0]["cus_ContactPerson"].ToString();
                lblContactNumber.Text = lstDatas.Rows[0]["cus_ContactNumber"].ToString();
                lblCusEmail.Text = lstDatas.Rows[0]["cus_Email"].ToString();
                lblModifiedDate.Text = lstDatas.Rows[0]["ModifiedDate"].ToString();
                
                string Status = lblStatus.Text = lstDatas.Rows[0]["Status"].ToString();

                if(Status == "Active")
                {
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    lblLicenseNumber.ForeColor = System.Drawing.Color.Green;
                }
                else if(Status == "Cancelled")
                {
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                    lblLicenseNumber.ForeColor = System.Drawing.Color.Red;
                }
                else if (Status == "Expired")
                {
                    lblStatus.ForeColor = System.Drawing.Color.DarkSalmon;
                    lblLicenseNumber.ForeColor = System.Drawing.Color.DarkSalmon;
                }
                else
                {
                    lblStatus.ForeColor = System.Drawing.Color.Black;
                    lblLicenseNumber.ForeColor = System.Drawing.Color.Black;
                }
            }
        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = obj.loadList("SelLicensesDetail", "sp_License", ResponseID.ToString());
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
        }
    }
}