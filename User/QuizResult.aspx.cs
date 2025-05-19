using System;
using System.Web.UI;

namespace MyJobPortal.User
{
    public partial class QuizResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get score and total from query string
                int score = 0;
                int total = 0;

                if (int.TryParse(Request.QueryString["score"], out score) && int.TryParse(Request.QueryString["total"], out total))
                {
                    // Display the score
                    lblScore.Text = $"Your Score: {score} / {total}";

                    // Calculate the percentage
                    double percentage = ((double)score / total) * 100;

                    // Display different messages based on the score
                    if (percentage >= 80)
                    {
                        msg.InnerText = "✅ Excellent! You are ready to apply for this job.";
                        msg.Style["color"] = "green";
                    }
                    else if (percentage >= 50)
                    {
                        msg.InnerText = "⚠️ Good effort! A little more prep needed before applying.";
                        msg.Style["color"] = "#ff9800";
                    }
                    else
                    {
                        msg.InnerText = "❌ Sorry! You're not ready to apply for this job yet.";
                        msg.Style["color"] = "red";
                    }
                }
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Default1.aspx");
        }
    }
}
