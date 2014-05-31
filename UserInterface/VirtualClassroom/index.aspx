<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master"
    AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CMS.UserInterface.VirtualClassroom.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
    <div>
        <ul class="breadcrumb">
            <li><a href="#">Home </a><span class="divider">/ </span></li>
            <li><a href="#">Dashboard </a></li>
        </ul>
    </div>
    <div class="sortable row-fluid ui-sortable">
        <a class="well span3 top-block" href="#" data-rel="tooltip" data-original-title="6 new members.">
            <span class="icon32 icon-red icon-user"></span>
            <div>
                Total Students
            </div>
            <div>
                900
            </div>
            <span class="notification">7 </span></a><a class="well span3 top-block" href="#"
                data-rel="tooltip" data-original-title="4 new pro members."><span class="icon32 icon-color icon-star-on">
                </span>
                <div>
                    Total Faculties
                </div>
                <div>
                    49
                </div>
                <span class="notification green">4 </span></a><a class="well span3 top-block" href="#"
                    data-rel="tooltip" data-original-title="$34 new sales."><span class="icon32 icon-color icon-cart">
                    </span>
                    <div>
                        Total Subjects
                    </div>
                    <div>
                        83
                    </div>
                    <span class="notification yellow">$34 </span></a><a class="well span3 top-block"
                        href="#" data-rel="tooltip" data-original-title="12 new messages."><span class="icon32 icon-color icon-envelope-closed">
                        </span>
                        <div>
                            Activities
                        </div>
                        <div>
                            25
                        </div>
                        <span class="notification red">12 </span></a>
    </div>
    <div class="row-fluid">
        <div class="box span12">
            <div class="box-header well">
                <h2>
                    <i class="icon-info-sign"></i>Introduction
                </h2>
                <div class="box-icon">
                </div>
            </div>
            <div class="box-content">
                <h1>
                    Virtual Class <small>free, premium quality, responsive, multiple skin a… </small>
                </h1>
                <p>
                    Its a live demo of the template. I have created Ch…
                </p>
                <p>
                    <b>All pages in the menu are functional, take a look … </b>
                </p>
                <p class="center">
                </p>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
