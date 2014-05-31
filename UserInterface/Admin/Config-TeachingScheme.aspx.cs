using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic;

namespace CMS.UserInterface.Admin
{
    public partial class Config_TeachingScheme : System.Web.UI.Page
    {
        TeachingScheme ts = new TeachingScheme();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DDL_editTSTitle.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                ts.func.fillDropdownlist(DDL_editTSTitle, "select id,scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");
                DDL_removeTSTitle.Items.Insert(0, new ListItem("Select Teaching Scheme", "0"));
                ts.func.fillDropdownlist(DDL_removeTSTitle, "select id,scheme_name from `cms`.`teaching_scheme_master`;", "id", "scheme_name");
            }
        }

        protected void btn_addTS_Click(object sender, EventArgs e)
        {
            ts.teachingSchemeTitle = Text_addTSTitle.Text;
            ts.labHours = Text_addLabHours.Text;
            ts.lecHours = Text_addLecHours.Text;
            ts.IntMarks = Text_addIntMarks.Text;
            ts.ExtMarks = Text_addExtMarks.Text;
            ts.vivaMarks = Text_addVivaMarks.Text;
            ts.addTeachingScheme();
            Response.Redirect("Admin-home.aspx");
        }

        protected void DDL_editTSTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            ts.fetchTeachingSchemeDetails(DDL_editTSTitle.SelectedItem.Text);
            Text_editLabHours.Text = ts.labHours;
            Text_editLecHours.Text = ts.lecHours;
            Text_editIntMarks.Text = ts.IntMarks;
            Text_editExtMarks.Text = ts.ExtMarks;
            Text_editVivaMarks.Text = ts.vivaMarks;
        }

        protected void DDL_removeTSTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            ts.fetchTeachingSchemeDetails(DDL_removeTSTitle.SelectedItem.Text);
            Text_removeLabHours.Text = ts.labHours;
            Text_removeLecHours.Text = ts.lecHours;
            Text_removeIntMarks.Text = ts.IntMarks;
            Text_removeExtMarks.Text = ts.ExtMarks;
            Text_removeVivaMarks.Text = ts.vivaMarks;
        }

        protected void btn_editTS_Click(object sender, EventArgs e)
        {
            ts.labHours = Text_editLabHours.Text;
            ts.lecHours = Text_editLecHours.Text;
            ts.IntMarks = Text_editIntMarks.Text;
            ts.ExtMarks = Text_editExtMarks.Text;
            ts.vivaMarks = Text_editVivaMarks.Text;
            ts.updateTeachingScheme(DDL_editTSTitle.SelectedItem.Text);
            Response.Redirect("Admin-home.aspx");
        }

        protected void Btn_removeTS_Click(object sender, EventArgs e)
        {
            ts.removeTeachingScheme(DDL_removeTSTitle.SelectedItem.Text);
            Response.Redirect("Admin-home.aspx");
        }
    }
}