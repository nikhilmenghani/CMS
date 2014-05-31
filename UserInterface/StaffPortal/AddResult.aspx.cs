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

namespace CMS.UserInterface.StaffPortal
{
    public partial class AddResult : System.Web.UI.Page
    {
        Faculty staff = new Faculty();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                staff.deptID = staff.getDeptID(Session["UserID"].ToString());
                staff.id = staff.getID(Session["UserID"].ToString());
                staff.func.fillDropdownlist(ddlSem, "select distinct semester from term_master where staff_id = '" + staff.id + "' and dept_id = '" + staff.deptID + "';", "semester", "semester");
                //String qry = "Select * from student_master,performance_master where student_master.id = performance_master.student_id;";
                //gvResult.DataSource = staff.func.executeSelectQueryWithDT(qry);
                //gvResult.DataBind();
                //gvResult.Visible = false;
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList PopulateSubjectsOfClass(string deptID)
        {
            ArrayList list = new ArrayList();
            String qry = "select sub_name from subject_master where id in (select sub_id from term_master where staff_id = '1' and dept_id = '3' and semester = '1');";
            //String qry1 = "select id,`sub_name` from `cms`.`subject_master` where id in (select sub_id from `cms`.`term_master` where class_name = @deptID);";
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

        protected void PopulateSubjects(object sender, EventArgs e)
        {

            ddlSub.Items.Clear();
            ddlSub.Items.Insert(0, new ListItem("Select Subject", "0"));
            staff.deptID = staff.getDeptID(Session["UserID"].ToString());
            staff.id = staff.getID(Session["UserID"].ToString());
            staff.func.fillDropdownlist(ddlSub, "select id,sub_name from subject_master where id in (select sub_id from term_master where staff_id = " + staff.id + " and dept_id = " + staff.deptID + " and semester = " + ddlSem.SelectedItem.Text + ");", "id", "sub_name");    
        }

        protected void PopulateStudentsList(object sender, EventArgs e)
        {
            //ddlRegStudents.Items.Clear();
            //ddlRegStudents.Items.Insert(0, new ListItem("Select Regular Student", "0"));
            //ddlDetStudents.Items.Clear();
            //ddlDetStudents.Items.Insert(0, new ListItem("Select Detained Student", "0"));
            //ddlOtherStudents.Items.Clear();
            //ddlOtherStudents.Items.Insert(0, new ListItem("Select Other Student", "0"));
            //staff.func.fillDropdownlist(ddlRegStudents, "select id,enroll_no from student_master where id in (select student_id from result_master where new_sem = " + ddlSem.SelectedItem.Text + " and isDetained = '0');", "id", "enroll_no");
            //staff.func.fillDropdownlist(ddlDetStudents, "select id,enroll_no from student_master where id in (select student_id from result_master where new_sem = " + ddlSem.SelectedItem.Text + " and isDetained = '1');", "id", "enroll_no");
            //staff.func.fillDropdownlist(ddlOtherStudents, "select id,enroll_no from student_master where id in (select student_id from performance_master where sub_id = " + ddlSub.SelectedValue + " and hasBacklog = '1');", "id", "enroll_no");
        }

        

        protected void Btn_otherStudent_Click(object sender, EventArgs e)
        {
            GVRegularList.Visible = false;
            GVDetainList.Visible = false;
            String qry = "Select * from student_master,performance_master where student_master.id = performance_master.student_id and sub_id = '" + ddlSub.SelectedValue + "';";
            GVOtherList.DataSource = staff.func.executeSelectQueryWithDT(qry);
            GVOtherList.DataBind();
            GVOtherList.Visible = true;
        }

        protected void Btn_detStudent_Click(object sender, EventArgs e)
        {
            GVOtherList.Visible = false;
            GVRegularList.Visible = false;
            String qry = "Select * from student_master where id in (select student_id from result_master where new_sem = " + ddlSem.SelectedItem.Text + " and isDetained = '1');";
            GVDetainList.DataSource = staff.func.executeSelectQueryWithDT(qry);
            GVDetainList.DataBind();
            GVDetainList.Visible = true;
        }

        protected void Btn_regStudent_Click(object sender, EventArgs e)
        {
            
            GVDetainList.Visible = false;
            GVOtherList.Visible = false;
            String qry = "Select * from student_master where id in (select student_id from result_master where new_sem = " + ddlSem.SelectedItem.Text + " and isDetained = '0');";
            GVRegularList.DataSource = staff.func.executeSelectQueryWithDT(qry);
            GVRegularList.DataBind();
            GVRegularList.Visible = true;
        }
    }
}