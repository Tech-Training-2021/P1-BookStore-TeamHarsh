<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link href="Assest/Style.css" rel="stylesheet" />
</head>
<body class="body">
    <div class="box">
        <h2>registration form</h2>
        <form id="form1" runat="server" novalidate="novalidate" autocomplete="off">
            <div>
                <asp:TextBox runat="server" ID="fname" required="required"></asp:TextBox>
                <label for="fname">First Name</label>
                <span class="error fnameError"></span>
            </div>
            <div>
                <asp:TextBox runat="server" type="text" name="lastname" ID="lname" required="required"></asp:TextBox>
                <label for="lname">Last Name</label>
                <span class="error lnameError"></span>

            </div>
            <div>
                <asp:TextBox runat="server" type="text" name="custphoneno" ID="phone" required="required"></asp:TextBox>
                <label for="custphoneno">Mobile Number</label>
                <span class="error mobileError"></span>

            </div>
            <div>
                <asp:TextBox runat="server" type="text" name="custemail" ID="email" required="required"></asp:TextBox>
                <label for="custemail">Username</label>
                <span class="error emailError"></span>

            </div>
            <div>
                <div>
                    <asp:TextBox runat="server" type="text" name="custpassword" ID="password" required="required"></asp:TextBox>
                    <label for="custpassword">Password</label>
                    <span class="error passwordError"></span>

                </div>

                <div class="showPassword">
                    <label for="showpassword">Show Password</label>
                    <input type="checkbox" name="showPassword" id="showPassword" />
                </div>
            </div>
            <br />
            <br />
            <div>
                <asp:TextBox runat="server" type="text" name="custpassword1" ID="confirmPassword" required="required"></asp:TextBox>
                <label for="custpassword1">Confirm Password</label>
                <span class="error confirmPasswordError"></span>
            </div>
            <div class="button">
                <asp:Button runat="server"  ID="register" Text="Register" OnClick="RegisterUser" />
                <input type="reset" name="reset" id="reset" value="reset" />
            </div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="Assest/script.js"></script>
</body>
</html>
