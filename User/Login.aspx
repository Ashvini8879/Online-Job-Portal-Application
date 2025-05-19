<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyJobPortal.User.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>/* ====================
   Main Container Styles
==================== */
.login-container {
    background-color: powderblue;
    padding: 20px 15px;
}

/* Centered Box for Login Form */
.login-box {
    background: #fff;
    border-radius: 12px;
    padding: 40px 30px;
    max-width: 450px;
    margin: 50px auto;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    border: 1px solid #e0e0e0;
    transition: all 0.3s ease-in-out;
}

/* ====================
   Heading Style
==================== */
.contact-title {
    font-size: 28px;
    font-weight: 700;
    color: #333;
    margin-bottom: 20px;
    text-align: center;
}

/* ====================
   Form Input Styles
==================== */
.form-group label {
    font-weight: 600;
    color: #555;
    margin-bottom: 8px;
    display: inline-block;
}

.form-control {
    height: 45px;
    border-radius: 8px;
    border: 1px solid #ccc;
    padding: 10px 15px;
    font-size: 16px;
    background-color: #f9f9f9;
    transition: all 0.3s ease-in-out;
}

/* Input Focus Effect */
.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
    background-color: #fff;
}

/* ====================
   Dropdown Style
==================== */
#ddlLoginType {
    width: 100%;
}

/* ====================
   Button Styles
==================== */
.button-contactForm {
    background-color: #007bff;
    color: #fff;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    width: 100%;
    font-weight: 600;
}

/* Button Hover Effect */
.button-contactForm:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
}

/* ====================
   Link Style
==================== */
/* Updated: No underline on hover */
.clickLink a {
    color: #007bff;
    font-size: 14px;
    font-weight: 500;
    text-decoration: none; /* Ensure no underline */
    display: inline-block;
    margin-top: 12px;
    transition: all 0.3s ease-in-out;
}

/* Updated: No underline even on hover */
.clickLink a:hover {
    text-decoration: none; /* Remove underline on hover */
    color: seagreen; /* Optional: Change color on hover */
}


/* ====================
   Error Message Style
==================== */
.error-msg {
    color: #dc3545;
    font-size: 14px;
    margin-top: 5px;
}

/* ====================
   Responsive Design
==================== */
@media (max-width: 768px) {
    .login-box {
        padding: 30px 20px;
    }

    .button-contactForm {
        width: 100%;
        margin-bottom: 12px;
    }

    .clickLink a {
        display: block;
        text-align: center;
        margin-top: 12px;
    }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <section class="login-container">
    <div class="login-box">
        <div class="col-12 pb-20">
            <asp:Label runat="server" Text="Label" ID="lblMsg" Visible="false" CssClass="error-msg"></asp:Label>
        </div>

        <div class="col-12">
            <h2 class="contact-title"><br />Sign In</h2>
        </div>

        <div class="form-contact contact_form">
            <div class="row">
                <div class="col-12">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required></asp:TextBox>
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                    </div>
                </div>
          <%--      <div class="col-12">
                    <div class="form-group">
                        <label>Login Type</label>
                        <br />
                        <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control">
                            <asp:ListItem value="0">Select Login Type</asp:ListItem>
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            CssClass="error-msg"
                            ErrorMessage="User Type is Required"
                            InitialValue="0" ControlToValidate="ddlLoginType">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>--%>
                <div class="col-12">
                    <br /><asp:Button runat="server" Text="Login" ID="btnLogin" CssClass="button button-contactForm" OnClick="BtnLogin_Click"></asp:Button>
                    <span class="clickLink"><a href="../User/register.aspx">New User? Click Here...</a></span>
                </div>
            </div>
        </div>
    </div>
</section>

<br /><br />

    <br /><br />
</asp:Content>
