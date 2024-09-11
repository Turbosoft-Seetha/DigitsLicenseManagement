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
    public partial class ListLicenseTypes : System.Web.UI.Page
    {
        GeneralFunctions Obj = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    GetGridSession(grvRpt, "LicenseMaster");

                    grvRpt.Rebind();
                }

                catch (Exception ex)
                {
                    String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                    Obj.LogMessageToFile(UICommon.GetLogFileName(), "ListLicenseTypes.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

                }
            }

        }
        public void SetGridSession(RadGrid grd, string SessionPrefix)

        {

            try

            {

                foreach (GridColumn column in grd.MasterTableView.Columns)

                {

                    if (column is GridBoundColumn boundColumn)

                    {

                        string columnName = boundColumn.UniqueName;

                        string filterValue = column.CurrentFilterValue;

                        Session[SessionPrefix + columnName] = filterValue;

                    }

                }

            }

            catch (Exception ex)

            {



            }



        }
        public void GetGridSession(RadGrid grd, string SessionPrefix)

        {

            try

            {

                string filterExpression = string.Empty;

                foreach (GridColumn column in grd.MasterTableView.Columns)

                {

                    if (column is GridBoundColumn boundColumn)

                    {

                        string columnName = boundColumn.UniqueName;

                        if (Session[SessionPrefix + columnName] != null)

                        {

                            string filterValue = Session[SessionPrefix + columnName].ToString();



                            if (filterValue != "")
                            {

                                column.CurrentFilterValue = filterValue;



                                if (!string.IsNullOrEmpty(filterExpression))

                                {

                                    filterExpression += " AND ";

                                }

                                filterExpression += string.Format("{0} LIKE '%{1}%'", column.UniqueName, column.CurrentFilterValue);

                            }

                        }

                    }

                }

                if (filterExpression != string.Empty)

                {

                    grvRpt.MasterTableView.FilterExpression = filterExpression;

                }



            }

            catch (Exception ex)

            {



            }

        }
 
        public void LoadList()
        {
            DataTable lstUser = default(DataTable);
            lstUser = Obj.loadList("ListLicenseTypes", "sp_Masters");
            grvRpt.DataSource = lstUser;
        }


        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                RadGrid grd = (RadGrid)sender;

                SetGridSession(grd, "LicenseMaster");
            }
            catch (Exception ex)
            {
            }

            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("typ_ID").ToString();
                Response.Redirect("AddEditLicenseTypes.aspx?Id=" + ID);
            }

        }
        protected void lnkSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditLicenseTypes.aspx?Id=0");
        }
    }
}