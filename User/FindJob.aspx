<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="FindJob.aspx.cs" Inherits="MyJobPortal.User.FindJob" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" type="text/css" />
<style>
    main{
        background-image: url('../assets/img/hero/back.png');
        background-size: cover;
        background-repeat: no-repeat;
       background-position: center;
       
        
    }


    /* Search Container */
.search-container {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin: 30px auto;
    flex-wrap: wrap;
}

.search-container input.form-control {
    width: 320px;
    border-radius: 30px;
    padding: 12px 18px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.search-container .btn-primary {
    padding: 12px 24px;
    border-radius: 30px;
    background: linear-gradient(to right, #0062ff, #00c6ff);
    border: none;
    color: #fff;
    font-weight: 500;
    transition: all 0.3s ease;
}

.search-container .btn-primary:hover {
    background: linear-gradient(to right, #004ecb, #00a6d4);
    transform: scale(1.05);
}

/* Filter Box */
.job-category-listing {
    background: #dddddd;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.06);
}

/* Filter Headings */
.small-section-tittle2 h4 {
    font-size: 16px;
    font-weight: 600;
    color: #444;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.shut{
     font-size: 16px;
    font-weight: 600;
    color: #444;
   
}

/* Filter Inputs */
.select-job-items2 select,
.radiobuttonlist input[type="radio"],
.checkbox input[type="checkbox"] {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    background-color: #f8f9fa;
    border: 1px solid #ccc;
    margin-top: 6px;
    font-size: 14px;
}

/* Checkbox / Radio Labels */
.checkbox-primary label,
.radiobuttonlist label {
    display: block;
    font-size: 14px;
    margin-top: 8px;
    color: #333;
    cursor: pointer;
}

/* Section spacing */
.single-listing {
    margin-bottom: 25px;
}

/* Buttons */
.btn-sm {
    background-color: saddlebrown ;
    color: #fff;
    border-radius: 8px;
    padding: 8px 16px;
    border: none;
    width: 100%;
    transition: background 0.3s ease;
}

.btn-sm:hover {
    background-color: rosybrown;
}

/* Job Cards */
.single-job-items {
    background: #fff;
    padding: 20px;
    border-radius: 12px;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    transition: all 0.2s ease-in-out;
    margin-bottom: 25px;
}

.single-job-items:hover {
    transform: translateY(-4px);
}

.job-items {
    display: flex;
    align-items: center;
    gap: 20px;
}

.company-img img {
    width: 80px;
    height: 80px;
    border-radius: 8px;
    border: 1px solid #e0e0e0;
    object-fit: cover;
}

/* Job Title & Details */
.job-tittle2 h5 {
    font-size: 18px;
    font-weight: 600;
    color: #007bff;
    margin-bottom: 6px;
}

.job-tittle2 ul {
    list-style: none;
    padding-left: 0;
    margin: 0;
    color: #666;
    font-size: 14px;
    line-height: 1.6;
}

.items-link2 {
    text-align: right;
}

.items-link2 a {
    background: #ffc107;
    color: #333;
    font-weight: bold;
    padding: 6px 12px;
    border-radius: 6px;
    text-decoration: none;
}

.items-link2 a:hover {
    background-color: #e0a800;
    color: #fff;
}

.items-link2 span {
    display: block;
    margin-top: 10px;
    font-size: 13px;
    color: #888;
}

/* Job Count */
.count-job {
  margin-left: 60px;
    background: #dddddd;
    padding: 15px;
    font-size: 16px;
    font-weight: 500;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
    margin-bottom: 30px;
    width: 600px;
}

/* Responsive */
@media (max-width: 992px) {
    .single-job-items {
        flex-direction: column;
        align-items: flex-start;
    }

    .job-items {
        flex-direction: column;
        align-items: flex-start;
    }

    .items-link2 {
        align-self: flex-end;
        margin-top: 15px;
    }
}

.featured-job-area {
    padding: 10px 0;
   background-color:transparent;
}

@media (max-width: 576px) {
    .search-container input.form-control {
        width: 100%;
    }

    .search-container .btn-primary {
        width: 100%;
    }
}




</style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<main>
        <br />
<div class="search-container">

    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search jobs..." />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" />
</div>


<!-- Job List Area Start -->

<div class="job-listing-area pt-50 pb-120">

<div class="container">

<div class="row">

<!-- Left content -->


    
    <div class="col-xl-2 col-lg-3 col-md-4">

        <div class="row">

            <div class="col-12">

                <div class="small-section-tittle2 mb-45">

     
                     
                  <h4 style="font-size:20px"><b>&nbsp;
 🔽 Filter Jobs</b></h4><br />


             

                </div>

            </div>

        </div>
 
        <!-- Job Category Listing start -->

        <div class="job-category-listing mb-50 pb-0">

            <!-- single one -->

            <div class="single-listing">

                <div class="small-section-tittle2">

                    <h4><br /><i class="fas fa-map-marker-alt"></i>Job Location</h4>
                  

                </div>

                <!-- Select job items start -->

                <div class="select-job-items2">

                    <asp:DropDownList ID="ddlCountry"
                        runat="server" name="select" CssClass="form-control w-100"
                        DataSourceID="SqlDataSource1"
                        AppendDataBoundItems="True" DataTextField="CountryName"
                        DataValueField="CountryName"
                        OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"
                        AutoPostBack="true">

                        <asp:ListItem Value="0">
Country</asp:ListItem>


                    </asp:DropDownList>

                
                   <h4 class="shut"> <br /><br /><br /><i class="fas fa-clock"></i> &nbsp;Job Type</h4>

                    <asp:SqlDataSource ID="SqlDataSource1"
                        runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
                        SelectCommand="SELECT [CountryName] FROM [country]"></asp:SqlDataSource>

                </div>

               

            </div>

            <!-- single two -->
       <!-- single two -->
<div class="single-listing">

  
   
        
    
        <asp:CheckBoxList ID="CheckBoxList1"
            runat="server" AutoPostBack="True"
            RepeatDirection="Vertical"
            RepeatLayout="Flow" CssClass="styled"
            TextAlign="Right"
            OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">

            <asp:ListItem>&nbsp;Full Time</asp:ListItem>
            <asp:ListItem>&nbsp;Part Time</asp:ListItem>
            <asp:ListItem>&nbsp;Remote</asp:ListItem>
            <asp:ListItem>&nbsp;Freelance</asp:ListItem>

        </asp:CheckBoxList>

    </div>



            <div class="single-listing">

                <!-- select-Categories start -->

                <div class="select-Categories pb-50">

                    <div class="small-section-tittle2">

                       <h4><i class="fas fa-calendar-alt"></i>Posted Within</h4>
                    </div>

               

                        <asp:RadioButtonList
                            ID="RadioButtonList1" runat="server"  AutoPostBack="true"
                            OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatLayout="Flow">

                            <asp:ListItem Value="-1" Selected="True">&nbsp;Any</asp:ListItem>
                            <asp:ListItem Value="0">&nbsp;Today</asp:ListItem>
                            <asp:ListItem Value="1">&nbsp;Last 1 day</asp:ListItem>
                            <asp:ListItem Value="2">&nbsp;Last 2 days</asp:ListItem>
                            <asp:ListItem Value="3">&nbsp;Last 3 days</asp:ListItem>
                            <asp:ListItem Value="4">&nbsp;Last 5 days</asp:ListItem>
                            <asp:ListItem Value="5">&nbsp;Last 10 days</asp:ListItem>
                        </asp:RadioButtonList>

                    </div>

               <br /><br />

                <!-- select-Categories End -->


                <div class="mb-1">
                
                    <asp:LinkButton LinkButtonID="lbFilter" runat="server"
                        CssClass="btn btn-sm" Width="100%"
                        OnClick="lbFilter_Click">

Filter</asp:LinkButton>

                </div>
                <br />
                <div class="mb-4">
                         <asp:LinkButton ID="lbReset" runat="server"
                        CssClass="btn btn-sm" Width="100%"
                        OnClick="lbReset_Click">

Reset</asp:LinkButton>

                </div>
                <br />
            </div>

        </div>

        <!-- Job Category Listing End -->


    </div>




    <!-- Right content -->

    <div class="col-xl-10 col-lg-9 col-md-8">

        <!-- Featured_job_start -->

        <section class="featured-job-area">

            <div class="container">

                <!-- Count of Job list Start -->

                <div class="row">

                    <div class="col-lg-12">

                        <div class="count-job mb-35">

                            <asp:Label ID="lbljobCount"
                                runat="server"></asp:Label>
                         
                        </div>

                    </div>

                </div>

                <!-- Count of Job list End.

<!-- single-job-content -->

                <asp:DataList ID="DataList1" runat="server">

                    <ItemTemplate>

                        <div class="single-job-items">

                            <div class="job-items">

                                <div class="company-img">

                                    <a href="JobDetails.aspx?

id=<%# Eval("JobId") %>">

                                        <img width="80" src="<%# GetImageUrl(Eval("CompanyImage")) %>" alt="">
                                    </a>

                                </div>

                                <div class="job-tittle job-tittle2">

                                    <a href="JobDetails.aspx?id=<%# Eval("JobId") %>">

                                        <h5><%# Eval("Title") %>

                                        </h5>

                                    </a>

                                    <ul>

                                        <li><%# Eval("CompanyName") %></li>

                                        <li><i class="fas fa-map-marker-alt"></i>&nbsp<%# Eval("State") %>, <%# Eval("Country") %></li>

                                        <li><%# Eval("Salary")%></li>&nbsp;&nbsp;

                                    </ul>

                                </div>

                            </div>

                            <div class="items-link items-link2 f-right">

                                <a href="JobDetails.aspx?id=<%# Eval("JobId") %>"><%# Eval("JobType") %>
                                </a>&nbsp;&nbsp;

                                <span class="text-secondary">

                                    <i class="fas fa-clock pr-1"></i>

                                    <%# RelativeDate(Convert.ToDateTime (Eval("CreateDate"))) %>

                                </span>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:DataList>

            </div>
           

        </section>

        <!-- Featured_job_end -->
         <br /><br /><br />
    </div>

</div>

</div>

</div>


</main>

</asp:Content>