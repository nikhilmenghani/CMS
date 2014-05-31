﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.Logic.VirtualClassroom;
using CMS.Logic;

namespace CMS.UserInterface.VirtualClassroom
{
    public partial class Success : System.Web.UI.Page
    {

        VideoUploadFunc vupf = new VideoUploadFunc();
        Functions func = new Functions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request.QueryString["status"] != null)
            {
                
                String status = Page.Request.QueryString[0];
               // Page.Request.QueryString["thumbnail"];
                String title = Session["VideoTitle"].ToString();
                String description = Session["VideoDescription"].ToString();
                String key=Page.Request.QueryString["id"];
                String staffid = func.getStaffId(Session["UserID"].ToString());
                String classid = Session["ClassId"].ToString();
                String thumbnail = "http://img.youtube.com/vi/"+key+"/mqdefault.jpg";
                
                int statusCode = Int32.Parse(status);
                if (statusCode == 200)
                {
                    vupf.addInVideoMaster(title,classid,key,description,thumbnail,staffid);
                    status_text.Text = "Upload Successful with status : " + statusCode;
                    video_key.Text = "Video Key : " + key;
                    info.Text = "Please be patient as youtube processes the video. It will be available after 1 min.";
                }
                else
                {
                    status_text.Text = "Upload unsuccessful with status : " + statusCode;
                    video_key.Attributes.Add("style", "display:none");
                    status_code.Attributes.Add("style", "display:none");
                    info.Attributes.Add("style", "display:none");
                }
            }
            else
            {
                status_text.Text = "Please Upload The Video First!!";
            }
            
        }
    }
}