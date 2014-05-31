<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/UserInterface/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Config-Class.aspx.cs" Inherits="CMS.UserInterface.Admin.Config_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Assign Class
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="form" runat="server">
    <div class="row-fluid sortable" style="display: block" id="meta" runat="server">
        <div class="box span12" style="width: 70%">
            <div class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;Configure Class
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
                                <li class="active"><a href="#addClass">Add Class</a></li>
                                <li><a href="#editClass">Update Class</a></li>
                                <li><a href="#removeClass">Remove Class</a></li>
                            </ul>
                            <div class="tab-content" id="myTabContent" style="overflow: visible">
                                <div id="addClass" class="tab-pane active">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addSem" runat="server" AppendDataBoundItems="true" onchange="PopulateChildDDLUsingTwoParentDDL( $('[id$=DDL_addSubName]')[0].id, $('[id$=DDL_addSem]')[0].id, $('[id$=DDL_addDept]')[0].id, 'PopulateSubjects', '/UserInterface/Admin/Config-Class.aspx');">
                                                <asp:ListItem Value="0">Select Semester</asp:ListItem>
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
                                            <asp:DropDownList ID="DDL_addDept" runat="server" AppendDataBoundItems="true"
                                                onchange="PopulateDivision($('[id$=DDL_addDiv]')[0].id, $('[id$=DDL_addDept]')[0].id, 'PopulateDiv', '/UserInterface/Admin/Config-Class.aspx');
                                                PopulateChildDDLUsingOneParentDDL($('[id$=DDL_addStaffName]')[0].id, $('[id$=DDL_addDept]')[0].id, 'PopulateStaff', '/UserInterface/Admin/Config-Class.aspx');
                                                PopulateChildDDLUsingTwoParentDDL( $('[id$=DDL_addSubName]')[0].id, $('[id$=DDL_addSem]')[0].id, $('[id$=DDL_addDept]')[0].id, 'PopulateSubjects', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Division
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addDiv" runat="server" AppendDataBoundItems="true" onchange="CopyValue($('[id$=DDL_addDiv]')[0].id, $('[id$=Text_Div]')[0].id);">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addSubName" runat="server" AppendDataBoundItems="true" onchange="CopyValue($('[id$=DDL_addSubName]')[0].id, $('[id$=Text_subName]')[0].id);">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            Staff Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addStaffName" runat="server" AppendDataBoundItems="true" onchange="CopyValue($('[id$=DDL_addStaffName]')[0].id, $('[id$=Text_staffName]')[0].id);">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Lab</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_addisLab" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Batch
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addBatch" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Year
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addYear" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Class Name
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addClassName" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_addClass" class="btn-inverse" runat="server" OnClick="btn_addClass_Click" Text="Assign Class" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="editClass" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editSem" runat="server" AppendDataBoundItems="true">
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
                                            <asp:DropDownList ID="DDL_editDept" runat="server" AppendDataBoundItems="true" onchange="PopulateDivision($('[id$=DDL_editDiv]')[0].id, $('[id$=DDL_editDept]')[0].id, 'PopulateDiv', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Division
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editDiv" runat="server" AppendDataBoundItems="true" onchange="PopulateChildDDLUsingThreeParentDDL($('[id$=DDL_editClassName]')[0].id, $('[id$=DDL_editSem]')[0].id, $('[id$=DDL_editDept]')[0].id, $('[id$=DDL_editDiv]')[0].id, 'PopulateClass', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            Class Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editClassName" runat="server" AppendDataBoundItems="true" onchange="PopulateChildDDLUsingOneParentDDL($('[id$=DDL_editStaffName]')[0].id, $('[id$=DDL_editClassName]')[0].id, 'PopulateStaffOfClass', '/UserInterface/Admin/Config-Class.aspx');
                                                PopulateChildDDLUsingOneParentDDL($('[id$=DDL_editSubName]')[0].id, $('[id$=DDL_editClassName]')[0].id, 'PopulateSubjectsOfClass', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editSubName" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            Staff Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editStaffName" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Lab</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editisLab" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Batch
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_editBatch" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Year
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_editYear" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_editClass" class="btn-inverse" runat="server" Text="Update Assigned Class" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="removeClass" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Semester</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeSem" runat="server" AppendDataBoundItems="true">
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
                                            <asp:DropDownList ID="DDL_removeDept" runat="server" AppendDataBoundItems="true" onchange="PopulateDivision($('[id$=DDL_removeDiv]')[0].id, $('[id$=DDL_removeDept]')[0].id, 'PopulateDiv', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Division
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeDiv" runat="server" AppendDataBoundItems="true" onchange="PopulateChildDDLUsingThreeParentDDL($('[id$=DDL_removeClassName]')[0].id, $('[id$=DDL_removeSem]')[0].id, $('[id$=DDL_removeDept]')[0].id, $('[id$=DDL_removeDiv]')[0].id, 'PopulateClass', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            Class Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeClassName" runat="server" AppendDataBoundItems="true" onchange="PopulateChildDDLUsingOneParentDDL($('[id$=DDL_removeStaffName]')[0].id, $('[id$=DDL_removeClassName]')[0].id, 'PopulateStaffOfClass', '/UserInterface/Admin/Config-Class.aspx');
                                                PopulateChildDDLUsingOneParentDDL($('[id$=DDL_removeSubName]')[0].id, $('[id$=DDL_removeClassName]')[0].id, 'PopulateSubjectsOfClass', '/UserInterface/Admin/Config-Class.aspx');">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Subject Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeSubName" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">
                                            Staff Name
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeStaffName" runat="server" AppendDataBoundItems="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            &nbsp;&nbsp;Is Lab</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeisLab" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="2">No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Batch
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_removeBatch" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Year
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_removeYear" runat="server" class="input-xlarge focused">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_removeClass" class="btn-inverse" runat="server" Text="Remove Assigned Class" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <%--All Hidden Fields--%>
                    <div style="display: none">
                        <asp:TextBox ID="Text_addDiv" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_addSubName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_addStaffName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_editDiv" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_editSubName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_editStaffName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_editClassName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_removeDiv" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_removeSubName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_removeStaffName" runat="server">
                        </asp:TextBox>
                        <asp:TextBox ID="Text_removeClassName" runat="server">
                        </asp:TextBox>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
