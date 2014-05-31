<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Config-TeachingScheme.aspx.cs" Inherits="CMS.UserInterface.Admin.Config_TeachingScheme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
    Teaching Scheme
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="form" runat="server">
    <div class="row-fluid sortable" style="display: block" id="meta" runat="server">
        <div class="box span12" style="width: 70%">
            <div class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;Add/Edit/Remove Teaching Scheme
                </h2>
            </div>
            <div id="home" class="box-content">
                <form id="subjectForm" class="form-horizontal" runat="server">
                    <fieldset>
                        <%--<div id="ddlId" class="box-content">
                            <label class="control-label">
                                Select
                            </label>
                            <div class="controls">
                                <asp:DropDownList ID="ddlSub" AutoPostBack="false" AppendDataBoundItems="true" data-rel="chosen" OnChange="displayDivFrom3DDLValues(this, 'Add Teaching Scheme', 'Update Teaching Scheme', 'addTS', 'editTS' , 'removeTS');"
                                    runat="server">
                                    <asp:ListItem Value="1">Add Teaching Scheme</asp:ListItem>
                                    <asp:ListItem Value="2">Update Teaching Scheme</asp:ListItem>
                                    <asp:ListItem Value="3">Remove Teaching Scheme</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>--%>

                        <div class="clearfix">
                        </div>
                        <br />
                        <div class="box-content">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active"><a href="#addTS">Add Teaching Scheme</a></li>
                                <li><a href="#editTS">Update Teaching Scheme</a></li>
                                <li><a href="#removeTS">Remove Teaching Scheme</a></li>
                            </ul>
                            <div class="tab-content" id="myTabContent" style="overflow: visible">
                                <div id="addTS" class="tab-pane active">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme Title
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addTSTitle" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Lecture Hours
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addLecHours" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Lab Hours
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addLabHours" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Internal Marks
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addIntMarks" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            External Marks
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addExtMarks" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">
                                            Viva Marks
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="Text_addVivaMarks" class="input-xlarge focused" runat="server">
                                            </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_addTS" class="btn-inverse" runat="server" OnClick="btn_addTS_Click" Text="Add Teaching Scheme" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="editTS" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme Title
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_editTSTitle" runat="server" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="DDL_editTSTitle_SelectedIndexChanged" data-rel="chosen">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                    <asp:UpdatePanel ID="EditUpdatePanel" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DDL_editTSTitle" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Lecture Hours
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_editLecHours" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Lab Hours
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_editLabHours" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Internal Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_editIntMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    External Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_editExtMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Viva Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_editVivaMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="form-actions">
                                        <asp:Button ID="btn_editTS" class="btn-inverse" runat="server" OnClick="btn_editTS_Click" Text="Update Teaching Scheme" />
                                        <button class="btn">
                                            Cancel</button>
                                    </div>
                                </div>
                                <div id="removeTS" class="tab-pane">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Teaching Scheme Title
                                        </label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DDL_removeTSTitle" runat="server" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="DDL_removeTSTitle_SelectedIndexChanged" data-rel="chosen">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <asp:UpdatePanel ID="removeUpdatePanel" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DDL_removeTSTitle" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Lecture Hours
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_removeLecHours" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Lab Hours
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_removeLabHours" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Internal Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_removeIntMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    External Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_removeExtMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">
                                                    Viva Marks
                                                </label>
                                                <div class="controls">
                                                    <asp:TextBox ID="Text_removeVivaMarks" class="input-xlarge focused" runat="server">
                                                    </asp:TextBox>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="form-actions">
                                        <asp:Button ID="Btn_removeTS" class="btn-inverse" runat="server" OnClick="Btn_removeTS_Click" Text="Remove Teaching Scheme" />
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
</asp:Content>
