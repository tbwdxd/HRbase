<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication3.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 500px;
        }
        .auto-style3 {
            width: 500px;
        }
        .auto-style4 {
            width: 350px;
        }
        .auto-style5 {
            width: 350px;
            text-align: center;
        }
    </style>
    <link href="Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="Content/signin.css" rel="stylesheet" type="text/css" />
    <link href="Content/custom.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; font-size: xx-large">
            <strong>Login Page</strong></div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">E-Mail</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtemail" runat="server" TextMode="Email" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Please enter your e-mail" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please enter your password" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="button_login" runat="server" OnClick="button_login_Click" Text="Login" Width="190px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
