using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CMS.Logic
{
    public class Subjects : TeachingScheme
    {
        public String subID;
        public String subName;
        public String subCode;
        public String subDeptName;
        //String teachingSchemeTitle;
        public String subCredits;
        public String subDeptId;
        public String subSem;
        //int teachingSchemeId;
        public byte isIE;

        public void addSubject()
        {
            String qry = "INSERT INTO `cms`.`subject_master` (`teaching_scheme_id`, `sub_name`, `sub_code`, `dept_id`, `semester`, `credits`, `isIE`) VALUES " +
                "('" + this.teachingSchemeId + "', '" + this.subName + "', '" + this.subCode + "', '" + this.subDeptId + "', '" + this.subSem + "', '" + this.subCredits + "', '" + this.isIE + "');";
            func.executeIUDQuery(qry);
        }

        public void updateSubject(String subjectName)
        {
            String qry = "UPDATE `cms`.`subject_master` SET `teaching_scheme_id`='" + this.teachingSchemeId + "', `sub_code`='" + this.subCode + "', `credits`='" + this.subCredits + "', `isIE`='" + this.isIE + "' WHERE `id`='" + getSubjectID(subjectName) + "';";
            func.executeIUDQuery(qry);
        }

        public void removeSubject(String subjectName)
        {
            String qry = "DELETE FROM `cms`.`subject_master` WHERE `id`='" + getSubjectID(subjectName) + "';";
            func.executeIUDQuery(qry);
        }

        public String getSubjectID(String sub_name)
        {
            String qry = "Select id from `cms`.`subject_master` where sub_name = '" + sub_name + "';";
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