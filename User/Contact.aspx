<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MyJobPortal.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Hero Section */
        .slider-height2 {
            min-height: 300px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        /* Contact Section */
        .contact-section {
            padding: 80px 0;
            background-color: #f9f9ff;
        }

        .contact-title {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 40px;
            color: #2c3e50;
        }

        .form-control {
            border: 1px solid #d1d1d1;
            padding: 12px 15px;
            width: 100%;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .button-contactForm {
            background-color: #4e73df;
            border: none;
            padding: 12px 30px;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .button-contactForm:hover {
            background-color: #3759b5;
        }

        /* Contact Info */
        .contact-info {
            margin-bottom: 30px;
            display: flex;
            align-items: center;
        }

        .contact-info__icon {
            font-size: 28px;
            color: #4e73df;
            margin-right: 15px;
        }

        .media-body h3 {
            font-size: 20px;
            margin-bottom: 5px;
            color: #2c3e50;
        }

        .media-body p {
            margin-bottom: 0;
            color: #6c757d;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .contact-title {
                font-size: 28px;
            }

            .form-control {
                padding: 10px;
            }

            .button-contactForm {
                padding: 10px 25px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/con1.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Hero Area End -->
    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
        
    <br /> <br /> <br /> <br /> <br />

                <div class="row">

                     <div class="col-12 pb-20">
                         <asp:Label runat="server" Text="Label" ID="lblMsg" Visible="false"></asp:Label>
                    </div>

                    <div class="col-12">
                        <h2 class="contact-title"><br />Get in Touch</h2>
                    </div>
                    <div class="col-lg-8">
<%--                        <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">--%>
                        <div class="form-contact contact_form"  id="contactForm">   
                        <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea  runat="server" class="form-control w-100" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message" required></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input runat="server" class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input runat="server" class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input  runat="server" class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                  <%--  <button type="submit" class="button button-contactForm boxed-btn">Send</button>--%>
                       <asp:Button runat="server" Text="Send" ID="btnSend" CssClass="button button-contactForm boxed-btn" OnClick="BtnSend_Click"></asp:Button>
                                
                            
                            </div>
                    </div>   <%-- </form>--%>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Mumbai, India - 400001.</h3>
                                <p>1234 Innovation Street</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+91 98765 43210</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>support@myjobportal.com</h3>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</asp:Content>
