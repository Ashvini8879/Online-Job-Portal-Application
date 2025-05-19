using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace MyJobPortal.User
{
    public partial class Quiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string jobId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(jobId))
                {
                    LoadQuizQuestions(jobId);
                }
            }
        }

        private void LoadQuizQuestions(string jobId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM JobQuizQuestions WHERE JobId = @JobId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@JobId", jobId);
                conn.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                Repeater1.DataSource = rdr;
                Repeater1.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int score = 0;

            foreach (RepeaterItem item in Repeater1.Items)
            {
                RadioButtonList rbl = (RadioButtonList)item.FindControl("rblOptions");
                HiddenField hfCorrect = (HiddenField)item.FindControl("hfCorrect");

                if (rbl != null && hfCorrect != null && rbl.SelectedValue == hfCorrect.Value)
                {
                    score++;
                }
            }

            // Redirect to QuizResult.aspx and pass the score and total as query string parameters
            Response.Redirect($"QuizResult.aspx?score={score}&total={Repeater1.Items.Count}");
        }



        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rbl = (RadioButtonList)e.Item.FindControl("rblOptions");
                HiddenField hfCorrect = (HiddenField)e.Item.FindControl("hfCorrect");

                var row = (System.Data.Common.DbDataRecord)e.Item.DataItem;

                rbl.Items.Add(new ListItem(row["OptionA"].ToString(), "A"));
                rbl.Items.Add(new ListItem(row["OptionB"].ToString(), "B"));
                rbl.Items.Add(new ListItem(row["OptionC"].ToString(), "C"));
                rbl.Items.Add(new ListItem(row["OptionD"].ToString(), "D"));
            }
        }

    }
}
