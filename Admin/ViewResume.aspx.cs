using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using System.Text;
using System.Text.RegularExpressions;

namespace MyJobPortal.Admin
{
    public partial class ViewResume : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowAppliedJob();
            }
        }

        private void ShowAppliedJob()
        {
            string query = @"SELECT ROW_NUMBER() OVER(ORDER BY aj.AppliedJobId) AS[Sr.No], 
                             aj.AppliedJobId, 
                             j.CompanyName, 
                             aj.JobId, 
                             j.Title, 
                             u.Mobile, 
                             u.Name, 
                             u.Email, 
                             u.Resume
                             FROM AppliedJobs aj
                             INNER JOIN[User] u ON aj.UserId = u.UserId
                             INNER JOIN Jobs j ON aj.JobId = j.JobId";

            con = new SqlConnection(str);
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();

            try
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fetching applied jobs: " + ex.Message);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowAppliedJob();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int appliedJobId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

                con = new SqlConnection(str);
                cmd = new SqlCommand("Delete from AppliedJobs where AppliedJobId = @id", con);
                cmd.Parameters.AddWithValue("@id", appliedJobId);

                con.Open();
                int r = cmd.ExecuteNonQuery();

                if (r > 0)
                {
                    lblMsg.Text = "Resume deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    Console.WriteLine("Resume with AppliedJobId: " + appliedJobId + " deleted successfully.");
                }
                else
                {
                    lblMsg.Text = "Cannot delete this record!";
                    lblMsg.CssClass = "alert alert-danger";
                    Console.WriteLine("Error deleting resume with AppliedJobId: " + appliedJobId);
                }

                GridView1.EditIndex = -1;
                ShowAppliedJob();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error in RowDeleting: " + ex.Message);
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to view job details";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    HiddenField jobId = (HiddenField)row.FindControl("hdnJobId");
                    Response.Redirect("JobList.aspx?id=" + jobId.Value);
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row";
                }
            }
        }

        protected string GetResumeMatchScore(string resumePath, string jobId)
        {
            if (string.IsNullOrWhiteSpace(resumePath))
            {
                Response.Write("Error: Resume path is empty.");
                return "0%";
            }

            // Get only the filename
            string fileName = System.IO.Path.GetFileName(resumePath);
            string fullPath = System.IO.Path.Combine(Server.MapPath("~/Resume/"), fileName);

            //Response.Write("Full Resume Path: " + fullPath);

            if (!File.Exists(fullPath))
            {
                Response.Write("Error: File not found at " + fullPath);
                return "0%";
            }

            string resumeText = ExtractTextFromPdf(fullPath);
            string jobKeywords = GetJobKeywords(jobId);

            if (string.IsNullOrEmpty(jobKeywords) || string.IsNullOrEmpty(resumeText))
            {
                return "0%";
            }

            int matchScore = CalculateMatchScore(resumeText, jobKeywords);
            return matchScore + "%";
        }

        // ✅ Extract Text from PDF Resume
        private string ExtractTextFromPdf(string filePath)
        {
            try
            {
                StringBuilder text = new StringBuilder();

                using (PdfReader reader = new PdfReader(filePath))
                {
                    for (int i = 1; i <= reader.NumberOfPages; i++)
                    {
                        text.Append(PdfTextExtractor.GetTextFromPage(reader, i));
                    }
                }

                string extractedText = text.ToString();
                //Response.Write("Extracted text preview: " + extractedText.Substring(0, Math.Min(extractedText.Length, 100)) + "...");
                return extractedText;
            }
            catch (Exception ex)
            {
                Response.Write("Error extracting text: " + ex.Message);
                return string.Empty;
            }
        }

        // ✅ Get Job Keywords from Database
        private string GetJobKeywords(string jobId)
        {
            string keywords = "";

            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                string query = "SELECT JobKeywords FROM Jobs WHERE JobId = @JobId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@JobId", jobId);
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        keywords = result.ToString().Trim();
                        //Response.Write("Job Keywords Retrieved for JobId " + jobId + ": " + keywords);
                    }
                    else
                    {
                        Response.Write("No keywords found for JobId: " + jobId);
                    }
                }
            }
            return keywords;
        }

        // ✅ Calculate Resume Match Score
        private int CalculateMatchScore(string resumeText, string jobKeywords)
        {
            if (string.IsNullOrEmpty(jobKeywords) || string.IsNullOrEmpty(resumeText))
            {
                //Response.Write("Error: Resume or Job Keywords are empty.");
                return 0;
            }

            // Normalize text (convert to lowercase, remove extra spaces)
            resumeText = Regex.Replace(resumeText.ToLower(), @"\s+", " ").Trim();
            jobKeywords = Regex.Replace(jobKeywords.ToLower(), @"\s+", " ").Trim();

            string[] keywordsArray = jobKeywords.Split(',').Select(k => k.Trim()).ToArray();
            int matchCount = keywordsArray.Count(keyword =>
                Regex.IsMatch(resumeText, @"\b" + Regex.Escape(keyword) + @"\b", RegexOptions.IgnoreCase));

            //Response.Write("Matching Keywords Count: " + matchCount);
            return (keywordsArray.Length == 0) ? 0 : (matchCount * 100) / keywordsArray.Length;
        }

    }
}
