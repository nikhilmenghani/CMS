<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/StaffPortal/Staff.Master"
    AutoEventWireup="true" CodeBehind="Staff-home.aspx.cs" Inherits="CMS.Staff_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="title" ContentPlaceHolderID="pageTitle" runat="server">
    Welcome
    <%= Session["username"].ToString() %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="form" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Dashboard </a></li>
        </ul>
    </div>
<%--    <div id="dem0">
        Hi,
        <%= Session["UserName"].ToString() %>, welcome to Staff Dashboard.....</div>--%>
    <div class="row-fluid sortable ui-sortable">
        <div class="box span9" style="width: 60%">
            <form id="form1" runat="server">
            <asp:Repeater ID="repeater1" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="tooltip-demo well" style="text-align: center;">
                        <div class="box-content">
                            <h4>
                                <a href="#">
                                    <%#Eval("title").ToString() %></a></h4>
                            &nbsp;&nbsp;is uploaded by&nbsp;&nbsp;<strong><%#Eval("addedby_staff").ToString() %></strong>&nbsp;&nbsp;in
                            class&nbsp;&nbsp;<strong><%#Eval("className").ToString() %></strong><br />
                            To watch it please&nbsp;&nbsp;
                            <asp:LinkButton ID="linkbtn" Text="Click Here" runat="server" OnClick="btnhandler"
                                CommandArgument='<%#Eval("pathValue") %>'></asp:LinkButton>
                            <br />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </form>
        </div>
        <div class="box span3" style="width: 37%">
            <div class="box-header well" data-original-title="">
                <h3>
                    Recent News</h3>
                <div class="box-icon">
                </div>
            </div>
            <div class="box-content">
                <p>
                    <ul >
                        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                            dolor, quis ullamcorper ligula sodales at.</li></br>
                        <li>Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla</li></br>
                        <li>Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo
                            orci erat eu massa. Sed sit amet nulla ipsum</li></br>
                        <li>Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non
                            pulvinar nisi.</li></br>
                        <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                            dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo
                            eget, mattis vel eros. In sed ornare nulla</li></br>
                        <li>Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo
                            orci erat eu massa.</li></br>
                        <li>Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a
                            ligula. Pellentesque non pulvinar nisi.</li></br>
                        <li>Etiam porta sem malesuada magna mollis euismod.</li></br>
                        <li>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</li></br>
                    </ul>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
