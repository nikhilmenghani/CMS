<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="CMS.UserInterface.VirtualClassroom.attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Attendance</a></li>
        </ul>
    </div>
    <div class="row-fluid sortable" style="display: block" id="meta" runat="server">
        <div class="box span12" style="width: 70%">
            <div class="box-header well">
                <h2>
                    <i class="icon-picture"></i>Take Attendance
                </h2>
            </div>
            <div id="home" class="box-content">
                <form id="Form1" class="form-horizontal" runat="server">
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label">
                                Department</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlDepart" AppendDataBoundItems="true" runat="server" data-rel="chosen">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Semester</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlSem" AutoPostBack="false" AppendDataBoundItems="true" runat="server" data-rel="chosen" Onchange="PopulateSubjects();PopulateDiv();">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Subject</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlSub" AppendDataBoundItems="true" runat="server" data-rel="chosen">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Division</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlDiv" AppendDataBoundItems="true" runat="server" data-rel="chosen">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                &nbsp;&nbsp;Is Lab</label>
                            <div class="controls">
                                <asp:CheckBox ID="Check_IL" runat="server" onclick="PopulateBatch(this);"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">
                                Batch</label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlBatch" AppendDataBoundItems="true" runat="server" data-rel="chosen" Enabled="false">
                                <asp:ListItem Value="">Select Batch</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="focusedInput">
                                Date</label>
                            <div class="controls">
                                <input id="Text_date" class="input-xlarge datepicker hasDatepicker" type="text" value="02/16/12"></input></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="focusedInput">
                                Time</label>
                            <div class="controls">
                                <asp:TextBox ID="TextBox1" class="input-xlarge focused" Enabled="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-actions">
                            <asp:Button ID="Submit" Text="Submit" class="btn btn-primary"
                                runat="server" />
                            <button class="btn">
                                Cancel</button>
                            <br />

                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
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
            var pageUrl = '<%=ResolveUrl("attendance.aspx")%>'
            function PopulateDiv() {
                $("#<%=ddlDiv.ClientID%>").attr("disabled", "disabled");
                if ($('#<%=ddlSem.ClientID%>').val() == "0") {
                    $('#<%=ddlDiv.ClientID %>').empty().append('<option selected="selected" value="0">Please select</option>');
                }
                else {
                    $('#<%=ddlDiv.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                    var sem_id = '{semID:"' + $('#<%=ddlSem.ClientID%> option:selected').html() + '"}';

                    $.ajax({
                        type: "POST",
                        url: pageUrl + '/PopulateDiv',
                        data: sem_id,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            PopulateControl(response.d, $("#<%=ddlDiv.ClientID %>"));
                        },
                        failure: function (response) {
                            alert(response.d);
                        }
                    });
                }
            }

    </script>
    <script type="text/javascript">
    function PopulateBatch(sender)
    {
        var ismember = sender.checked;
        alert(ismember);
        if (ismember == true) {
            document.getElementById('<%= ddlBatch.ClientID %>').disabled = !ismember;
        }
        else {
            document.getElementById('<%= ddlBatch.ClientID %>').disabled =ismember;
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
    </script>
</asp:Content>

