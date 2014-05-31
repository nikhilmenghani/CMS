using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CMS.Logic
{
    public class TeachingScheme
    {
        public String teachingSchemeTitle;
        public String teachingSchemeId;
        public String lecHours;
        public String labHours;
        public String IntMarks;
        public String ExtMarks;
        public String vivaMarks;
        public Functions func = new Functions();
        public void addTeachingScheme()
        {
            String qry = "INSERT INTO `cms`.`teaching_scheme_master` (`scheme_name`, `viva_marks`, `lec_hour`, `lab_hr`, `int_marks`, `ext_marks`) VALUES ('" + teachingSchemeTitle + "', '" + vivaMarks + "', '" + lecHours + "', " +
            "'" + labHours + "', '" + IntMarks + "', '" + ExtMarks + "');";
            func.executeIUDQuery(qry);
        }
        public void fetchAllTeachingSchemeDetails()
        {
            String qry = "SELECT * from `cms`.`teaching_scheme_master`;";
            DataTable dt = new DataTable();
            dt = func.executeSelectQueryWithDT(qry);
            if (dt.Rows.Count > 0)
            {
                this.teachingSchemeId = dt.Rows[0]["id"].ToString();
                this.teachingSchemeTitle = dt.Rows[0]["scheme_name"].ToString();
                this.labHours = dt.Rows[0]["lab_hr"].ToString();
                this.lecHours = dt.Rows[0]["lec_hour"].ToString();
                this.IntMarks = dt.Rows[0]["int_marks"].ToString();
                this.ExtMarks = dt.Rows[0]["ext_marks"].ToString();
                this.vivaMarks = dt.Rows[0]["viva_marks"].ToString();
            }
        }
        public void fetchTeachingSchemeDetails(String scheme)
        {
            String qry = "SELECT * from `cms`.`teaching_scheme_master` where scheme_name = '" + scheme + "';";
            DataTable dt = new DataTable();
            dt = func.executeSelectQueryWithDT(qry);
            if (dt.Rows.Count > 0)
            {
                this.teachingSchemeId = dt.Rows[0]["id"].ToString();
                this.labHours = dt.Rows[0]["lab_hr"].ToString();
                this.lecHours = dt.Rows[0]["lec_hour"].ToString();
                this.IntMarks = dt.Rows[0]["int_marks"].ToString();
                this.ExtMarks = dt.Rows[0]["ext_marks"].ToString();
                this.vivaMarks = dt.Rows[0]["viva_marks"].ToString();
            }
        }
        public void fetchTeachingSchemeId(String scheme_name)
        {
            String qry = "Select id from `cms`.`teaching_scheme_master` where scheme_name = '" + scheme_name + "';";
            DataTable dt = new DataTable();
            dt = func.executeSelectQueryWithDT(qry);
            if (dt.Rows.Count > 0)
            {
                this.teachingSchemeId = dt.Rows[0]["id"].ToString();
            }
        }
        public String getTeachingSchemeId(String scheme_name)
        {
            String qry = "Select id from `cms`.`teaching_scheme_master` where scheme_name = '" + scheme_name + "';";
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
        public String getTeachingSchemeName(String scheme_id)
        {
            String qry = "Select scheme_name from `cms`.`teaching_scheme_master` where id = '" + scheme_id + "';";
            DataTable dt = new DataTable();
            dt = func.executeSelectQueryWithDT(qry);
            if (dt.Rows.Count > 0)
            {
                return dt.Rows[0]["scheme_name"].ToString();
            }
            else
            {
                return "";
            }
        }

        public void updateTeachingScheme(String scheme_name)
        {
            String qry = "UPDATE `cms`.`teaching_scheme_master` SET `viva_marks`='" + this.vivaMarks + "', `lec_hour`='" + this.lecHours + "', `lab_hr`='" + this.labHours + "', `int_marks`='" + this.IntMarks + "', `ext_marks`='" + this.ExtMarks + "' WHERE `id`='" + getTeachingSchemeId(scheme_name) + "';";
            func.executeIUDQuery(qry);
        }

        public void removeTeachingScheme(String scheme_name)
        {
            String qry = "DELETE FROM `cms`.`teaching_scheme_master` WHERE `id`='" + getTeachingSchemeId(scheme_name) + "';";
            func.executeIUDQuery(qry);
        }
    }
}