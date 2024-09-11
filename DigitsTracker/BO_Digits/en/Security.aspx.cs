using Ecosoft.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web.Security;
using System.Data;


namespace DigitsLicenseManagement.BO_Digits.en
{
    public partial class Security : System.Web.UI.Page
    {
        List<LeftNav> navigations;

        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    this.LoadRoles();
                    this.LoadSecurity();
                }
            }
            catch (Exception ex)
            {
                //UICommon.LogException(ex, "Security");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "Security.aspx Page_Load()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

            }
        }
        private void LoadRoles()
        {
            DataTable dt = ObjclsFrms.loadList("SelRoles", "sp_LeftNavigation");

            foreach (DataRow dr in dt.Rows)
            {
                this.chkRoles.Items.Add(dr["RoleName"].ToString());
            }
        }

        private void LoadSecurity()
        {

            DataTable dt = ObjclsFrms.loadList("SelMainPages", "sp_LeftNavigation");
            this.treeSecurity.Nodes.Clear();

            foreach (DataRow dr in dt.Rows)
            {
                RadTreeNode treeNode = this.GetTreeNode(dr["Name"].ToString(), dr["fac_ID"].ToString());

                if (dr["Position"].ToString() == "-1")
                {
                    treeNode.ImageUrl = "../assets/media/Security/section.png";
                }
                else
                {
                    treeNode.ImageUrl = "../assets/media/Security/folder.png";
                }


                this.treeSecurity.Nodes.Add(treeNode);

                this.AddTreeNode(treeNode, dr["fac_ID"].ToString());
            }


        }
        private RadTreeNode GetTreeNode(string title, string value)
        {
            RadTreeNode treeNode = new Telerik.Web.UI.RadTreeNode();

            treeNode.Text = title;
            treeNode.Value = value;

            return treeNode;
        }

        private void AddTreeNode(RadTreeNode parentTreeNode, string facID)
        {

            DataTable dt = ObjclsFrms.loadList("SelChildNodes", "sp_LeftNavigation", facID);

            if (dt.Rows.Count == 0)
            {
                return;
            }

            foreach (DataRow dr in dt.Rows)
            {
                RadTreeNode treeNode = this.GetTreeNode(dr["Name"].ToString(), dr["fac_ID"].ToString());
                if (dr["Position"].ToString() == "1")
                {
                    treeNode.ImageUrl = "../assets/media/Security/subFolder.png";
                }
                else
                {
                    treeNode.ImageUrl = "../assets/media/Security/file.png";
                }
                parentTreeNode.Nodes.Add(treeNode);

                this.AddTreeNode(treeNode, dr["fac_ID"].ToString());
            }
        }
        protected void radSiteMap_NodeDrop(object sender, RadTreeNodeDragDropEventArgs e)
        {
            RadTreeNode sourceNode = e.SourceDragNode;
            RadTreeNode destNode = e.DestDragNode;
            RadTreeViewDropPosition dropPosition = e.DropPosition;

            if (destNode != null) //drag&drop is performed between trees
            {
                if (sourceNode.TreeView.SelectedNodes.Count <= 1)
                {
                    PerformDragAndDrop(dropPosition, sourceNode, destNode);
                }
                else if (sourceNode.TreeView.SelectedNodes.Count > 1)
                {
                    if (dropPosition == RadTreeViewDropPosition.Below) //Needed to preserve the order of the dragged items
                    {
                        for (int i = sourceNode.TreeView.SelectedNodes.Count - 1; i >= 0; i--)
                        {
                            PerformDragAndDrop(dropPosition, sourceNode.TreeView.SelectedNodes[i], destNode);
                        }
                    }
                    else
                    {
                        foreach (RadTreeNode node in sourceNode.TreeView.SelectedNodes)
                        {
                            PerformDragAndDrop(dropPosition, node, destNode);
                        }
                    }
                }

                destNode.Expanded = true;
                sourceNode.TreeView.UnselectAllNodes();
            }
        }

        private static void PerformDragAndDrop(RadTreeViewDropPosition dropPosition, RadTreeNode sourceNode, RadTreeNode destNode)
        {
            if (sourceNode.Equals(destNode) || sourceNode.IsAncestorOf(destNode))
            {
                return;
            }

            if (destNode.ParentNode == null)
            {
                return;
            }

            sourceNode.Owner.Nodes.Remove(sourceNode);

            switch (dropPosition)
            {
                case RadTreeViewDropPosition.Over:
                    // child
                    if (!sourceNode.IsAncestorOf(destNode))
                    {
                        destNode.Nodes.Add(sourceNode);
                    }
                    break;

                case RadTreeViewDropPosition.Above:
                    // sibling - above                         
                    destNode.InsertBefore(sourceNode);
                    break;

                case RadTreeViewDropPosition.Below:
                    // sibling - below
                    destNode.InsertAfter(sourceNode);
                    break;
            }
        }
        protected void treeSecurity_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            string facID = e.Node.Value;

            foreach (ListItem role in this.chkRoles.Items)
            {
                role.Selected = false;
            }

            DataTable dt = ObjclsFrms.loadList("SelPageRoles", "sp_LeftNavigation", facID);
            string roleName = dt.Rows[0]["Roles"].ToString();
            foreach (string role in roleName.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                if (chkRoles.Items.FindByText(role) != null)
                {
                    chkRoles.Items.FindByText(role).Selected = true;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                // UICommon.LogException(ex, "Security");
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                ObjclsFrms.LogMessageToFile(UICommon.GetLogFileName(), "Security.aspx btnSave_Click()", "Error : " + ex.Message.ToString() + " - " + innerMessage);

            }
        }

        protected void chkRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int facID = int.Parse(treeSecurity.SelectedNode.Value);

                var selectedRoles = string.Empty;
                //Roles concat logic
                foreach (ListItem listItem in chkRoles.Items)
                {
                    if (listItem.Selected)
                    {
                        if (string.IsNullOrEmpty(selectedRoles))
                        {
                            selectedRoles = listItem.Text;
                        }
                        else
                        {
                            selectedRoles = selectedRoles + "," + listItem.Text;
                        }
                    }
                }
                string[] arr = { selectedRoles };
                DataTable dt = ObjclsFrms.loadList("updNavigation", "sp_LeftNavigation", facID.ToString(), arr);
            }
            catch (Exception ex)
            {

            }
        }
    }
}