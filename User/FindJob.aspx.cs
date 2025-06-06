﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MyJobPortal.User
{
    public partial class FindJob : System.Web.UI.Page
    {
        SqlConnection con;

        SqlCommand cmd;

        SqlDataAdapter sda;

        DataTable dt;

        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public int jobCount = 0;

      protected void Page_Load(object sender, EventArgs e)

        {

            if (!IsPostBack)

            {
                showJobList();

                RBSelectedColorChange();

            }

        }

        private void showJobList()

        {

            if (dt == null)

            {

                con = new SqlConnection(str);

                string query = @"Select JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate from Jobs";

                cmd = new SqlCommand(query, con);

                sda = new SqlDataAdapter(cmd);

                dt = new DataTable();

                sda.Fill(dt);

            }

            DataList1.DataSource = dt;

            DataList1.DataBind();

            lbljobCount.Text = JobCount(dt.Rows.Count);
        }


        string JobCount(int count)

        {

            if (count > 1)

            {

                return "Total <b>" + count + "</b> jobs found";
            }

            else if (count == 1)

            {

                return "Total <b>" + count + "</b> job found";

            }

            else

            {

                return "No job found";

            }

         }



        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedValue != "0")

            {

                con = new SqlConnection(str);

                string query = @"Select JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate from Jobs where Country ='" + ddlCountry.SelectedValue + " ' ";

                cmd = new SqlCommand(query, con);

                sda = new SqlDataAdapter(cmd);

                dt = new DataTable();

                sda.Fill(dt);

                showJobList();

                RBSelectedColorChange();

            }

            else

            {

                showJobList();

                RBSelectedColorChange();
            }

        }


        // Setting default image if their is no image for any job.

        protected string GetImageUrl(Object url)

        {

            string url1 = "";

            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)

            {

                url1 = "~/Images/No_image.jpg";

            }

            else

            {

                url1 = string.Format("~/{0}", url);

            }

            return ResolveUrl(url1);

        }


        // Getting RelativeDate for given date like '1 month ago'

        public static string RelativeDate(DateTime theDate)
        {
            Dictionary<long, string> thresholds = new Dictionary<long, string>();
            int minute = 60;
            int hour = 60 * minute;
            int day = 24 * hour;
            int month = 30 * day;
            int year = 365 * day;

            thresholds.Add(60, "{0} seconds ago");
            thresholds.Add(2 * minute, "a minute ago");
            thresholds.Add(45 * minute, "{0} minutes ago");
            thresholds.Add(120 * minute, "an hour ago");
            thresholds.Add(day, "{0} hours ago");
            thresholds.Add(2 * day, "yesterday");
            thresholds.Add(month, "{0} days ago");
            thresholds.Add(2 * month, "a month ago");
            thresholds.Add(year, "{0} months ago");
            thresholds.Add(2 * year, "a year ago");
            thresholds.Add(long.MaxValue, "{0} years ago");

            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;

            foreach (long threshold in thresholds.Keys)
            {
                if (since < threshold)
                {
                    TimeSpan t = DateTime.Now - theDate;

                    // Correct the conversion logic
                    if (t.TotalDays >= 365)
                    {
                        return string.Format(thresholds[threshold], (int)(t.TotalDays / 365));
                    }
                    if (t.TotalDays >= 30)
                    {
                        return string.Format(thresholds[threshold], (int)(t.TotalDays / 30));
                    }
                    if (t.TotalDays >= 1)
                    {
                        return string.Format(thresholds[threshold], (int)t.TotalDays);
                    }
                    if (t.TotalHours >= 1)
                    {
                        return string.Format(thresholds[threshold], (int)t.TotalHours);
                    }
                    if (t.TotalMinutes >= 1)
                    {
                        return string.Format(thresholds[threshold], (int)t.TotalMinutes);
                    }

                    return string.Format(thresholds[threshold], (int)t.TotalSeconds);
                }
            }

            return "just now";
        }




        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string jobType = string.Empty;

            jobType = selectedCheckBox();

            if (jobType != " ")

            {

                con = new SqlConnection(str);

                string query = @"Select JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate from Jobs
        where JobType IN (" + jobType + ")";


                cmd = new SqlCommand(query, con);

                sda = new SqlDataAdapter(cmd);

                dt = new DataTable();

                sda.Fill(dt);

                showJobList();

                RBSelectedColorChange();

            }

            else

            {

                showJobList();

            }

        }

        string selectedCheckBox()
        {
            List<string> jobTypes = new List<string>();

            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    string sanitizedJobType = System.Text.RegularExpressions.Regex.Replace(
                        item.Text
                            .Replace("\u00A0", " ") // Convert non-breaking space to normal space
                            .Replace("&nbsp;", " ") // Convert HTML-encoded spaces
                            .Replace("\n", " ")     // Remove newline characters
                            .Replace("\r", " ")     // Remove carriage return characters
                            .Replace("\t", " ")     // Remove tab characters
                            .Trim(),                // Trim leading/trailing spaces
                        @"\s+", " ")                // **Replace multiple spaces with a single space**
                        .Replace("'", "''");         // Escape single quotes for SQL safety

                    jobTypes.Add($"N'{sanitizedJobType}'");
                }
            }

            string jobTypeQueryString = jobTypes.Count > 0 ? string.Join(",", jobTypes) : "''";
            //System.Diagnostics.Debug.WriteLine("JobType Query String: " + jobTypeQueryString);

            return jobTypeQueryString;
        }







        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue != "-1") // Fix: Handle "Any" correctly
            {
                string postedDate = selectedRadioButton();
                con = new SqlConnection(str);
                string query = @"SELECT JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate 
                         FROM Jobs WHERE Convert (DATE, CreateDate) " + postedDate;

                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        string selectedRadioButton()
        {
            string postedDate = string.Empty;
            DateTime date = DateTime.Today;

            if (RadioButtonList1.SelectedValue == "0") // Fix: Handle Today case
            {
                postedDate = "= Convert (DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "1")
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-1).ToString("yyyy/MM/dd") + "') and Convert (DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {
                postedDate = "between Convert(DATE,'" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd") + "') and Convert (DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "3")
            {
                postedDate = "between Convert(DATE, '" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert (DATE, '" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "4")
            {
                postedDate = "between Convert(DATE, '" + DateTime.Now.AddDays(-5).ToString("yyyy/MM/dd") + "') and Convert (DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "5")
            {
                postedDate = "between Convert(DATE, '" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert (DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else
            {
                postedDate = "between Convert(DATE, '" + DateTime.Now.AddDays(-30).ToString("yyyy/MM/dd") + "') and Convert (DATE, '" + date.ToString("yyyy/MM/dd") + "')";
            }

            return postedDate;
        }


        protected void lbFilter_Click(object sender, EventArgs e)
        {
            try

            {



                bool isCondition = false;

                string subquery = string.Empty;

                string jobType = string.Empty;

                string postedDate = string.Empty;

                string addAnd = string.Empty;

                string query = string.Empty;

                List<string> queryList = new List<string>();

                con = new SqlConnection(str);

                if (ddlCountry.SelectedValue != "0")

                {

                    queryList.Add("Country = '" + ddlCountry.SelectedValue + "' ");


                    isCondition = true;

                }


                jobType = selectedCheckBox();



                if (jobType != "")

                {

                    queryList.Add(" JobType IN (" + jobType + ") ");

                    isCondition = true;

                }

                if (RadioButtonList1.SelectedValue != "0")

                {

                    postedDate = selectedRadioButton();

                    queryList.Add(" Convert (DATE, CreateDate) " + postedDate);


                    isCondition = true;

                }

                if (isCondition)

                {

                    foreach (string a in queryList)

                    {

                        subquery += a + " and ";
                    }

                    subquery = subquery.Remove(subquery.LastIndexOf("and"), 3);

                    query = @"Select JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate from Jobs where " + subquery + " ";

                }

                else

                {

                    query = @"Select JobId, Title, Salary, Job Type, CompanyName, CompanyImage, Country, State, CreateDate from Jobs";
                }


                SqlDataAdapter sda = new SqlDataAdapter(query, con);

                dt = new DataTable();

                sda.Fill(dt);

                showJobList();

                RBSelectedColorChange();

            }

            catch (Exception ex)

            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }



            finally

            {
                con.Close();
            }



        }





                protected void lbReset_Click(object sender, EventArgs e)
        {
            ddlCountry.ClearSelection();

            CheckBoxList1.ClearSelection();

            RadioButtonList1.SelectedValue = "-1";

            RBSelectedColorChange();

            showJobList(); 
        }

        void RBSelectedColorChange()

        {

            if (RadioButtonList1.SelectedItem.Selected == true)

            {

                RadioButtonList1.SelectedItem.Attributes.Add("class", "selectedradio");

            }

        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();

            if (!string.IsNullOrEmpty(keyword))
            {
                con = new SqlConnection(str);
                string query = @"SELECT JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate 
                         FROM Jobs 
                         WHERE Title LIKE @keyword OR CompanyName LIKE @keyword";

                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");

                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                DataList1.DataSource = dt;
                DataList1.DataBind();

                lbljobCount.Text = JobCount(dt.Rows.Count);
            }
            else
            {
                showJobList();
            }
        }


    }
}