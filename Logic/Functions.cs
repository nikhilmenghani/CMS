using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using CMS.Logic;
using CMS.Logic.Database;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Collections;

namespace CMS.Logic
{
    public class Functions : DBConnect
    {
        //DBConnect dbc;
        public DataTable dt, dt1, dt2;
        public Functions()
        {
            //dbc = new DBConnect();
        }
        public void fillDropdownlist(DropDownList ddl, String qry, String id, String title)
        {
            this.dt = executeSelectQueryWithDT(qry);
            ddl.DataSource = dt;
            ddl.DataValueField = id;
            ddl.DataTextField = title;
            ddl.DataBind();
        }
        public void fillDropdownlistWithDT(DropDownList ddl, DataTable dt, String id, String title)
        {
            ddl.DataSource = dt;
            ddl.DataValueField = id;
            ddl.DataTextField = title;
            ddl.DataBind();
        }

        public ArrayList fillArrayList(DataTable dtinfo, String colname)
        {
            ArrayList arrlst = new ArrayList();
            for (int i = 0; i < dtinfo.Rows.Count; i++)
            {
                arrlst.Add(dtinfo.Rows[i][colname]);
            }
            return arrlst;
        }

        public String getDeptName(String deptID)
        {
            string qry = "SELECT id,dept_name FROM dept_master";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["dept_name"].ToString();
        }

        public String getSubjecId(String subName)
        {
            string qry = "select ID from `subject_master` where sub_name = '" + subName + "'";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }
        public String getStaffIdFromName(String name)
        {
            string qry = "select ID from `staff_master` where `name` = '" + name + "'";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }


        public DataTable getDeptName()
        {
            string qry = "SELECT id,dept_name FROM dept_master";
            dt = executeSelectQueryWithDT(qry);
            return dt;

        }
        public DataTable getSubId(String staff_id)
        {
            String qry = "Select id,sub_id from term_master where staff_id = '" + staff_id + "' ";
            dt = executeSelectQueryWithDT(qry);
            return dt;
        }

        public String getStaffId(String username)
        {
            string qry = "select ID from `staff_master` where email_id = '" + username + "'";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }
        public String getDeptId(String dept_name)
        {
            string qry = "SELECT id FROM cms.dept_master where dept_name = '" + dept_name + "';";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }
        public String getClassId(String class_name)
        {
            string qry = "SELECT id FROM `virtualclass_master` where title = '" + class_name + "'";
            dt = executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }


        public DataTable getSubjectName(DataTable dtsi, String refercol)
        {
            DataTable subdt = new DataTable();
            subdt.Columns.Add("id");
            subdt.Columns.Add("sub_name");
            for (int i = 0; i < dtsi.Rows.Count; i++)
            {
                string qry = "SELECT id,sub_name FROM subject_master Where id='" + dtsi.Rows[i][refercol] + "'  ";
                dt = executeSelectQueryWithDT(qry);
                subdt.Rows.Add(dt.Rows[0]["id"].ToString(), dt.Rows[0]["sub_name"].ToString());
            }
            return subdt;
        }

        public DataTable getStaffName(DataTable dtsi, String refercol)
        {
            DataTable subdt = new DataTable();
            subdt.Columns.Add("ID");
            subdt.Columns.Add("staff_name");
            for (int i = 0; i < dtsi.Rows.Count; i++)
            {

                string qry = "SELECT ID,name FROM staff_master Where id='" + dtsi.Rows[i][refercol] + "'  ";
                dt = executeSelectQueryWithDT(qry);
                subdt.Rows.Add(dt.Rows[0]["ID"].ToString(), dt.Rows[0]["name"].ToString());
            }
            return subdt;
        }


        public DataTable getContent(DataTable base_dt, String refercol)
        {
            DataTable contentDT = new DataTable();
            contentDT.Columns.Add("ID");
            contentDT.Columns.Add("title");
            contentDT.Columns.Add("by_staff_id");
            contentDT.Columns.Add("class_id");
            contentDT.Columns.Add("pathValue");
            for (int i = 0; i < base_dt.Rows.Count; i++)
            {
                string qry = "SELECT * FROM file_master Where class_id='" + base_dt.Rows[i][refercol] + "'  ";
                dt = executeSelectQueryWithDT(qry);
                contentDT.Rows.Add(i, dt.Rows[i]["title"].ToString(), dt.Rows[i]["by_staff_id"].ToString(), dt.Rows[i]["class_id"].ToString(), dt.Rows[i]["path_value"].ToString());
            }
            return contentDT;
        }

        public DataTable DtToDt(DataTable base_dt, DataTable staff_db, DataTable class_db)
        {
            DataTable contentDT = new DataTable();
            contentDT.Columns.Add("ID");
            contentDT.Columns.Add("title");
            contentDT.Columns.Add("addedby_staff");
            contentDT.Columns.Add("className");
            contentDT.Columns.Add("pathValue");
            for (int i = 0; i < base_dt.Rows.Count; i++)
            {
                contentDT.Rows.Add(i, base_dt.Rows[i]["title"].ToString(), staff_db.Rows[i]["staff_name"].ToString(), class_db.Rows[i]["sub_name"].ToString(), base_dt.Rows[i]["path_value"].ToString());
            }
            return contentDT;
        }

        public DataTable selectTopEntry(DataTable baseDT, Int32 limit)
        {
            DataTable topEntry = baseDT.Clone();
            if (baseDT.Rows.Count > limit)
            {
                for (int i = 0; i < limit; i++)
                {
                    topEntry.ImportRow(baseDT.Rows[i]);
                }
                return topEntry;
            }
            else
                return baseDT;

        }

    }
}