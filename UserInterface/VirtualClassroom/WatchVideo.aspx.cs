using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using CMS.Logic;

namespace CMS.UserInterface.VirtualClassroom
{
    public partial class WatchVideo : System.Web.UI.Page
    {
        public String key;
        public DataTable dt;
        public Functions func = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
            key=Request.QueryString["keyValue"];
            HtmlControl fram1=(HtmlGenericControl)this.FindControl("frame1");
            frame1.Attributes["src"] = "https://www.youtube.com/embed/"+key;
            //String qry="SELECT description FROM video_master WHERE key =' "+ key +" '";
            //dt=func.executeSelectQueryWithDT(qry);
            //Response.Write(dt.Rows.Count);
            
        }
    }
}