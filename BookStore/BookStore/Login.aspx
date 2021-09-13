<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookStore.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <link href="Assest/Style.css" rel="stylesheet" />
</head>
<body class="body">
    <div class="box">
             <h2>Login</h2>
        <form autocomplete="off" novalidate="novalidate" id="form2" runat="server" >

            <div>
                <asp:TextBox ID="tb_email" name="custEmail" required="required" runat="server"></asp:TextBox>
                <label for="custEmail">Username</label>
                <span class="error emailError"></span>
            </div>
            <div>
                <div>
                    <asp:TextBox type="password" name="custPassword" id="tb_password" required="required" runat="server"></asp:TextBox>
                    <label for="custPassword">Password</label>
                    <span class="error passwordError"></span>
                </div>
            </div>

         <div class="button">
             <asp:Button runat="server"  name="submit" type="submit" ID="login" value="Login" Text="Login" OnClick="LoginUser" />
             <asp:Button runat="server" Text="Reset" type="reset" name="reset" ID="reset_login" value="Reset" />
            </div>
            <div class="form-group text-center">
                <span>Not a member ? <a href="Register.aspx">Register</a></span>
              
            </div>
        </form>
    </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="Assest/script.js"></script>
</body>
</html>
