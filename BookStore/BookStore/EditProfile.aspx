<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="BookStore.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container bootstrap snippets bootdey">
        <h1 class="text-primary"><span class="glyphicon glyphicon-user"></span>Edit Profile</h1>
        <hr>
        <div class="row">
            <!-- left column -->

            <!-- edit form column -->
            <div class="col-md-6 personal-info">

                <h3>Personal info</h3>

                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">First name:</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="tb_fname" runat="server" class="form-control" type="text"></asp:TextBox>
                        </div>
                        <%--<span class="error fnameError"></span>--%>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Last name:</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="tb_lname" class="form-control" type="text" runat="server"></asp:TextBox>
                        </div>
                        <%--<span class="error lnameError"></span>--%>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Mobile Number:</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="tb_mobileNo" class="form-control" type="text" runat="server"></asp:TextBox>
                        </div>
                        <%--<span class="error mobileError"></span>--%>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="tb_email" class="form-control" type="text" runat="server"></asp:TextBox>
                        </div>
                        <%--<span class="error emailError"></span>--%>
                    </div>
                    <div class="form-group pull-right">
                        <asp:Button ID="update" runat="server" Text="Update" class="btn btn-success btn-md " OnClick="UpdateUser" />
                        <asp:Button ID="cancel" runat="server" Text="Cancel" class="btn btn-md " />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>

</asp:Content>
