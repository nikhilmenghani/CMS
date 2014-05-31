using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CMS.Logic
{
    public class Faculty
    {
        public String id;
        public String deptID;
        public String deptName;
        public String email_id;

        public Functions func = new Functions();
        
        public String getDeptID(String username)
        {
            DataTable dt = new DataTable();
            String qry = "SELECT dept_id FROM cms.staff_master where email_id = '" + username + "';";
            dt = func.executeSelectQueryWithDT(qry);
            return dt.Rows[0]["dept_id"].ToString();
        }

        public String getDeptName(String username)
        {
            DataTable dt = new DataTable();
            String qry = "SELECT dept_name from dept_master where id in (select dept_id FROM cms.staff_master where email_id = '" + username + "');";
            dt = func.executeSelectQueryWithDT(qry);
            return dt.Rows[0]["dept_name"].ToString();
        }

        public String getID(String username)
        {
            DataTable dt = new DataTable();
            String qry = "SELECT id FROM cms.staff_master where email_id = '" + username + "';";
            dt = func.executeSelectQueryWithDT(qry);
            return dt.Rows[0]["id"].ToString();
        }
    }
}