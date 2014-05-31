<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master"
    AutoEventWireup="true" CodeBehind="VideoUpload.aspx.cs" Inherits="CMS.UserInterface.VirtualClassroom.VideoUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Virtual Class - Content Management System
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
        <!-- content starts -->
            <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Video Upload</a></li>
        </ul>
    </div>
        <div class="row-fluid sortable"  id="meta" runat="server">
            <div class="box span12" style="width: 70%">
                <div class="box-header well">
                    <h2>
                        <i class="icon-picture"></i>Add Videos / Class
                    </h2>
                </div>
                <div id="home"  class="box-content">
                    <form id="Form1" class="form-horizontal" runat="server">
                    <fieldset>
                       
                        <div id="addVideo" >
                        <%--<div class="control-group">
                        <label class="control-label" for="ddlClass">
                            Department</label>
                        <div class="controls">
                            <asp:DropDownList ID="ddlDept" AppendDataBoundItems="true" runat="server" data-rel="chosen">
                            </asp:DropDownList>
                        </div>
                    </div>
                        <div class="control-group">
                        <label class="control-label" for="ddlClass">
                            Semester</label>
                        <div class="controls">
                            <asp:DropDownList ID="ddlSem" AppendDataBoundItems="true" runat="server" data-rel="chosen" Onchange="PopulateSubjects();">
                            </asp:DropDownList>
                        </div>
                    </div>--%>
                        <div class="control-group">
                        <label class="control-label" for="ddlClass">
                            Class</label>
                        <div class="controls">
                            <asp:DropDownList ID="ddlClass" AppendDataBoundItems="true" runat="server" data-rel="chosen">
                            </asp:DropDownList>
                        </div>
                    </div>

                                <div class="control-group">
                                    <label class="control-label" for="focusedInput">
                                        Video Title</label>
                                    <div class="controls">
                                        <asp:TextBox ID="Text_title" class="input-xlarge focused" Enabled="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        Description</label>
                                    <div class="controls">
                                        <asp:TextBox ID="Text_description" class="input-xlarge focused" Enabled="true" TextMode="MultiLine"
                                            runat="server" Rows="6" Columns="15" />
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="focusedInput">
                                        Keywords</label>
                                    <div class="controls">
                                        <asp:TextBox ID="Text_keyword" class="input-xlarge focused" Enabled="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <asp:Button ID="Button1" class="btn btn-primary" OnClick="add_Video" OnClientClick="displayDiv();" runat="server"
                                        Text="Proceed"></asp:Button>
                                    <button class="btn">
                                        Cancel</button>
                                </div>
                            </div>
                    </fieldset>
                    </form>
                </div>
            </div>
        </div>
    <!-- content starts -->
    <div id="videoUp" class="row-fluid sortable" style="display:none" runat="server">
        <div class="box span12" style="width: 70%">
            <div class="box-header well">
                <h2>
                    <i class="icon-picture"></i>Add Videos / Class
                </h2>
            </div>
            <div class="box-content" id="div1">
                <form action="<%=urlName%>?nexturl=http://localhost:55231/UserInterface/VirtualClassroom/Success.aspx"
                class="form-horizontal" method="post" enctype="multipart/form-data">
                <div class="control-group">
                    <label class="control-label">
                        Video Input</label>
                    <div class="controls">
                        <div id="uniform-fileInput" class="uploader">
                            <input id="fileInput" class="input-file uniform_on" name="file" type="file" size="19"
                                style="opacity: 0;" />
                            <span class="filename" style="-moz-user-select: none;">No file selected</span> <span
                                class="action" style="-moz-user-select: none;">Choose File</span> -
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="hidden" name="token" value="<%=tokenValue%>" /></div>
                </div>
                <div class="form-actions">
                    <input type="submit" value="Upload" class="btn btn-primary" />
                    <button class="btn">
                        Cancel</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <%--<script type="text/javascript">
        function displayDiv() {
            document.getElementById('addVideo').style.display = "none";
            document.getElementById('videoUp').style.display = "block";
            alert("trigerred");
        }
    </script>
     <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("attendance.aspx")%>'
        function PopulateSubjects() {
            $("#<%=ddlSub.ClientID%>").attr("disabled", "disabled");
             if ($('#<%=ddlSem.ClientID%>').val() == "0") {
                 $('#<%=ddlSub.ClientID %>').empty().append('<option selected="selected" value="0">Please select</option>');
             }
             else {
                 $('#<%=ddlSub.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                 var sem_id = '{semID:"' + $('#<%=ddlSem.ClientID%> option:selected').html() + '"}';
            
                 $.ajax({
                     type: "POST",
                     url: pageUrl + '/PopulateSubjects',
                     data: sem_id,
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         PopulateControl(response.d, $("#<%=ddlSub.ClientID %>"));
                     },
                     failure: function (response) {
                         alert(response.d);
                     }
                 });
             }
         }
          </script>

         <script type="text/javascript">
        function PopulateControl(list, control) {
            if (list.length > 0) {
                control.removeAttr("disabled");
                control.empty().append('<option selected="selected" value="0">Please select</option>');
                $.each(list, function () {
                    control.append($("<option></option>").val(this['Value']).html(this['Text']));
                });
            }
            else {
                control.empty().append('<option selected="selected" value="0">Not available<option>');
            }
        }
    </script>--%>
</asp:Content>
