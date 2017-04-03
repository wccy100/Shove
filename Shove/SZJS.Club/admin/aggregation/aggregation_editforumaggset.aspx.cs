using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Discuz.Forum;
using Discuz.Config;
using Discuz.Common;
using Discuz.Common.Xml;


namespace Discuz.Web.Admin
{
#if NET1
    public class editforumaggset : AdminPage
#else
    public partial class editforumaggset : AdminPage
#endif
    {

#if NET1
        #region �ؼ�����
        protected System.Web.UI.HtmlControls.HtmlForm form1;
        protected System.Web.UI.WebControls.Panel panel1;
        protected System.Web.UI.HtmlControls.HtmlInputHidden topicid;
        protected System.Web.UI.HtmlControls.HtmlInputHidden fulldescription;

        protected Discuz.Control.DataGrid websiteconfig;
        protected Discuz.Control.TextBox title;
        protected Discuz.Control.TextBox poster;
        protected Discuz.Control.TextBox postdatetime;
        protected Discuz.Web.Admin.TextareaResize shortdescription;
        protected Discuz.Control.Button savetopic;
        protected Discuz.Control.Hint hint1;
        #endregion
#endif

        private string configPath;
        protected void Page_Load(object sender, EventArgs e)
        {
            configPath = AppDomain.CurrentDomain.BaseDirectory + "config/aggregation.config";
            if (!IsPostBack)
            {
                DataTable dt = Getwebsiteconfig();
                websiteconfig.TableHeaderName = "�����б�";
                websiteconfig.DataKeyField = "tid";
                websiteconfig.DataSource = dt;
                websiteconfig.DataBind();
                string tid = DNTRequest.GetString("tid");
                if(tid != "")
                    BindEditData(tid);
            }
        }

        private void BindEditData(string tid)
        {
            #region װ������༭
            panel1.Visible = true;
            XmlDocumentExtender doc = new XmlDocumentExtender();
            doc.Load(configPath);
            XmlNodeList topiclistNode = doc.SelectNodes("/Aggregationinfo/Aggregationpage/Website/Forum/Topiclist/Topic");
            XmlNodeInnerTextVisitor topicvisitor = new XmlNodeInnerTextVisitor();
            foreach (XmlNode topic in topiclistNode)
            {
                topicvisitor.SetNode(topic);
                if (topicvisitor["topicid"] == tid)
                {
                    topicid.Value = topicvisitor["topicid"];
                    tbtitle.Text = topicvisitor["title"];
                    poster.Text = topicvisitor["poster"];
                    postdatetime.Text = topicvisitor["postdatetime"];
                    shortdescription.Text = topicvisitor["shortdescription"];
                    fulldescription.Value = topicvisitor["fulldescription"];
                }
            }
            #endregion
        }

        private DataTable Getwebsiteconfig()
        {
            #region װ������
            DataTable dt = new DataTable();
            dt.Columns.Add("tid");
            dt.Columns.Add("title");
            dt.Columns.Add("poster");
            dt.Columns.Add("postdatetime");
            dt.Columns.Add("showtype");
            XmlDocumentExtender doc = new XmlDocumentExtender();
            doc.Load(configPath);
            XmlNodeList topiclistNode = doc.SelectNodes("/Aggregationinfo/Aggregationpage/Website/Forum/Topiclist/Topic");
            XmlNodeInnerTextVisitor topicvisitor = new XmlNodeInnerTextVisitor();
            foreach (XmlNode topic in topiclistNode)
            {
                topicvisitor.SetNode(topic);
                DataRow dr = dt.NewRow();
                dr["tid"] = topicvisitor["topicid"];
                dr["title"] = topicvisitor["title"];
                dr["poster"] = topicvisitor["poster"];
                dr["postdatetime"] = topicvisitor["postdatetime"];
                dt.Rows.Add(dr);
            }
            return dt;
            #endregion
        }

        protected void savetopic_Click(object sender, EventArgs e)
        {
            #region ���������޸�
            XmlDocumentExtender doc = new XmlDocumentExtender();
            doc.Load(configPath);
            XmlNodeList topiclistNode = doc.SelectNodes("/Aggregationinfo/Aggregationpage/Website/Forum/Topiclist/Topic");
            XmlNodeInnerTextVisitor topicvisitor = new XmlNodeInnerTextVisitor();
            foreach (XmlNode topic in topiclistNode)
            {
                topicvisitor.SetNode(topic);
                if (topicvisitor["topicid"] == topicid.Value)
                {
                    topicvisitor["topicid"] = topicid.Value;
                    topicvisitor["title"] = tbtitle.Text;
                    topicvisitor["poster"] = poster.Text;
                    topicvisitor["postdatetime"] = postdatetime.Text;
                    XmlCDataSection shortDes = doc.CreateCDataSection("shortdescription");
                    shortDes.InnerText = shortdescription.Text;
                    topicvisitor.GetNode("shortdescription").RemoveAll();
                    topicvisitor.GetNode("shortdescription").AppendChild(shortDes);
                    break;
                }
            }
            doc.Save(configPath);
            Response.Redirect("aggregation_editforumaggset.aspx");
            #endregion
        }
    }
}