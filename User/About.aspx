<%@ Page Title="About Us" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="MyJobPortal.User.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <!-- Hero Area Start -->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/abt.jpg">
            
            </div>
          
        </div>

        <br /><br /><br /><br /><br />
        <!-- Hero Area End -->
        
        <!-- About Company Start -->
        <div class="support-company-area fix section-padding2">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <div class="section-tittle section-tittle2">
                                <span>Who We Are</span>
                                <h2>Connecting Talented People with Great Opportunities</h2>
                            </div>
                            <div class="support-caption">
                                <p>Our job portal is dedicated to bridging the gap between job seekers and employers by providing a seamless recruitment experience. We help professionals find their dream jobs and assist businesses in hiring the best talent.</p>
                                <p>With a database of over 24,000 job seekers, we ensure that employers have access to a diverse pool of candidates while job seekers get the exposure they deserve.</p>
                             <%--   <a href="post-job.aspx" class="btn post-btn">Post a Job</a>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img">
                            <img src="../assets/img/service/support-img.jpg" alt="Job Seekers">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Company End -->
        
        <!-- How It Works Start -->
        <div class="apply-process-area apply-bg pt-150 pb-150" data-background="../assets/img/gallery/how-applybg.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle white-text text-center">
                            <span>How It Works</span>
                            <h2 style="color:white">Simple Steps to Land Your Dream Job</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-search"></span>
                            </div>
                            <div class="process-cap">
                                <h5>1. Search for Jobs</h5>
                                <p>Use our powerful search engine to find job listings that match your skills and preferences.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-curriculum-vitae"></span>
                            </div>
                            <div class="process-cap">
                                <h5>2. Apply for Jobs</h5>
                                <p>Submit your application with an optimized resume to increase your chances of getting hired.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="process-cap">
                                <h5>3. Get Hired</h5>
                                <p>Connect with top employers and secure a job that aligns with your career goals.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- How It Works End -->
        
    
    
        <!-- Blog Area Start -->
        <div class="home-blog-area blog-h-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Our Latest Job Postings</span>
                            <h2>Recent Job Opportunities</h2>
                            <br /><br />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="../assets/img/blog/home-blog1.jpg" alt="">
                                    <!-- Blog date -->
                                    <div class="blog-date text-center">
                                        <span>24</span>
                                        <p>Now</p>
                                    </div>
                                </div>
                                <div class="blog-cap">
                                    <p>|   Technology</p>
                                    <h3><a href="single-blog.html">Software Engineer at Tech Innovations</a></h3>
                                    <a href="FindJob.aspx" class="more-btn">Apply Now »</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="../assets/img/blog/home-blog2.jpg" alt="">
                                    <!-- Blog date -->
                                    <div class="blog-date text-center">
                                        <span>24</span>
                                        <p>Now</p>
                                    </div>
                                </div>
                                <div class="blog-cap">
                                    <p>|   Marketing</p>
                                    <h3><a href="single-blog.html">Marketing Manager at Creative Solutions</a></h3>
                                    <a href="FindJob.aspx" class="more-btn">Apply Now »</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Area End -->

    </main>
</asp:Content>
