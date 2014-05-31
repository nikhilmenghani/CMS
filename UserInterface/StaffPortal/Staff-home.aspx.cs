using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using CMS.Logic;

namespace CMS
{
    public partial class Staff_home : System.Web.UI.Page
    {
        public Functions func = new Functions();
        public DataTable dt;
        public ArrayList keyList = new ArrayList();
     //   public String[] keyArray;


        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable staffdb,classdb,videoDetails;
            String query = "Select * from video_master order by date_time desc";
            dt = func.executeSelectQueryWithDT(query);
            staffdb = func.getStaffName(dt,"addedby_staff_id");
            classdb = func.getSubjectName(dt,"class_id");
            keyList = func.fillArrayList(dt,"path_value");
         //   keyArray=(String[])keyList.ToArray(typeof(string));
        //    Session["ArrayValue"] = keyArray;
            videoDetails = func.DtToDt(dt,staffdb,classdb);
            repeater1.DataSource = videoDetails;
            repeater1.DataBind();
            
        }

        protected void btnhandler(object sender,EventArgs e)
        {
            LinkButton lb=(LinkButton)(sender);
            String skey = lb.CommandArgument;
            Response.Redirect("../VirtualClassroom/WatchVideo.aspx?keyValue=" +skey );
        }


    }
}