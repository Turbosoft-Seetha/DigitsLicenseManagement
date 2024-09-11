using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Ecosoft.DAL;
using System.Data;
using Telerik.Web.UI;

namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class UserRoles : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }
        
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        public void Save()
        {
            string userId = Request.Params["Id"].ToString();
            DataTable delData = ObjclsFrms.loadList("DeleteUserRole", "sp_User", userId.ToString());

            int count = grvRpt.SelectedItems.Count;
            int i = 0;
            foreach (GridDataItem item in grvRpt.SelectedItems)
            {
                try
                {

                    string roleId = item.GetDataKeyValue("RoleId").ToString();
                    i++;
                    string[] arr = new string[] { roleId.ToString() };
                    string response = ObjclsFrms.SaveData("sp_User", "InsertIntoUsersInRoles", userId.ToString(), arr);
                    
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>ErrorModal( 'User role process is having some technical issues, please try again');</script>", false);
                }

            }
            Response.Redirect("Users.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        public void ListData()
        {
            DataTable lstData = ObjclsFrms.loadList("SelectRoleByUserRole", "sp_User", Request.Params["Id"].ToString());
            if (lstData.Rows.Count > 0)
            {
                grvRpt.DataSource = lstData;
            }
        }

        protected void grvRpt_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem )
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string IsRole = dataItem["IsRole"].Text.ToString();
                
                if (IsRole.Equals("1"))
                {
                    dataItem.Selected = true;
                }
                
            }
        }
    }
}