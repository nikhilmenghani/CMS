using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic;
using System.Collections;
using MySql.Data.MySqlClient;
using System.Data;
using CMS.Logic.Database;

namespace CMS.UserInterface.Admin
{
    public partial class Config_Class : System.Web.UI.Page
    {
        Term term = new Term();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DDL_addDept.Items.Insert(0, new ListItem("Select Department", "0"));
                term.func.fillDropdownlist(DDL_addDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                //DDL_addTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                //term.func.fillDropdownlist(DDL_addTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_removeDept.Items.Insert(0, new ListItem("Select Department", "0"));
                term.func.fillDropdownlist(DDL_removeDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                //DDL_removeTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                //term.func.fillDropdownlist(DDL_removeTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_editDept.Items.Insert(0, new ListItem("Select Department", "0"));
                term.func.fillDropdownlist(DDL_editDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                //DDL_editTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                //term.func.fillDropdownlist(DDL_editTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_editSubName.Items.Insert(0, new ListItem("Select Subject", "0"));
                DDL_removeSubName.Items.Insert(0, new ListItem("Select Subject", "0"));
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateDiv(string deptID)
        {
            ArrayList list = new ArrayList();
            String qry = "SELECT id,hasDivisions FROM cms.dept_master where id in (select id from dept_master where dept_name = @deptID);";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.CommandText = qry;
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(sdr["hasDivisions"].ToString(), sdr["id"].ToString()));
                    }
                    con.Close();
                    return list;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateStaff(string deptID)
        {
            ArrayList list = new ArrayList();
            String qry = "SELECT `id`,`name` from `cms`.`staff_master` where dept_id in (select id from dept_master where dept_name = @deptID);";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.CommandText = qry;
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(sdr["name"].ToString(), sdr["id"].ToString()));
                    }
                    con.Close();
                    return list;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateSubjects(string deptID, int semID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,sub_name from subject_master where dept_id in (select id from dept_master where dept_name = @deptID) and semester= @semID";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
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
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateClass(string deptID, int semID, String divID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id, class_name from term_master where dept_id in (select id from dept_master where dept_name = @deptID) and semester= @semID and division = @divID;";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.Parameters.AddWithValue("@semID", semID);
                    cmd.Parameters.AddWithValue("@divID", divID);
                    cmd.CommandText = qry;
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(sdr["class_name"].ToString(), sdr["id"].ToString()));
                    }
                    con.Close();
                    return list;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateStaffOfClass(string deptID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,`name` from `cms`.`staff_master` where id in (select staff_id from `cms`.`term_master` where class_name = @deptID);";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.CommandText = qry;
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(sdr["name"].ToString(), sdr["id"].ToString()));
                    }
                    con.Close();
                    return list;
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateSubjectsOfClass(string deptID)
        {
            ArrayList list = new ArrayList();
            String qry = "select id,`sub_name` from `cms`.`subject_master` where id in (select sub_id from `cms`.`term_master` where class_name = @deptID);";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
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
            }
        }

        protected void btn_addClass_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('" + DDL_addDept.SelectedItem.Text + "')</script>");
            //Response.Write("<script>alert('" + Text_Div.Text +"')</script>");
            //Response.Write("<script>alert('" + DDL_addSem.SelectedValue +"')</script>");
            //Response.Write("<script>alert('" + Text_staffName.Text +"')</script>");
            //Response.Write("<script>alert('" + Text_subName.Text +"')</script>");
            term.sem = DDL_addSem.SelectedValue;
            term.deptID = term.func.getDeptId(DDL_addDept.SelectedItem.Text);
            term.div = Text_addDiv.Text;
            term.staffID = term.func.getStaffIdFromName(Text_addStaffName.Text);
            term.subID = term.func.getSubjecId(Text_addSubName.Text);
            if (DDL_addisLab.SelectedItem.Text == "Yes")
            {
                term.isLab = 1;
            }
            else if (DDL_addisLab.SelectedItem.Text == "No")
            {
                term.isLab = 0;
            }
            term.batch = Text_addBatch.Text;
            term.year = Text_addYear.Text;
            term.class_name = Text_addClassName.Text;
            term.assignClass();
            Response.Redirect("Admin-home.aspx");
        }
    }
}