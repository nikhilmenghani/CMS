<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/UserInterface/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Config-Subjects.aspx.cs" Inherits="CMS.UserInterface.Admin.Config_subjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Add/Remove Subjects
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="form" runat="server">
    <div class="row-fluid sortable" style="display: block" id="meta" runat="server">
        <div class="box span12" style="width: 70%">
            <div class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;Configure Subjects
                </h2>
            </div>
            <div id="home" class="box-content">
                <form id="subjectForm" class="form-horizontal" runat="server">
                    <fieldset>
                        <div class="clearfix">
                        </div>
                        <br />
                        <div class="box-content">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active"><a href="#addSub">Add Subject</a></li>
                                <li><a href="#editSub">Update Subject</a></li>
                                <li><a href="#removeSub">Remove Subject</a></li>
                            </ul>
                            <div class="tab-content" id="myTabContent" style="overflow: visible">
                                <div id="addSub" class="tab-pane active">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_subName" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Code
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addSubCode" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Department
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addDept" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addSem" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="">Select Semester</asp:ListItem>
                                                <asp:ListItem Value="1">Sem-1</asp:ListItem>
                                                <asp:ListItem Value="2">Sem-2</asp:ListItem>
                                                <asp:ListItem Value="3">Sem-3</asp:ListItem>
                                                <asp:ListItem Value="4">Sem-4</asp:ListItem>
                                                <asp:ListItem Value="5">Sem-5</asp:ListItem>
                                                <asp:ListItem Value="6">Sem-6</asp:ListItem>
                                                <asp:ListItem Value="7">Sem-7</asp:ListItem>
                                                <asp:ListItem Value="8">Sem-8</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Credits
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addSubCredits" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addTS" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Elective</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addisIE" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_addSub" class="btn-inverse" runat="server" OnClick="btn_addSub_Click" Text="Add Subject" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="editSub" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editSem" runat="server" AppendDataBoundItems="true" onchange="PopulateSubjectsToEdit();">
                                                <asp:ListItem Value="">Select Semester</asp:ListItem>
                                                <asp:ListItem Value="1">Sem-1</asp:ListItem>
                                                <asp:ListItem Value="2">Sem-2</asp:ListItem>
                                                <asp:ListItem Value="3">Sem-3</asp:ListItem>
                                                <asp:ListItem Value="4">Sem-4</asp:ListItem>
                                                <asp:ListItem Value="5">Sem-5</asp:ListItem>
                                                <asp:ListItem Value="6">Sem-6</asp:ListItem>
                                                <asp:ListItem Value="7">Sem-7</asp:ListItem>
                                                <asp:ListItem Value="8">Sem-8</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Department
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editDept" runat="server" AppendDataBoundItems="true" onchange="PopulateSubjectsToEdit();">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editSubName" runat="server" AppendDataBoundItems="true" onchange="FillSubjectDetailsToEdit();">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group" style="display: none">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_tempSubName" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Code
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_editSubCode" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Credits
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_editSubCredits" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editTS" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Elective</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editisIE" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_editSub" class="btn-inverse" runat="server" OnClick="btn_editSub_Click" Text="Update Subject" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="removeSub" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeSem" runat="server" AppendDataBoundItems="true" onchange="PopulateSubjectsToRemove();">
                                                <asp:ListItem Value="">Select Semester</asp:ListItem>
                                                <asp:ListItem Value="1">Sem-1</asp:ListItem>
                                                <asp:ListItem Value="2">Sem-2</asp:ListItem>
                                                <asp:ListItem Value="3">Sem-3</asp:ListItem>
                                                <asp:ListItem Value="4">Sem-4</asp:ListItem>
                                                <asp:ListItem Value="5">Sem-5</asp:ListItem>
                                                <asp:ListItem Value="6">Sem-6</asp:ListItem>
                                                <asp:ListItem Value="7">Sem-7</asp:ListItem>
                                                <asp:ListItem Value="8">Sem-8</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Department
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeDept" runat="server" AppendDataBoundItems="true" onchange="PopulateSubjectsToRemove();">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeSubName" runat="server" AppendDataBoundItems="true" onchange="FillSubjectDetailsToRemove();">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Code
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_removeSubCode" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Credits
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_removeSubCredits" class="input-xlarge" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeTS" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Elective</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeisIE" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_removeSub" class="btn-inverse" runat="server" OnClick="btn_removeSub_Click" Text="Remove Subject" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Config-Subjects.aspx")%>'
        function PopulateSubjectsToEdit() {
            $("#<%=DDL_editSubName.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=DDL_editDept.ClientID%>').val() == "0" || $('#<%=DDL_editSem.ClientID%>').val() == "0") {
                $('#<%=DDL_editSubName.ClientID %>').empty().append('<option selected="selected" value="0">Select Subject</option>');
            }
            else {
                $('#<%=DDL_editSubName.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                var dept_sem = '{deptID:"' + $('#<%=DDL_editDept.ClientID%> option:selected').html() + '",semID:"' + $('#<%=DDL_editSem.ClientID%>').val() + '"}';
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/PopulateSubjects',
                    data: dept_sem,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        PopulateControl(response.d, $("#<%=DDL_editSubName.ClientID %>"));
                    },
                    failure: function (response) {
                        alert("Failed");
                        alert(response.d);
                    }
                });
                }
            }
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
    <script type="text/javascript">
        function FillSubjectDetailsToEdit() {
            $("#<%=DDL_editisIE.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=DDL_editSubName.ClientID%>').val() == "0") {
                //$('#<%=DDL_editisIE.ClientID %>').empty().append('<option selected="selected" value="0">Select</option>');
            }
            else {
                //$('#<%=DDL_editisIE.ClientID %>').empty.append('<option selected="selected" value="0">Loading...</option>');
                var dept_sem_sub = '{deptID:"' + $('#<%=DDL_editDept.ClientID%> option:selected').html() + '",semID:"' + $('#<%=DDL_editSem.ClientID%>').val() + '",subID:"' + $('#<%=DDL_editSubName.ClientID%> option:selected').html() + '"}';
                var sub_name = $('#<%=DDL_editSubName.ClientID%> option:selected').html();
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/FillSubDetails',
                    data: dept_sem_sub,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        FillDetailsToEdit(response.d, sub_name, $("#<%=Text_tempSubName.ClientID %>"), $("#<%=Text_editSubCode.ClientID %>"), $("#<%=Text_editSubCredits.ClientID %>"), $("#<%=DDL_editisIE.ClientID %>"), $("#<%=DDL_editTS.ClientID %>"));
                    },
                    failure: function (response) {
                        alert("Failed");
                        alert(response.d);
                    }
                });
                }
            }
            function FillDetailsToEdit(list, tempSubName, subName, subCode, subCredits, subisIE, subTS) {
                var i = 0;
                if (list.length > 0) {
                    subisIE.removeAttr("disabled");
                    subTS.removeAttr("disabled");
                    subName.val(tempSubName);
                    $.each(list, function () {
                        if (i == 0) {
                            subCode.val(this['Text']);
                            i++;
                        } else if (i == 1) {
                            subCredits.val(this['Text']);
                            i++;
                        } else if (i == 2) {
                            if (this['Text'] == "1") {
                                subisIE.find('option:contains("' + "Yes" + '")').attr("selected", true);
                            } else {
                                subisIE.find('option:contains("' + "No" + '")').attr("selected", true);
                            }
                            i++;
                        } else if (i == 3) {
                            subTS.find('option:contains("' + this['Text'] + '")').attr("selected", true);
                            i++;
                        }
                    });
                }
                else {
                    control.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            }
    </script>

    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Config-Subjects.aspx")%>'
        function PopulateSubjectsToRemove() {
            $("#<%=DDL_removeSubName.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=DDL_removeDept.ClientID%>').val() == "0" || $('#<%=DDL_removeSem.ClientID%>').val() == "0") {
                $('#<%=DDL_removeSubName.ClientID %>').empty().append('<option selected="selected" value="0">Select Subject</option>');
            }
            else {
                $('#<%=DDL_removeSubName.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                var dept_sem = '{deptID:"' + $('#<%=DDL_removeDept.ClientID%> option:selected').html() + '",semID:"' + $('#<%=DDL_removeSem.ClientID%>').val() + '"}';
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/PopulateSubjects',
                    data: dept_sem,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        PopulateControl(response.d, $("#<%=DDL_removeSubName.ClientID %>"));
                    },
                    failure: function (response) {
                        alert("Failed");
                        alert(response.d);
                    }
                });
                }
            }
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
    <script type="text/javascript">
        function FillSubjectDetailsToRemove() {
            $("#<%=DDL_removeisIE.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=DDL_removeSubName.ClientID%>').val() == "0") {
                //$('#<%=DDL_removeisIE.ClientID %>').empty().append('<option selected="selected" value="0">Select</option>');
            }
            else {
                //$('#<%=DDL_removeisIE.ClientID %>').empty.append('<option selected="selected" value="0">Loading...</option>');
                var dept_sem_sub = '{deptID:"' + $('#<%=DDL_removeDept.ClientID%> option:selected').html() + '",semID:"' + $('#<%=DDL_removeSem.ClientID%>').val() + '",subID:"' + $('#<%=DDL_removeSubName.ClientID%> option:selected').html() + '"}';
                var sub_name = $('#<%=DDL_removeSubName.ClientID%> option:selected').html();
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/FillSubDetails',
                    data: dept_sem_sub,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        FillDetailsToRemove(response.d, sub_name, $("#<%=Text_tempSubName.ClientID %>"), $("#<%=Text_removeSubCode.ClientID %>"), $("#<%=Text_removeSubCredits.ClientID %>"), $("#<%=DDL_removeisIE.ClientID %>"), $("#<%=DDL_removeTS.ClientID %>"));
                    },
                    failure: function (response) {
                        alert("Failed");
                        alert(response.d);
                    }
                });
                }
            }
            function FillDetailsToRemove(list, tempSubName, subName, subCode, subCredits, subisIE, subTS) {
                var i = 0;
                if (list.length > 0) {
                    subisIE.removeAttr("disabled");
                    subTS.removeAttr("disabled");
                    subName.val(tempSubName);
                    $.each(list, function () {
                        if (i == 0) {
                            subCode.val(this['Text']);
                            i++;
                        } else if (i == 1) {
                            subCredits.val(this['Text']);
                            i++;
                        } else if (i == 2) {
                            if (this['Text'] == "1") {
                                subisIE.find('option:contains("' + "Yes" + '")').attr("selected", true);
                            } else {
                                subisIE.find('option:contains("' + "No" + '")').attr("selected", true);
                            }
                            i++;
                        } else if (i == 3) {
                            subTS.find('option:contains("' + this['Text'] + '")').attr("selected", true);
                            i++;
                        }
                    });
                }
                else {
                    control.empty().append('<option selected="selected" value="0">Not available<option>');
                }
            }
    </script>
</asp:Content>
