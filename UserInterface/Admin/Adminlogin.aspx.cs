using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic.Login;

namespace CMS.UserInterface.Admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        LoginTasks loginTasks;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            loginTasks = new LoginTasks();
            if (loginTasks.checkAdminLogin(username.Text, pwd.Text))
            {
                Response.Redirect("Admin-home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid UserName or Password')</script>");
            }
        }
    }
}