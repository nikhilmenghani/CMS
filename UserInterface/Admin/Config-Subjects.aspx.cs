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
    public partial class Config_subjects : System.Web.UI.Page
    {
        Subjects sub = new Subjects();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DDL_addDept.Items.Insert(0, new ListItem("Select Department", "0"));
                sub.func.fillDropdownlist(DDL_addDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                DDL_addTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                sub.func.fillDropdownlist(DDL_addTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_removeDept.Items.Insert(0, new ListItem("Select Department", "0"));
                sub.func.fillDropdownlist(DDL_removeDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                DDL_removeTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                sub.func.fillDropdownlist(DDL_removeTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_editDept.Items.Insert(0, new ListItem("Select Department", "0"));
                sub.func.fillDropdownlist(DDL_editDept, "SELECT id, dept_name from `cms`.`dept_master`;", "id", "dept_name");
                DDL_editTS.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                sub.func.fillDropdownlist(DDL_editTS, "SELECT id, scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");

                DDL_editSubName.Items.Insert(0, new ListItem("Select Subject", "0"));
                DDL_removeSubName.Items.Insert(0, new ListItem("Select Subject", "0"));
            }
        }

        protected void btn_addSub_Click(object sender, EventArgs e)
        {
            sub.subName = Text_subName.Text;
            sub.subCode = Text_addSubCode.Text;
            sub.subDeptId = sub.func.getDeptId(DDL_addDept.SelectedItem.Text);
            sub.subSem = DDL_addSem.SelectedValue;
            sub.subCredits = Text_addSubCredits.Text;
            sub.teachingSchemeId = sub.getTeachingSchemeId(DDL_addTS.SelectedItem.Text);
            if (DDL_addisIE.SelectedItem.Text.Equals("Yes"))
            {
                sub.isIE = 1;
            }
            else
            {
                sub.isIE = 0;
            }
            sub.addSubject();
            Response.Redirect("Admin-home.aspx");
        }

        protected void btn_editSub_Click(object sender, EventArgs e)
        {
            sub.subCode = Text_editSubCode.Text;
            sub.subDeptId = sub.func.getDeptId(DDL_editDept.SelectedItem.Text);
            sub.subSem = DDL_editSem.SelectedValue;
            sub.subCredits = Text_editSubCredits.Text;
            sub.teachingSchemeId = sub.getTeachingSchemeId(DDL_editTS.SelectedItem.Text);
            if (DDL_editisIE.SelectedItem.Text.Equals("Yes"))
            {
                sub.isIE = 1;
            }
            else if (DDL_editisIE.SelectedItem.Text.Equals("No"))
            {
                sub.isIE = 0;
            }
            sub.subName = Text_tempSubName.Text;
            //Response.Write("<script>alert('" + sub.teachingSchemeId + "')</script>");
            sub.updateSubject(sub.subName);
            Response.Redirect("Admin-home.aspx");
        }

        protected void btn_removeSub_Click(object sender, EventArgs e)
        {
            sub.subName = Text_tempSubName.Text;
            sub.removeSubject(sub.subName);
            Response.Redirect("Admin-home.aspx");
        }

        protected void DDL_removeSubName_SelectedIndexChanged(object sender, EventArgs e)
        {
            Text_removeSubCode.Text = sub.subCode;
            DDL_removeDept.SelectedItem.Text = sub.func.getDeptName(sub.subDeptId);
            DDL_removeSem.SelectedValue = sub.subSem;
            Text_removeSubCredits.Text = sub.subCredits;
            DDL_removeTS.SelectedItem.Text = sub.getTeachingSchemeName(sub.teachingSchemeId);
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
        public static ArrayList FillSubDetails(string deptID, int semID, string subID)
        {
            ArrayList list = new ArrayList();

            String qry = "select subject_master.id, isIE, sub_code, credits, scheme_name from subject_master,teaching_scheme_master where dept_id in (select id from dept_master where dept_name = @deptID) and semester= @semID and sub_name = @subID and subject_master.teaching_scheme_id = teaching_scheme_master.id;";
            using (MySqlConnection con = new MySqlConnection(new DBConnect()._conStr))
            {
                using (MySqlCommand cmd = new MySqlCommand(qry, con))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@deptID", deptID);
                    cmd.Parameters.AddWithValue("@semID", semID);
                    cmd.Parameters.AddWithValue("@subID", subID);
                    cmd.CommandText = qry;
                    cmd.Connection = con;
                    con.Open();
                    MySqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(sdr["sub_code"].ToString(), sdr["id"].ToString()));
                        list.Add(new ListItem(sdr["credits"].ToString(), sdr["id"].ToString()));
                        list.Add(new ListItem(sdr["isIE"].ToString(), sdr["id"].ToString()));
                        list.Add(new ListItem(sdr["scheme_name"].ToString(), sdr["id"].ToString()));
                    }
                    con.Close();
                    return list;
                }
            }
        }

    }
}