using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement.UserControls
{
    public partial class BreadCrumb : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBreadCrumb();
        }

        private void LoadBreadCrumb()
        {

            SiteMapProvider siteMapProvider = SiteMap.Providers["cms"];
            SiteMapNodeCollection collection = new SiteMapNodeCollection();
            string stt2s = siteMapProvider.RootNode.Title;
   
            SiteMapNode currentNode = siteMapProvider.CurrentNode;
            if (currentNode == null)
                currentNode = siteMapProvider.RootNode;

            string stts = currentNode.Url;
            string stt1s = Page.Request.Url.AbsolutePath;

            if (string.Compare(currentNode.Url, Page.Request.Url.AbsolutePath, true) == 0)
            {
                
                    collection.Add(currentNode);
            }

            while (currentNode.ParentNode != null)
            {
                currentNode = currentNode.ParentNode;
                collection.Add(currentNode);
            }

            StringBuilder html = new StringBuilder();

            html.Append("<ul class='page-breadcrumb breadcrumb'>");

            for (int count = collection.Count - 1; count > -1; count--)
            {
                string title = collection[count].Title;

                if (count == 0)
                {
                    if ((collection[count].Url == "/Admin/UserRoles.aspx"))
                    {
                        html.AppendFormat("<li>{1}</li>", collection[count].Url, title);
                    }
                    else
                    {
                        html.AppendFormat("<li><a href=\"{0}\">{1}</a></li>", collection[count].Url, title);
                    }
                }
                else if (count == collection.Count - 1)
                {
                    html.AppendFormat("<li><i class=\"icon-home\"></i><a href=\"{0}\">Home</a> <i class='fa fa-angle-right'></i></li>", collection[count].Url);
                   
                }
                else
                {

                    html.AppendFormat("<li><a href=\"{0}\">{1}</a><i class='fa fa-angle-right'></i></li>", collection[count].Url, title);
                    
                }
            }

            html.Append("</ul>");
            this.ltrlBreadCrumb.Text = html.ToString();
        }

    }
}