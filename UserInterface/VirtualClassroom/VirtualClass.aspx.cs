using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic;
using System.Data;
using System.Collections;
using MySql.Data.MySqlClient;
using CMS.Logic.Database;
using System.Net;

namespace CMS.UserInterface.VirtualClassroom
{
    public partial class VirtualClass : System.Web.UI.Page
    {
        public DBConnect dbc = new DBConnect();
        public Functions func = new Functions();
        public DataTable dt, dt1, dt2, dtvideo, dtfile, staffdb, classdb, subid;
        public  String staffid, qry;
        public String defaultKey = "http://d26qa89x3cppxu.cloudfront.net/yt.html#id=mk48xRzuNvA&height=385px&width=640px";
        public String defaultDescription = "This is player content, Select Semester 4 and Department Computer Engineering for convenience";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //dt = func.getDeptName();
                //func.fillDropdownlistWithDT(ddlDept,dt,"id","dept_name");

                //ddlDept.Items.Insert(0, new ListItem("Select Department", "0"));
                func.fillDropdownlist(ddlDept, "select id,dept_name from dept_master where id in (select distinct dept_id from term_master );", "id", "dept_name");

                ddlSem.Items.Insert(0, new ListItem("Select Department First", "0"));
                ddlClass.Items.Insert(0, new ListItem("Select Semester First", "0"));

                staffid = func.getStaffId(Session["UserID"].ToString());
                qry = "SELECT * FROM video_master WHERE addedby_staff_id='" + staffid + "'";
                dt1 = func.executeSelectQueryWithDT(qry);
                dtvideo = func.selectTopEntry(dt1, 5);
                //repeater1.DataSource = dtvideo;
                //repeater1.DataBind();

                String query = "Select * from file_master WHERE addedby_staff_id='" + staffid + "'";
                dt = func.executeSelectQueryWithDT(query);
                staffdb = func.getStaffName(dt, "addedby_staff_id");
                classdb = func.getSubjectName(dt, "class_id");
                // keyList = func.fillArrayList(dt, "path_value");
                //   keyArray=(String[])keyList.ToArray(typeof(string));
                //    Session["ArrayValue"] = keyArray;
                dtfile = func.DtToDt(dt, staffdb, classdb);
                repeater2.DataSource = dtfile;
                repeater2.DataBind();

                //   subid = func.getSubId(staffid);
                //   Response.Write(subid.Rows.Count);
                //  dt2 = func.getContent(subid,"sub_id");
                //  Response.Write(dt2.Rows.Count);
                // //  dtfile = func.getAllContent(classdb,"sub_id","file_master");
                ////   qry1 = "SELECT * FROM file_master WHERE by_staff_id='" + staffid + "'";
                ////   dt2 = func.executeSelectQueryWithDT(qry1);
                //   staffdb = func.getStaffName(dt2, "by_staff_id");
                //   classdb = func.getSubjectName(dt2, "class_id");
                //   dtfile = func.DtToDt(dt2,staffdb,classdb);
                //   repeater2.DataSource = dtfile;
                //   repeater2.DataBind();
                // //  Response.Write(dt1.Rows.Count);
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateSub(int depID,int semID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,sub_name from subject_master where (dept_id=@depID and semester=@semID)";
            MySqlConnection con = new MySqlConnection(new DBConnect()._conStr);
            MySqlCommand cmd = new MySqlCommand(qry, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@depID", depID);
            cmd.Parameters.AddWithValue("@semID", semID);
            cmd.CommandText = qry;
            cmd.Connection = con;
            con.Open();
            MySqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                list.Add(new ListItem(sdr["sub_name"].ToString(), sdr["id"].ToString()));
            }
            con.Close();
            return list;

        }

        protected void dwnld_click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            String filename = b.CommandArgument.ToString();
            String flpath = Server.MapPath("~/Temp/" + filename);
            Response.Write(flpath);
            WebClient wc = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + flpath + "\"");
            byte[] data = wc.DownloadData(flpath);
            response.BinaryWrite(data);
            response.End();
        }

        protected void LoadSemesters(object sender, EventArgs e)
        {
            //ddlSem.Items.Insert(0, new ListItem("Select Semester", "0"));
            ddlSem.Items.Clear();
            func.fillDropdownlist(ddlSem, "select distinct semester from term_master where dept_id in (select id from dept_master where dept_name = '" + ddlDept.SelectedItem.Text + "');", "semester", "semester");
        }

        protected void LoadClasses(object sender, EventArgs e)
        {
            //ddlClass.Items.Insert(0, new ListItem("Select Class", "0"));
            ddlClass.Items.Clear();
            func.fillDropdownlist(ddlClass, "select id,class_name from term_master where dept_id in (select id from dept_master where dept_name = '" + ddlDept.SelectedItem.Text + "') and semester = " + ddlSem.SelectedValue + ";", "id", "class_name");
        }

        protected void LoadVideos(object sender, EventArgs e)
        {
            dt = dbc.executeSelectQueryWithDT("select * from video_master where class_id in (select id from term_master where class_name = '" + ddlClass.SelectedItem.Text + "');");
            DL1.DataSource = dt;
            DL1.DataBind();
        }
    }
}