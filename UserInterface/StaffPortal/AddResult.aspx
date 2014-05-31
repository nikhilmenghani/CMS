<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/StaffPortal/Staff.Master" AutoEventWireup="true" CodeBehind="AddResult.aspx.cs" Inherits="CMS.UserInterface.StaffPortal.AddResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Gridview {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
            width:80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="form" runat="server">
    <div id="content" class="span10">
        <!-- content starts -->
        <div class="row-fluid sortable">
            <div class="box span12" style="width: auto">
                <div class="box-header well">
                    <h2>
                        <i class="icon-picture"></i>&nbsp;Add Marks
                    </h2>
                </div>
                <div id="home" style="display: block" class="box-content">
                    <form id="Form1" class="form-horizontal" runat="server">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label">
                                    Semester</label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlSem" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="PopulateSubjects" runat="server" Style="width: auto;">
                                        <asp:ListItem Value="0">Select Semester</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Subject</label>
                                <%--<div class="controls">
                                    <asp:DropDownList ID="ddlSub" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                        <asp:ListItem Value="0">Select Subject</asp:ListItem>
                                    </asp:DropDownList>
                                </div>--%>

                                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlSem" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddlSub" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="PopulateStudentsList" runat="server" Style="width: auto;">
                                                <asp:ListItem Value="0">Select Subject</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <%--<div class="control-group">
                                <div class="controls">
                                    <input type="radio" name="studentList" id="Regular_Students" checked="checked" style="margin-left: 0px;" onclick="showStudentsDDL('Regular', 'Detained', 'Other');" />
                                    Regular Students
                                <input type="radio" name="studentList" id="Detained_Students" style="margin-left: 0px;" onclick="showStudentsDDL('Detained', 'Other', 'Regular');" />
                                    Detained Students
                                <input type="radio" name="studentList" id="Other_Students" style="margin-left: 0px;" onclick="showStudentsDDL('Other', 'Regular', 'Detained');" />
                                    Other Students
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Students List</label>
                                <div class="controls" id="Regular" style="display: block">
                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlSub" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlRegStudents" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                <asp:ListItem Value="0">Select Regular Student</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                                <div class="controls" id="Detained" style="display: none">
                                    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlSub" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlDetStudents" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                <asp:ListItem Value="0">Select Detained Student</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="controls" id="Other" style="display: none">
                                    <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlSub" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:DropDownList ID="ddlOtherStudents" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                <asp:ListItem Value="0">Select Other Student</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </div>--%>

                            <div class="control-group">
                                <div class="controls">
                                    <asp:Button ID="Btn_regStudent" class="btn btn-inverse" runat="server" Text="Load Regular Students" OnClick="Btn_regStudent_Click"/>
                                    <asp:Button ID="Btn_detStudent" class="btn btn-inverse" runat="server" Text="Load Detained Students" OnClick="Btn_detStudent_Click"/>
                                    <asp:Button ID="Btn_otherStudent" class="btn btn-inverse" runat="server" Text="Load Other Students" OnClick="Btn_otherStudent_Click"/>
                                </div>
                            </div>
                            
                            <div class="grid">
                                <asp:GridView ID="GVRegularList" runat="server" Visible="false" AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                                    ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <%--<asp:TemplateField HeaderText="Edit?">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnGEdit" runat="server" CausesValidation="false">
                                                    <asp:Image ID="Image1" ImageUrl="~/images/edit.png" Width="50px" runat="server" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="EnrollMent No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrol" runat="server" Text='<%#Eval("enroll_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Marks">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblGEmail" runat="server" Text='<%#Eval("email_id") %>'></asp:Label>--%>
                                                <asp:TextBox ID="TextIntMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextIntVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>


                            <div class="grid">
                                <asp:GridView ID="GVDetainList" runat="server" Visible="false" AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                                    ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <%--<asp:TemplateField HeaderText="Edit?">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnGEdit" runat="server" CausesValidation="false">
                                                    <asp:Image ID="Image1" ImageUrl="~/images/edit.png" Width="50px" runat="server" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="EnrollMent No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrol" runat="server" Text='<%#Eval("enroll_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Marks">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblGEmail" runat="server" Text='<%#Eval("email_id") %>'></asp:Label>--%>
                                                <asp:TextBox ID="TextIntMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextIntVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>

                            <div class="grid">
                                <asp:GridView ID="GVOtherList" runat="server" Visible="false" AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
                                    ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <%--<asp:TemplateField HeaderText="Edit?">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnGEdit" runat="server" CausesValidation="false">
                                                    <asp:Image ID="Image1" ImageUrl="~/images/edit.png" Width="50px" runat="server" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="EnrollMent No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEnrol" runat="server" Text='<%#Eval("enroll_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Marks">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblGEmail" runat="server" Text='<%#Eval("email_id") %>'></asp:Label>--%>
                                                <asp:TextBox ID="TextIntMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Internal Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextIntVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="External Viva Marks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextExtVivaMarks" Style="width: 134px" class="input-xlarge focused" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has Internal KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasIntKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External Backlog">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtBacklog" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Has External KT">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlHasExtKT" class="input-large span10" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Style="width: auto;">
                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#282A2E" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                            <%--<div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    </label>
                                <div class="controls">
                                    
                                </div>
                            </div>--%>
                            <div class="form-actions">
                                <asp:Button ID="saveResult" class="btn btn-inverse" runat="server" Text="Save Result" />
                                <button class="btn">
                                    Cancel</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function showStudentsDDL(divID1, divID2, divID3) {
                document.getElementById(divID1).style.display = 'block';
                document.getElementById(divID2).style.display = 'none';
                document.getElementById(divID3).style.display = 'none';
            }
        </script>
</asp:Content>
