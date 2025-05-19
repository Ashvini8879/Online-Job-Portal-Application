<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyJobPortal.User.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>/* ====================
   Main Container Styles
==================== */
.register-container {
    background-color: powderblue;
    padding: 20px 15px;
}

/* Centered Box for Register Form */
.register-box {
    background: #fff;
    border-radius: 12px;
    padding: 40px 30px;
    max-width: 550px;
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
   Section Title Styles
==================== */
h6 {
    font-size: 18px;
    font-weight: 600;
    color: #007bff;
    margin-bottom: 15px;
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

/* Textarea Style */
.form-control[TextMode="MultiLine"] {
    height: 100px;
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
.form-control.w-100 {
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
.clickLink a {
    color: #007bff;
    font-size: 14px;
    font-weight: 500;
    text-decoration: none; /* No underline */
    display: inline-block;
    margin-top: 12px;
    transition: all 0.3s ease-in-out;
}

/* Prevent underline on hover */
.clickLink a:hover {
    text-decoration: none;
    color: seagreen; 
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
    .register-box {
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
  <section class="register-container">
    <div class="register-box">
        <div class="col-12 pb-20">
            <asp:Label runat="server" Text="Label" ID="lblMsg" Visible="false" CssClass="error-msg"></asp:Label>
        </div>

        <div class="col-12">
            <h2 class="contact-title"><br />Sign Up</h2>
        </div>

        <div class="form-contact contact_form">
            <div class="row">
                <div class="col-12">
                    <h6>Login Information</h6>
                </div>

                <!-- Username -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Username</label>
                        <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter Unique Username" required></asp:TextBox>
                    </div>
                </div>

                <!-- Password -->
<div class="col-sm-6">
    <div class="form-group">
        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
        <asp:RegularExpressionValidator ID="revPassword" runat="server"
            ControlToValidate="txtPassword"
            ErrorMessage="Password must be at least 8 characters and include uppercase, lowercase, number, and special character."
            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small">
        </asp:RegularExpressionValidator>
    </div>
</div>


                <!-- Confirm Password -->
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match." ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:CompareValidator>
                    </div>
                </div>

                <div class="col-12">
                    <h6>Personal Information</h6>
                </div>

                <!-- Full Name -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" required></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only characters allowed." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <!-- Address -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <!-- Mobile Number -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Mobile Number</label>
                        <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Enter Mobile Number" />

<asp:RequiredFieldValidator 
    ID="rfvMobile" 
    runat="server" 
    ControlToValidate="txtMobileNumber"
    ErrorMessage="Mobile number is required."
    Display="Dynamic"
    ForeColor="Red" />

<asp:RegularExpressionValidator 
    ID="regexMobile" 
    runat="server" 
    ControlToValidate="txtMobileNumber"
    ValidationExpression="^[0-9]{10}$"
    ErrorMessage="Must be exactly 10 digits."
    Display="Dynamic"
    ForeColor="Red" 
    SetFocusOnError="true" />
  </div>
                </div>

                <!-- Email -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" required TextMode="Email"></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid email format." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
    
                        </div>
                </div>

                <!-- Country -->
                <div class="col-12">
                    <div class="form-group">
                        <label>Country</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Pakistan</asp:ListItem>
                            <asp:ListItem>London</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country is Required" InitialValue="0" ControlToValidate="DropDownList1" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                    </div>
                </div>
             
                <!-- Register Button and Link -->
                <div class="col-12">
                       <br />
                    <asp:Button runat="server" Text="Register" ID="btnRegister" CssClass="button button-contactForm" OnClick="BtnRegister_Click"></asp:Button>
                    <span class="clickLink"><a href="../User/Login.aspx">Already Registered? Click Here...</a></span>
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>
