using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic.VirtualClassroom;
using System.Data;
using CMS.Logic.Database;
using CMS.Logic;
using MySql.Data.MySqlClient;
using System.Collections;
using Google.GData.YouTube;
using System.Data;

namespace CMS.UserInterface.VirtualClassroom
{
    public partial class VideoUpload : System.Web.UI.Page
    {

        public VideoUploadFunc vupf = new VideoUploadFunc();
        public Functions func = new Functions();
        private DBConnect dbc = new DBConnect();
        public String urlName = "";
        public String tokenValue = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable subid;
            DataTable subname;
            String stf_id;
            stf_id = func.getStaffId(Session["UserID"].ToString());
            String qry = "Select sub_id from term_master where staff_id = '" + stf_id + "' ";
            subid = func.executeSelectQueryWithDT(qry);
            subname = func.getSubjectName(subid,"sub_id");
            func.fillDropdownlistWithDT(ddlClass,subname,"id","sub_name");
            ddlClass.Items.Insert(0, new ListItem("Select Class", "0"));
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateSubjects(int semID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,sub_name from subject_master where id in (select sub_id from term_master where semester=@semID)";
            MySqlConnection con = new MySqlConnection(new DBConnect()._conStr);
            MySqlCommand cmd = new MySqlCommand(qry, con);
            cmd.CommandType = CommandType.Text;
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

        protected void compare_Text(Object sender, EventArgs e)
        {
            Response.Write("This is already exists");
        }


        protected void add_Video(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                meta.Attributes.Remove("style");
                meta.Attributes.Add("style", "display:none");
                videoUp.Attributes.Remove("style");
                videoUp.Attributes.Add("style", "display:block");
            }
            Session["VideoTitle"] = Text_title.Text;
            Session["VideoDescription"] = Text_description.Text;
            Session["ClassId"] = ddlClass.SelectedValue;
            FormUploadToken formtoken = vupf.addMetadata(Text_title.Text, Text_description.Text, Text_keyword.Text);
            urlName = formtoken.Url;
            tokenValue = formtoken.Token;
            Response.Write(Session["ClassId"]);
        }


    }


}