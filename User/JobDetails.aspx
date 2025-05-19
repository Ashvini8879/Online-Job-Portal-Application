<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="MyJobPortal.User.JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .quiz-link {
        font-size: 18px;
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }
    .quiz-link:hover {
        text-decoration: underline;
        color: #0056b3;
    }

        /* Job Items Section */
        .single-job-items {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        /* Company Logo */
        .company-img-details img {
            width: 120px;
            height: 120px;
            border-radius: 12px;
            object-fit: cover;
            border: 2px solid #e0e0e0;
        }

        /* Job Title and Details */
        .job-tittle h4 {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .job-tittle ul {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 14px;
            color: #777;
        }

        .job-tittle ul li {
            margin-bottom: 5px;
            display: inline-block;
            margin-right: 15px;
        }

        /* Job Post Details */
        .job-post-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }

        /* Section Titles */
        .small-section-tittle h4 {
            font-size: 18px;
            font-weight: 600;
            color: #444;
            margin-bottom: 15px;
            border-bottom: 2px solid #FF4357;
            display: inline-block;
            padding-bottom: 5px;
        }

        /* Lists */
        ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        ul li {
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        /* Job Overview and Company Info */
        .post-details3,
        .post-details4 {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            border: 1px solid #e0e0e0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            width: 430px;
        }

        /* Apply Button */
        .job-btn {
            background-color: #FF4357;
            color: #fff;
            padding: 12px 18px;
            border-radius: 8px;
            font-size: 14px;
            border: none;
            transition: background-color 0.3s ease;
            width: 100%;
            text-align: center;
        }

        .job-btn:hover {
            background-color: #E03145;
            cursor: pointer;
        }

        /* LinkedIn Button */
        .btn-info {
            background-color: #0077b5;
            color: #fff;
            padding: 12px 18px;
            border-radius: 8px;
            font-size: 14px;
            border: none;
            margin-top: 10px;
            width: 100%;
            text-align: center;
        }

        .btn-info:hover {
            background-color: #005a8d;
        }

        /* Job Overview */
        .post-details3 ul li span {
            font-weight: bold;
            color: #333;
        }

        /* Company Information */
        .post-details4 p,
        .post-details4 span {
            font-size: 14px;
            color: #444;
        }

        /* Inline Company Information */
        .post-details4 ul {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .post-details4 ul li {
            display: inline-block;
            font-size: 14px;
            margin-right: 15px;
            white-space: nowrap;
        }
        a{
            text-decoration:none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <!-- Hero Area End -->
        <div>
            <br />
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            <br />
        </div>

        <!-- Job Post Company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">
                    <ItemTemplate>
                        <div class="row justify-content-between">
                            <!-- Left Content -->
                            <div class="col-xl-8 col-lg-8">
                                <div class="single-job-items mb-50">
                                    <div class="job-items">
                                        <div class="company-img company-img-details">
                                            <a href="#"><img width="120" src="<%# GetImageUrl(Eval("CompanyImage")) %>" alt=""></a>
                                        </div>
                                        <div class="job-tittle">
                                            <a href="#">
                                                <h4><%# Eval("Title") %></h4>
                                            </a>
                                            <ul>
                                                <li><%# Eval("CompanyName") %></li>
                                                <li><i class="fas fa-map-marker-alt"></i> <%# Eval("State") %>, <%# Eval("Country") %></li>
                                                <li><%# Eval("Salary") %></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="job-post-details">
                                    <div class="post-details1 mb-50">
                                        <div class="small-section-tittle">
                                            <h4>Job Description</h4>
                                        </div>
                                        <p><%# Eval("Description") %></p>
                                    </div>

                                    <div class="post-details2 mb-50">
                                        <div class="small-section-tittle">
                                            <h4><br />Required Knowledge, Skills, and Abilities</h4>
                                        </div>
                                        <ul>
                                            <li><%# Eval("Specialization") %></li>
                                        </ul>
                                    </div>

                                    <div class="post-details2 mb-50">
                                        <div class="small-section-tittle">
                                            <h4><br />Education + Experience</h4>
                                        </div>
                                        <ul>
                                            <li><%# Eval("Qualification") %></li>
                                            <li><%# Eval("Experience") %></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Right Content -->
                            <div class="col-xl-4 col-lg-4">
                                <div class="post-details3 mb-50">
                                    <div class="small-section-tittle">
                                        <h4>Job Overview</h4>
                                    </div>
                                    <ul>
                                        <li>Posted date: <span><%# DataBinder.Eval(Container.DataItem, "CreateDate", "{0:dd MMMM yyyy}") %></span></li>
                                        <li>Location: <span><%# Eval("State") %></span></li>
                                        <li>Vacancy: <span><%# Eval("NoOfPost") %></span></li>
                                        <li>Job nature: <span><%# Eval("JobType") %></span></li>
                                        <li>Salary: <span><%# Eval("Salary") %></span></li>
                                        <li>Last date: <span><%# DataBinder.Eval(Container.DataItem, "LastDateToApply", "{0:dd MMMM yyyy}") %></span></li>
                                    </ul><br />
                                    <div class="apply-btn2">
                                        <asp:LinkButton ID="lbApplyJob" runat="server" CssClass="job-btn" Text="Apply Now" CommandName="ApplyJob">Apply Now</asp:LinkButton>
                                   
                                      <asp:LinkButton
                                        ID="lbViewLinkedIn"
                                        runat="server"
                                        CssClass="btn-info"
                                        Text="View this Job on LinkedIn"
                                        OnClick="lbViewLinkedIn_Click" />    
                                    </div>
                                    <br />
<%--<asp:LinkButton ID="lnkTakeQuiz" runat="server" CssClass="quiz-link" OnCommand="lnkTakeQuiz_Command" CommandArgument='<%# Eval("Title") %>'>
    ▶ Take Quiz
</asp:LinkButton>--%>

                                    <div class="my">
                                           <a href="Quiz.aspx?id=<%# Eval("JobId") %>"> ▶ Take Quiz
                                </a>
                                    </div>



                                  
                                </div>

                                <div class="post-details4 mb-50">
                                    <div class="small-section-tittle">
                                        <h4>Company Information</h4>
                                    </div>
                                    <span style="color:blue"><%# Eval("CompanyName") %></span>
                                   
                                    <ul>
                                        <li>
                                            <b>    <br />Address: </b><%# Eval("Address") %>
                                               <br /><br /> <b>Name:</b> <span><%# Eval("CompanyName") %></span>
                                           <br /><br /><b> Web:</b> <span><%# Eval("Website") %></span>
                                            <br /><br /><b>Email:</b> <span><%# Eval("Email") %></span>
                                        </li>
                                        
                                      
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <!-- Job Post Company End -->
    </main>
</asp:Content>
