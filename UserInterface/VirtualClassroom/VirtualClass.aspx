<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master"
    EnableEventValidation="false" AutoEventWireup="true" CodeBehind="VirtualClass.aspx.cs"
    Inherits="CMS.UserInterface.VirtualClassroom.VirtualClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Virtual Class - Content Management System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Virtual Class</a></li>
        </ul>
    </div>
    <form id="form1" runat="server" class="form-horizontal">
        <fieldset>
            <div id="firstDiv" class="row-fluid sortable ui-sortable">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2>
                            <i class="icon-edit"></i>Form Elements
                        </h2>
                    </div>
                    <div class="box-content">
                        <div class="row-fluid">
                            <div class="span3">
                                <div class="control-group">
                                    <div class="controls">
                                        <h6>Select Department
                                        </h6>
                                        <asp:DropDownList ID="ddlDept" AutoPostBack="true" date-rel="chosen" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="LoadSemesters" Style="width: auto;">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <asp:ScriptManager ID="ScriptManager1" runat="server" />
                            <div class="span3">
                                <div class="control-group">
                                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlDept" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div class="controls">
                                                <h6>Select Semester
                                                </h6>
                                                <asp:DropDownList ID="ddlSem" Style="width: auto;" AutoPostBack="true" data-rel="chosen" class="input-large span10 chzn-done" runat="server" OnSelectedIndexChanged="LoadClasses">
                                                </asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="span3">
                                <div class="control-group">
                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlSem" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div class="controls">
                                                <h6>Select Class
                                                </h6>
                                                <asp:DropDownList ID="ddlClass" Enabled="true" AutoPostBack="true" date-rel="chosen" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                </asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="span3">
                                <div class="control-group">
                                    <div class="controls">
                                        <h6>Load Videos?
                                        </h6>
                                        <asp:Button ID="BTNloadVideos" Text="Okay! Load Videos" OnClick="LoadVideos" class="btn btn-primary" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/span-->
            </div>
            <div id="home" style="display: none" class="row-fluid sortable">
                <div class="box span12">
                    <div class="box-header well">
                        <h2>
                            <i class="icon-picture"></i>
                            &nbsp;&nbsp;Title Of Virtual Class Here
                        </h2>
                    </div>
                    <div class="box-content">
                        <div class="row-fluid show-grid">
                            <div class="span5" style="width: initial">
                                <div id="Div1" style="width: 640px;">
                                    <iframe id="play" class="youtube-player" width="640" height="385" src="<%=defaultKey %>"
                                        frameborder="0"></iframe>
                                </div>
                            </div>
                            <div id="player_content" class="span4">
                                <%=defaultDescription %><br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="thirdDiv" class="sortable row-fluid ui-sortable" runat="server">
                <div class="box span12">
                    <div class="box-header well">
                        <h2>Uploaded Videos</h2>
                        <div class="box-icon">
                        </div>
                    </div>
                    <div class="box-content">
                        <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BTNloadVideos" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:DataList ID="DL1" RepeatDirection="Horizontal" RepeatColumns="4" runat="server"
                                    EnableViewState="false">
                                    <ItemTemplate>
                                        <div class="span4" style="width: 100%">
                                            <div style="text-align:center"><b><%# Eval("title") %></div></b>
                                            <div>
                                                <a href='javascript:refreshIframe("<%# Eval("path_value") %>","<%# Eval("description") %>")' id='<%# Eval("id") %>' onclick="refreshIframe();">
                                                    <img style="width: 200px; height: 170px; border: 2px" width="120" alt="" src="<%# Eval("thumbnail_path") %>" />
                                                </a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div id="FourthDiv" class="sortable row-fluid ui-sortable" runat="server">
                <div class="box span12">
                    <div class="box-header well" data-original-title="">
                        <h2>Uploaded Files</h2>
                        <div class="box-icon">
                        </div>
                    </div>
                    <div class="box-content">
                        <asp:Repeater runat="server" ID="repeater2">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                </br><h4>
                                    <a href="#"><i class="icon-hand-right"></i>&nbsp;&nbsp;
                                    <%#Eval("title").ToString() %></a></h4>
                                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;is uploaded by&nbsp;&nbsp;<strong><%#Eval("addedby_staff").ToString() %></strong>&nbsp;&nbsp;in
                            class&nbsp;&nbsp;<strong><%#Eval("className").ToString() %></strong><br />
                                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;To Download please click here&nbsp;&nbsp;
                            <asp:Button ID="Button1" class="btn btn-primary" OnClick="dwnld_click" CommandArgument='<%#Eval("pathValue") %>'
                                runat="server" Text="Download"></asp:Button></br>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
    <script type="text/javascript">
        function refreshIframe(link, desc) {
            document.getElementById('home').style.display = 'block';
            var str = "http://www.youtube.com/embed/" + link;
            var description = desc;
            document.getElementById('play').src = str;
            document.getElementById("player_content").innerHTML = description;
            //document.getElementById('iframeID').contentWindow.location.reload();
        }
    </script>
</asp:Content>
