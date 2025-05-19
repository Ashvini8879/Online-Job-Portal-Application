using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyJobPortal.User
{
    public partial class JobDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public string jobTitle = string.Empty;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                showJobDetails();
            }
            else
            {
                Response.Redirect("FindJob.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private void showJobDetails()
        {
            con = new SqlConnection(str);
            string query = @"Select * from Jobs where JobId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();  // Ensures DataList refreshes
            jobTitle = dt.Rows[0]["Title"].ToString();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ApplyJob")
            {
                if (Session["user"] != null)
                {
                    try
                    {
                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedJobs (JobId, UserId) values(@JobId, @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);

                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        con.Close();

                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Job applied successfully!";
                            lblMsg.CssClass = "alert alert-success";

                            // **Refresh DataList to reflect applied status**
                            showJobDetails();
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Cannot apply for the job, please try again later.";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyJob = e.Item.FindControl("lbApplyJob") as LinkButton;
                if (btnApplyJob != null)
                {
                    if (isApplied())
                    {
                        btnApplyJob.Enabled = false;
                        btnApplyJob.Text = "Applied";
                    }
                    else
                    {
                        btnApplyJob.Enabled = true;
                        btnApplyJob.Text = "Apply Now";
                    }
                }
            }
        }

        bool isApplied()
        {
            con = new SqlConnection(str);
            string query = @"Select * from AppliedJobs where UserId = @UserId and JobId = @JobId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);

            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);

            return dt1.Rows.Count > 0;
        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";

            if (url == null || string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.jpg";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }

            return ResolveUrl(url1);
        }

        protected void lbViewLinkedIn_Click(object sender, EventArgs e)
        {
            // Get the JobId from the query string
            string jobId = Request.QueryString["id"];

            if (!string.IsNullOrEmpty(jobId))
            {
                // Fetch the LinkedInJobId from the database
                string linkedInJobId = GetLinkedInJobId(jobId);

                if (!string.IsNullOrEmpty(linkedInJobId))
                {
                    // Create LinkedIn URL with the specific LinkedIn Job ID
                    string linkedInUrl = "https://www.linkedin.com/jobs/collections/recommended/?currentJobId=" + linkedInJobId;

                    // Redirect to the LinkedIn job URL
                    Response.Redirect(linkedInUrl);
                }
                else
                {
                    // Handle case when LinkedIn Job ID is not found
                    Response.Write("<script>alert('LinkedIn job URL not available for this job.');</script>");
                }
            }
        }

        private string GetLinkedInJobId(string jobId)
        {
            string linkedInJobId = string.Empty;

            // Open SQL connection
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();

                // Correct query to fetch LinkedInJobID
                string query = "SELECT LinkedInJobID FROM Jobs WHERE JobId = @JobId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@JobId", jobId);

                    // Execute and get the result
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        linkedInJobId = result.ToString();
                    }
                }
            }
            return linkedInJobId;
        }

        protected void lnkTakeQuiz_Command(object sender, CommandEventArgs e)
        {
            // Get the Job Title passed as CommandArgument
            string jobTitle = e.CommandArgument.ToString();

            // Assuming you have a page like 'Quiz.aspx' where you take the quiz for the job
            // You can pass the Job Title or other details to that page via query string or session
            Response.Redirect($"Quiz.aspx?jobTitle={jobTitle}");
        }



    }
}
