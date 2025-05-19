<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Default1.aspx.cs" Inherits="MyJobPortal.User.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* Testimonial Section Styling */
.testimonial-area {
    padding: 60px 0;
    background-color: #f9f9f9;
}

/* Container for Testimonials */
.testimonial-padding {
    padding: 50px 0;
}

/* Testimonial Header (if any) */
.h1-testimonial-active {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px;
    padding-bottom: 40px;
}

.dot-style {
    position: relative;
    display: flex;
    justify-content: center;
}

/* Single Testimonial */
.single-testimonial {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.single-testimonial:hover {
    transform: translateY(-10px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
}

/* Testimonial Caption */
.testimonial-caption {
    text-align: center;
}

/* Founder (Author) Styling */
.testimonial-founder {
    margin-bottom: 30px;
}

.founder-img {
    position: relative;
    display: inline-block;
}

.founder-img img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.founder-img span {
    display: block;
    font-weight: 600;
    margin-top: 10px;
    font-size: 18px;
}

.founder-img p {
    font-size: 14px;
    color: #777;
    margin-top: 5px;
}

/* Testimonial Text */
.testimonial-top-cap p {
    font-style: italic;
    font-size: 16px;
    color: #555;
    margin-top: 15px;
    line-height: 1.6;
}

/* Responsive Design */
@media (max-width: 767px) {
    .testimonial-area {
        padding: 40px 0;
    }

    .testimonial-padding {
        padding: 30px 0;
    }

    .single-testimonial {
        padding: 20px;
    }

    .founder-img img {
        width: 60px;
        height: 60px;
    }

    .founder-img span {
        font-size: 16px;
    }

    .founder-img p {
        font-size: 12px;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
            <!-- Slick Carousel CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        <div class="slider-area ">
            <!-- Mobile Menu -->
         <div class="slider-active">
    <div class="single-slider slider-height d-flex align-items-center" style="background-image: url('../assets/img/hero/coy.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-9 col-md-10">
                    <div class="hero__caption">
                        <h1><br /><br /><br /><br /><br />Find the most exciting startup jobs<br /><br /></h1>
                        <h5><br /><br /><br /><br /><br /><br />    </h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

            </div>

        <!-- slider Area End-->
        <!-- Our Services Start -->
         <!-- Our Services Start -->
        <div class="our-services section-pad-t30">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <br />
                            <br /><br />
                          
                            <span><br /><br />Recent Job</span>
                            <h2>Featured Jobs <br /><br />  <br /></h2>
                        </div>
                    </div>
                </div>
                <div class="row d-flex justify-contnet-center">
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Design & Creative</a></h5>
                                <span>Web Developer (<i class="fas fa-map-marker-alt"></i> Maharashtra)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-cms"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Design & Development</a></h5>
                                <span>Python Developer (<i class="fas fa-map-marker-alt"></i> Mumbai)</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-report"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Sales & Marketing</a></h5>
                                <span>Account Executive (<i class="fas fa-map-marker-alt"></i> Thane)</span>
                            </div>
                        </div>
                    </div>
                  
                    
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-app"></span>
                            </div>
                            <div class="services-cap">
                               <h5><a href="job_listing.html">Mobile Application</a></h5>
                                <span>Android Developer (<i class="fas fa-map-marker-alt"></i> Mumbai)</span>
                            </div>
                        </div>
                    </div>


                 

                </div>
                <!-- More Btn -->
                <!-- Section Button -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="browse-btn2 text-center mt-50">
                            <a href="FindJob.aspx" class="border-btn2">Browse All Sectors</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
            
            

         <!-- Online CV Area Start -->
         <div class="online-cv cv-bg section-overly pt-90 pb-120"  data-background="../assets/img/gallery/cv_bg.jpg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="cv-caption text-center">
                            <p class="pera1">FEATURED TOURS Packages</p>
                            <p class="pera2"> Make a Difference with Your Online Resume!</p>
                            <a href="Login.aspx" class="border-btn2 border-btn4">Upload your cv</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Online CV Area End-->
      
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
                           <%--     <a href="post-job.aspx" class="btn post-btn">Post a Job</a>--%>
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
        <!-- How  Apply Process End-->
        <!-- Testimonial Start -->
      
   <div class="testimonial-area testimonial-padding">
            <div class="container">
                <!-- Testimonial contents -->
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-8 col-lg-8 col-md-10">
                        <div class="h1-testimonial-active dot-style">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/test1.jpg" alt="">
                                            <span>Marge Lawn</span>
                                            <p>Software Engineer</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“Thanks to this job portal, I found my dream job in just a few weeks! The application process was straightforward, and the support team was incredibly helpful.”</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/test2.jpg" alt="">
                                            <span>Jane Smith</span>
                                            <p>HR Manager</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“As an employer, I found the perfect candidate for our team through this platform. The quality of applicants was impressive, and the process was seamless.”</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <!-- founder -->
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="../assets/img/testmonial/testimonial-founder.png" alt="">
                                            <span>Michael Brown</span>
                                            <p>Project Manager</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“I was able to connect with several companies that matched my skills and interests. This job portal made my job search much easier and more efficient.”</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
     
     

            </main>




</asp:Content>
