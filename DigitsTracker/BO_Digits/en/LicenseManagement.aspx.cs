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
    public partial class LicenseManagement : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelLicenses", "sp_License");
            grvRpt.DataSource = lstUser;
        }
        protected void lnkFilter_Click(object sender, EventArgs e)
        {
            LoadList();
            grvRpt.Rebind();
        }

        protected void lnkReset_Click(object sender, EventArgs e)
        {

        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("ID").ToString();
                Response.Redirect("LicenseManagementDetail.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("ID").ToString();
                Response.Redirect("AddEditLicenseManagement.aspx?Id=" + ID);
            }
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditLicenseManagement.aspx?Id=0");
        }

        protected void grvRpt_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
               
                string Status = item["Status"].Text.ToString();
               
                if (Status == "Active")
                {
                    item["Status"].ForeColor = System.Drawing.Color.Green;
                    item["pke_LicenseNumber"].ForeColor = System.Drawing.Color.Green;
                }
                else if (Status == "Cancelled")
                {
                    item["Status"].ForeColor = System.Drawing.Color.Red;
                    item["pke_LicenseNumber"].ForeColor = System.Drawing.Color.Red;
                    
                }              
                else if (Status == "Expired")
                {
                    item["Status"].ForeColor = System.Drawing.Color.DarkSalmon;
                    item["pke_LicenseNumber"].ForeColor = System.Drawing.Color.DarkSalmon;
                }
                else
                {
                    item["Status"].ForeColor = System.Drawing.Color.Black;
                    item["pke_LicenseNumber"].ForeColor = System.Drawing.Color.Black;
                }

            }
        }
    }
}