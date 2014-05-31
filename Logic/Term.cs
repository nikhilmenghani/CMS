using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CMS.Logic
{
    public class Term
    {
        public String termID;
        public String staffID;
        public String deptID;
        public String sem;
        public String class_name;
        public String subID;
        public String batch;
        public String div;
        public String year;
        public byte isLab;

        public Functions func = new Functions();

        public void assignClass()
        {
            String qry = "INSERT INTO `cms`.`term_master` (`sub_id`, `staff_id`, `dept_id`, `semester`, `class_name`, `division`, `isLab`, `Batch`, `year`) VALUES ('" + this.subID+ "', '" + this.staffID + "', '" + this.deptID + "', '" + this.sem + "', '" + this.class_name + "', '" + this.div + "', '" + this.isLab +"', '" + this.batch + "', '" + this.year + "');";
            func.executeIUDQuery(qry);
        }

        public void updateClass(String className)
        {
            String qry = "UPDATE `cms`.`term_master` SET `sub_id` = '" + this.subID + "', `staff_id` = '" + this.staffID + "', `isLab` = '" + this.isLab + "', `Batch` = '" + this.batch + "', `year` = '" + this.year +"' WHERE `class_name` = '" + className +"';";
            func.executeIUDQuery(qry);
        }

        public void removeClass(String className)
        {
            String qry = "DELETE from `cms`.`term_master` where `class_name` = '" + this.getClassId(className) + "'";
            func.executeIUDQuery(qry);
        }

        public String getClassId(String className)
        {
            String qry = "SELECT id from `cms`.term_master` where `class_name` = '" + className + "'";
            DataTable dt = new DataTable();
            dt = func.executeSelectQueryWithDT(qry);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["id"].ToString();
            }
            else
            {
                return "";
            }
        }
    }
}