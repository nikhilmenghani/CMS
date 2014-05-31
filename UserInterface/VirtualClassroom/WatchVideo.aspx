<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master" AutoEventWireup="true" CodeBehind="WatchVideo.aspx.cs" Inherits="CMS.UserInterface.VirtualClassroom.WatchVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Watch Video</a></li>
        </ul>
    </div>
    <div id="secDiv" class="row-fluid sortable ui-sortable" >
        <div class="box span9" style="width:70%;">
            <div class="box-header well" data-original-title="">
                <h2>
                   Watch Video
                </h2>
            </div>
            <div class="box-content">
                <div id="player">
                <iframe id="frame1" width="700" height="400" src='"https://www.youtube.com/embed/"+<%=key %>' frameborder="0" allowfullscreen="true" runat="server"></iframe>
                </div>
            </div>
        </div>
        <!--/span-->
        <div class="box span3" style="width:27%;">
            <div class="box-header well" data-original-title="">
                <h3>
                   Description
                </h3>
         
            </div>
            <div class="box-content"><%--<%=dt.Rows[0]["description"].ToString() %>--%>
                You can read description of video which you have seen besides this span...<br/><br/>Notepad++ v6.4.2 new features and bug fixes:<br>

1.  Fix localization regressions.<br>
2. Make "Begin/End Select" Command recordable in macro.<br>
3. Enhance the delimiter selection(Ctrl + double click) feature.<br>
4. Fix Find/Replace dialog status bar overwriting memory problem.<br>
5. Fix Run dialog doesn't work with spaces in path.<br>
6. Fix "Find all in current document" asking for creating a new file bug (regression).<br>
7. Fix localization regressions.<br>
8. Make "Begin/End Select" Command recordable in macro.<br>
            </div>
        </div>
       
    </div>
</asp:Content>

