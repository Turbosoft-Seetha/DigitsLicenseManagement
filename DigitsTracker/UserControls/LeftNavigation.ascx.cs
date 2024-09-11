using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Security;
using Ecosoft.DAL;
using System.Data;
using DigitsLicenseManagement.BO_Digits;

namespace DigitsLicenseManagement.UserControls
{
    public partial class LeftNavigation : System.Web.UI.UserControl
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
              if (!Page.IsPostBack)
                {
                    //if (Session["count"] == null)
                    //{
                        LeftCount();
                    //}
                    this.LoadMenu();
                }
            }
            catch (Exception ex)
            {
                UICommon.LogException(ex, "Left Menu");
            }
        }

        public void LeftCount()
        {
            DataTable dt = ObjclsFrms.loadList("LeftNavCount", "sp_Masters", UICommon.GetCurrentUserID().ToString());
            Session["count"] = dt;
        }

        public void htmlMenu()
        {
            StringBuilder html = new StringBuilder();
            html.Append("<li class=\"m-menu__item\" aria-haspopup=\"true\"><a href = \"media.html\" class=\"m-menu__link\"><i class=\"m-menu__link-bullet m-menu__link-bullet--dot\"><span></span></i><span class=\"m-menu__link-text\">Media</span></a></li>");
            html.Append("<li class=\"m-menu__item\" aria-haspopup=\"true\"><a href = \"media.html\" class=\"m-menu__link\"><i class=\"m-menu__link-bullet m-menu__link-bullet--dot\"><span></span></i><span class=\"m-menu__link-text\">Our Media</span></a></li>");
            html.Append("</ul>");
            html.Append("</div>");
            html.Append("</li>");

            ltrlHtml.Text = html.ToString();
        }

        private void LoadMenu()
        {
            DataTable dx = (DataTable) Session["count"];
            var leftNavs = DALHelper.GetLeftNavigation();
            var html = new StringBuilder();
            int isSelectionDone = 0;

            var url = Request.Url.AbsolutePath;
            //var userRoles = Roles.GetRolesForUser(HttpContext.Current.User.Identity.Name);
            var userRoles = Roles.GetRolesForUser(Session["UserName"].ToString());

            if (!UserHasAccess(userRoles))
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            foreach (LeftNav leftNav in leftNavs.Where(nav => nav.Parent == 0 || nav.Parent == -1).OrderBy(nav => nav.SortOrder))
            {
                if (!UserInRole(leftNav.Roles, userRoles) && leftNav.Parent != -1)
                {
                    continue;
                }

                var children = leftNavs.Where(nav => nav.Parent == leftNav.ID);
                
                bool select;
                
                string urql;

                urql = "..";

                isSelectionDone = 0;

                if (children != null && children.Count() > 0)
                {
                    foreach (LeftNav currentNav in children.OrderBy(nav => nav.SortOrder))
                    {
                        if (!UserInRole(currentNav.Roles, userRoles))
                        {
                            continue;
                        }
                        select = isActive(currentNav, leftNavs, url);
                        if (select)
                        {

                            html.AppendFormat("<li class=\"kt-menu__item kt-menu__item--submenu kt-menu__item--open\" aria-haspopup=\"true\"  data-ktmenu-submenu-toggle=\"hover\">");
                            isSelectionDone = 1;
                            continue;
                        }
                    }

                    if (isSelectionDone == 0)
                    {
                        html.AppendFormat("<li class=\"kt-menu__item kt-menu__item--submenu \" aria-haspopup=\"true\" data-ktmenu-submenu-toggle=\"hover\">");
                    }
                }
                else
                {
                    
                        if (leftNav.Parent == -1)
                    {
                        html.AppendFormat("<li class=\"kt-menu__section\"> <h4 class=\"kt-menu__section-text\">{0}</h4>", leftNav.Title);
                    }
                    else
                    {
                        select = isActive(leftNav, leftNavs, url);

                        if (select)
                        {
                            Session["page"] = null;
                            html.AppendFormat("<li class=\"kt-menu__item  kt-menu__item--active\" aria-haspopup=\"true\">");
                        }else
                        {
                            if (Session["page"] != null)
                            {
                                if (Session["page"].ToString().Equals(leftNav.Url))
                                {
                                    html.AppendFormat("<li class=\"kt-menu__item  kt-menu__item--active\" aria-haspopup=\"true\">");
                                }
                                else
                                {
                                    html.AppendFormat("<li class=\"kt-menu__item  kt-menu__item\" aria-haspopup=\"true\">");
                                }
                            }
                            else
                            {
                                html.AppendFormat("<li class=\"kt-menu__item  kt-menu__item\" aria-haspopup=\"true\">");
                            }
                            
                            
                        }
                        
                    }
                  
                }

                if (children != null && children.Count() > 0)
                {
                    html.Append("<a href =\"javascript:;\" class=\"kt-menu__link kt-menu__toggle\">");
                    html.AppendFormat("<span class=\"kt-menu__link-icon\"><img src=\"{0}\"/></span><span class=\"kt-menu__link-text\" >{1}</span>", leftNav.icon, leftNav.Title);
                    html.Append("<i class=\"kt-menu__ver-arrow la la-angle-right\"></i></a>");
                    html.Append("<div class=\"kt-menu__submenu\"><span class=\"kt-menu__arrow\"></span>");
                    html.Append("<ul class=\"kt-menu__subnav\">");

                    foreach (LeftNav currentNav in children.OrderBy(nav => nav.SortOrder))
                    {
                        if (!UserInRole(currentNav.Roles, userRoles))
                        {
                            continue;
                        }

                        select = isActive(currentNav, leftNavs, url);
                       
                        if (select)
                        {
                            html.AppendFormat("<li class=\"kt-menu__item  kt-menu__item--active\" aria-haspopup=\"true\"><a href = \"{0}\" class=\"kt-menu__link\">", currentNav.Url);
                            html.AppendFormat("<i class=\"kt-menu__link-bullet kt-menu__link-bullet--dot\"><span></span></i><span class=\"kt-menu__link-text\" >{0}</span>", currentNav.Title);
                            html.AppendFormat("</a></li>");
                            //<span class=\"kt-badge kt-badge--danger kt-badge--inline\"></span>
                            //if there is any notifiation count to be displayed, then it can be shown under this span
                        }
                        else
                        {
                            html.AppendFormat("<li class=\"kt-menu__item\" aria-haspopup=\"true\"><a href = \"{0}\" class=\"kt-menu__link\">", currentNav.Url);
                            html.AppendFormat("<i class=\"kt-menu__link-bullet kt-menu__link-bullet--dot\"><span></span></i><span class=\"kt-menu__link-text\" >{0}</span>", currentNav.Title);
                            html.AppendFormat("</a></li>");
                            //<span class=\"kt-badge kt-badge--danger kt-badge--inline\"></span>
                            //if there is any notifiation count to be displayed, then it can be shown under this span
                        }
                    }

                    html.Append("</ul>");
                    html.Append("</div>");
                }
                else
                {
                    if (leftNav.Parent != -1)
                    {
                        html.AppendFormat("<a href = \"{0}\" class=\"kt-menu__link\">", leftNav.Url);
                        html.AppendFormat("<span class=\"kt-menu__link-icon\">");
                        html.AppendFormat("<img src = \"{0}\" height=\"15px\" width=\"15px\" />" , leftNav.icon);
                        if (leftNav.Hidden == true)
                        {
                            string count = "0";
                            try
                            {
                                if (leftNav.Url.Equals("/Admin/ListNewClaim.aspx")) { count = dx.Rows[0][3].ToString(); }
                                else if (leftNav.Url.Equals("/Admin/ClosedClaim.aspx")) { count = dx.Rows[0][1].ToString(); }
                                else if (leftNav.Url.Equals("/Admin/ProposedMasters.aspx")) { count = dx.Rows[0][4].ToString(); }
                                else if (leftNav.Url.Equals("/Admin/DraftedClaim.aspx")) { count = dx.Rows[0][5].ToString(); }
                                else { count = "0"; }
                            }
                            catch (Exception ex)
                            {

                            }
                            

                            html.AppendFormat("</span><span class=\"kt-menu__link-text\" >{0}</span><span class=\"kt-menu__link-badge\"><span class=\"kt-badge" +
                                " kt-badge--rounded kt-badge--brand\" style=\"background-color:#ed1c24;\">{1}</span></span></a>", leftNav.Title , count);
                            
                        }
                        else
                        {
                            html.AppendFormat("</span><span class=\"kt-menu__link-text\" >{0}</span><span class=\"kt-menu__link-badge\"></a>", leftNav.Title);
                        }
                        
                        //
                    }
                }
                html.AppendFormat("</li>");
            }

            this.ltrlHtml.Text = html.ToString();
        }

        private bool isActive(LeftNav currentMenu, IEnumerable<LeftNav> menus, string url)
        {
            if (currentMenu.Url == url)
            {
                return true;
            }

            return menus.FirstOrDefault(menu => menu.Parent == currentMenu.ID && menu.Url == url) != null;
        }

        private bool UserInRole(string roles, string[] userRoles)
        {
            foreach (string userRole in userRoles)
            {
                foreach (string role in roles.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    if (string.Equals(userRole, role, StringComparison.OrdinalIgnoreCase))
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        private bool UserHasAccess(string[] userRoles)
        {

            var appUrl = VirtualPathUtility.ToAbsolute("~/");

            // remove the app path (exclude the last slash)
            var relativeUrl = HttpContext.Current.Request.Url.AbsolutePath.Remove(0, appUrl.Length - 1);

            var pages = DALHelper.GetLeftNavigation(relativeUrl);



            if (pages == null)
            {
                return false;
            }

            foreach (string userRole in userRoles)
            {
                foreach (string role in pages[0].Roles.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
                {
                    if (string.Equals(userRole, role, StringComparison.OrdinalIgnoreCase))
                    {
                        return true;
                    }
                }
            }

            return false;
        }
    }
}