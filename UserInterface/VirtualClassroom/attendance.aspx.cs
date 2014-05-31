using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic.Database;
using System.Data;
using CMS.Logic.VirtualClassroom;
using CMS.Logic;
using System.Collections;
using MySql.Data.MySqlClient;

namespace CMS.UserInterface.VirtualClassroom
{
    public partial class attendance : System.Web.UI.Page
    {
        public DBConnect dbc = new DBConnect();
        public VideoUploadFunc vc = new VideoUploadFunc();
        public Functions fc = new Functions();
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            String stf_id;
            dt = fc.getDeptName();
            fc.fillDropdownlistWithDT(ddlDepart, dt, "id", "dept_name");
            stf_id = fc.getStaffId(Session["UserID"].ToString());
            String qry = "Select distinct semester from term_master where staff_id = '" + stf_id + "' ";
            fc.fillDropdownlist(ddlSem,qry,"semester","semester");
            ddlDepart.Items.Insert(0, new ListItem("Select Department", "0"));
            ddlSem.Items.Insert(0,new ListItem("Select Semester","0"));
            ddlSub.Items.Insert(0, new ListItem("Select Subject", "0"));
            ddlDiv.Items.Insert(0, new ListItem("Select Division", "0"));
            
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

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateDiv(int semID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,division from term_master where semester=@semID";
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
                list.Add(new ListItem(sdr["division"].ToString(), sdr["id"].ToString()));
            }
            con.Close();
            return list;

        }
        }
    }
