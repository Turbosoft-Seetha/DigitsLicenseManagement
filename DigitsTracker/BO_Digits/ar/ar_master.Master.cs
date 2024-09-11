using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement.BO_Digits.ar
{
    public partial class ar_master : System.Web.UI.MasterPage
    {
        GeneralFunctions Obj = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["UserID"] != null)
                {
                    string userID = Session["UserID"].ToString();
                    string UserName = Session["UserName"].ToString();
                    string name = Session["Name"].ToString();
                    this.lblName.Text = name;
                    this.lblEmail.Text = UserName;

                    LoadMenu();
                    LoadLangs();

                    LoadBreadCrumb();
                }
                else
                {
                    Response.Redirect("../../SignIn.aspx");
                }
            }
        }

        public void LoadMenu()
        {
            StringBuilder sb = new StringBuilder();
            string userID = UICommon.GetCurrentUserID().ToString();
            string lang = Session["lang"].ToString();
            string[] arr = { lang };
            lblActlang.Text = lang;
            //if (Session["dtLeftNav"] == null)
            //{nthn
            DataSet dtLeft = Obj.loadList("SelLeftNavs", "sp_LeftNavigation", userID, arr, true);
            Session["dtLeftNav"] = dtLeft;
            //}

            DataSet dtSet = (DataSet)Session["dtLeftNav"];
            DataTable dt = dtSet.Tables[0];
            DataTable dtDetail = dtSet.Tables[1];
            string URLRoot = ConfigurationManager.AppSettings.Get("WebURL") + lang + "/";

            if (dt.Rows.Count > 0)
            {
                string facID = "";
                foreach (DataRow dr in dt.Rows)
                {
                    string Name = dr["Name"].ToString();
                    string Position = dr["Position"].ToString();
                    string icon = dr["icon"].ToString();

                    if (Position == "-1")
                    {
                        sb.AppendFormat("<div class=\"menu-item pt-5\">" +
                            "<div class=\"menu-content\">" +
                            "<span class=\"menu-heading fw-bold text-uppercase fs-7\" style=\"color:#080500 !important\">{0}</span>" +
                            "</div>" +
                            "</div>", Name);

                    }
                    else if (Position == "0")
                    {
                        string show = "";
                        StringBuilder sbDetail = new StringBuilder();
                        facID = dr["fac_ID"].ToString();
                        var url = Request.Url.AbsolutePath.ToString().Substring(1);

                        DataRow[] drDetail = dtDetail.Select("Parent_fac_ID = " + facID);
                        foreach (DataRow drx in drDetail)
                        {
                            string URL = "";
                            string active = "";

                            string NameDetail = drx["Name"].ToString();
                            URL = URLRoot + drx["URL"].ToString();
                            string Pos1_fac_ID = drx["fac_ID"].ToString();
                            string Pos = drx["Position"].ToString();

                            DataRow[] drPosition = dtDetail.Select("Parent_fac_ID = " + Pos1_fac_ID);

                            foreach (DataRow drxPos in drPosition)
                            {
                                string URLPos = URLRoot + drxPos["URL"].ToString();
                                if (URLPos == url)
                                {
                                    active = "active";
                                    show = "show";
                                }
                            }

                            if (URL == url)
                            {
                                active = "active";
                                show = "show";
                            }
                            if (Pos.Equals("1"))
                            {
                                sbDetail.AppendFormat("" +
                                  "<div class=\"menu-item\">" +
                                  "<a class=\"menu-link {2}\" href=\"{0}\">" +
                                  "<span class=\"menu-bullet\">" +
                                  "<span class=\"bullet bullet-dot\"></span>" +
                                  "</span>" +
                                  "<span class=\"menu-title\">{1}</span>" +
                                  "</a>" +
                                  "</div>", "../../" + URL, NameDetail, active);
                            }

                        }




                        sb.AppendFormat("<div data-kt-menu-trigger=\"click\" class=\"menu-item {0} menu-accordion\">", show);
                        sb.AppendFormat("<span class=\"menu-link\">" +
                            "<span class=\"menu-icon\">" +
                            "<span class=\"svg-icon svg-icon-2\">{0}</span>" +
                            "</span>" +
                            "<span class=\"menu-title\">{1}</span>" +
                            "<span class=\"menu-arrow\"></span>" +
                            "</span> <div class=\"menu-sub menu-sub-accordion\">", icon, Name);

                        sb.Append(sbDetail.ToString());

                        sb.Append("</div>");
                        sb.Append("</div>");


                    }
                }
            }

            ltrlMenu.Text = sb.ToString();
        }

        public void LoadLangs()
        {
            StringBuilder sb = new StringBuilder();
            if (Session["dtLanguages"] == null)
            {
                DataTable dtLeft = Obj.loadList("selLanguages", "sp_LeftNavigation");
                Session["dtLanguages"] = dtLeft;
            }

            DataTable dt = (DataTable)Session["dtLanguages"];

            rptLmags.DataSource = dt;
            rptLmags.DataBind();

        }

        public void LoadBreadCrumb()
        {
            StringBuilder sb = new StringBuilder();
            string URLRoot = "/" + ConfigurationManager.AppSettings.Get("WebURL") + Session["lang"].ToString() + "/";
            var url = Request.Url.AbsolutePath.ToString().Replace(URLRoot, "");
            string[] arr = { Session["lang"].ToString() };
            DataSet dxSet = Obj.loadList("SelbreadCrumbs", "sp_LeftNavigation", url, arr, true);

            DataTable dx = dxSet.Tables[1];
            DataTable dxHeader = dxSet.Tables[0];

            if (dxHeader.Rows.Count > 0)
            {
                lblHeading.Text = dxHeader.Rows[0]["Heading"].ToString();
            }

            foreach (DataRow dr in dx.Rows)
            {

                string cr_url = dr["URL"].ToString();
                string cr_Name = dr["BreadCrumb"].ToString();
                string Params = dr["bcm_Params"].ToString();
                string appendParas = "";
                if (cr_url == "#")
                {
                    sb.AppendFormat("<li class=\"breadcrumb-item text-muted\">{0}</li>", cr_Name);
                }
                else
                {
                    try
                    {
                        if (!Params.Equals(""))
                        {
                            string[] paras = Params.Split(',');
                            for (int i = 0; i < paras.Length; i++)
                            {
                                if (i == 0)
                                {
                                    appendParas = "?";
                                }
                                appendParas += paras[i].ToString() + "=" + Request.Params[paras[i].ToString()].ToString() + "&";
                            }
                        }
                    }
                    catch
                    {

                    }
                    sb.AppendFormat("<li class=\"breadcrumb-item text-muted\"><a href = \"{0}\" class=\"text-muted text-hover-primary\">{1}</a>", URLRoot + cr_url + appendParas, cr_Name);
                    sb.Append("</li><li class=\"breadcrumb-item\"><span class=\"bullet bg-gray-400 w-5px h-2px\"></span></li>");
                }
            }

            ltrlCrumbs.Text = sb.ToString();
        }

        protected void lnkLang_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Label lblCode = (Label)lnk.FindControl("lblLngCode");

            string URLRoot = ConfigurationManager.AppSettings.Get("WebURL") + Session["lang"].ToString() + "/";
            var url = Request.Url.AbsolutePath.ToString().Replace(URLRoot, "");
            Session["lang"] = lblCode.Text.ToString();
            URLRoot = ConfigurationManager.AppSettings.Get("WebURL") + Session["lang"].ToString() + url;
            Response.Redirect("../../" + URLRoot);

        }
    }
}