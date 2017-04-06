<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>DataBase</h1>
        <asp:Literal runat="server" id="resultA" EnableViewState="false" />
    <form action="test-3.html">
	E-mail:&nbsp;
        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
	<br>
	Password:&nbsp;
        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
    <br>
    Permission:&nbsp;
        <asp:TextBox ID="txtpermission" runat="server"></asp:TextBox>
	<br>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
        <br>
	&nbsp;<p class="lead">Click here</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Click &raquo;</a></p>
    </div>
    <div class="row">
        <div class="col-md-4">
            <p>
                <a class="btn btn-default" href="xxx.html">First &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <p>
                <a class="btn btn-default" href="xxx.html">Second &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <p>
                <a class="btn btn-default" href="xxx.html">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
