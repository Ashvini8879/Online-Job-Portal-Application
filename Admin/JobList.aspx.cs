﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Drawing;

namespace MyJobPortal.Admin
{

    public partial class JobList : System.Web.UI.Page
    {
        SqlConnection cdn;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;


        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowJob();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowJob();

        }

        private void ShowJob()

        {

            string query = string.Empty;

            cdn = new SqlConnection(str);

            query = @"Select Row_Number() over (Order by (Select 1)) as [Sr.No], JobId, Title, NoOfPost, Qualification, Experience,

LastDateToApply, CompanyName, Country, State, CreateDate from Jobs";

            cmd = new SqlCommand(query, cdn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            dt = new DataTable();

            sda.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
            if (Request.QueryString["id"] != null)

            {

                linkBack.Visible = true;

            }

        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowJob();
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)

        {

            try

            {


                GridViewRow row = GridView1.Rows[e.RowIndex];

                int jobId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

                cdn = new SqlConnection(str);

                cmd = new SqlCommand("Delete from Jobs where JobId = @id", cdn);

                cmd.Parameters.AddWithValue("@id", jobId);

                cdn.Open();

                int r = cmd.ExecuteNonQuery();

                if (r > 0)

                {

                    lblMsg.Text = "Job deleted successfully!";

                    lblMsg.CssClass = "alert alert-success";

                    

                }

                else

                {

                    lblMsg.Text = "Cannot delete this record!";

                    lblMsg.CssClass = "alert alert-danger";

                }

             

                GridView1.EditIndex = -1;

                ShowJob();

            }

            catch (Exception ex)

            {

              

                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

            finally
            {
                cdn.Close();
            }

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EditJob")
            {
                Response.Redirect("NewJob.aspx?id=" + e.CommandArgument.ToString());
            }
        }

       

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)

            {

                e.Row.ID = e.Row.RowIndex.ToString();

                if (Request.QueryString["id"] != null)

                {

                    int jobId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);

                    if (jobId == Convert.ToInt32(Request.QueryString["id"]))

                    {

                        e.Row.BackColor = ColorTranslator.FromHtml("#A1DCF2");

                    }

                }

            }

        }
    }

}