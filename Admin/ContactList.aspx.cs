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

namespace MyJobPortal.Admin
{
    public partial class ContactList : System.Web.UI.Page
    {

        SqlConnection cdn;
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
                ShowContact();
            }

        }


        private void ShowContact()

        {

            string query = string.Empty;

            cdn = new SqlConnection(str);

            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No], ContactId, Name, Email, Subject, Message from contact";

            cmd = new SqlCommand(query, cdn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            dt = new DataTable();

            sda.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();

            }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowContact();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try

            {

                GridViewRow row = GridView1.Rows[e.RowIndex];

                int contactId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

                cdn = new SqlConnection(str);

                cmd = new SqlCommand("Delete from Contact where ContactId = @id", cdn);

                cmd.Parameters.AddWithValue("@id", contactId);

                cdn.Open();

                int r = cmd.ExecuteNonQuery();

                if (r > 0)

                {

                    lblMsg.Text = "Contact deleted successfully!";

                    lblMsg.CssClass = "alert alert-success";

                }

                else

                {

                    lblMsg.Text = "Cannot delete this record!";

                    lblMsg.CssClass = "alert alert-danger";

                }

               

                GridView1.EditIndex = -1;

                ShowContact();

            }

            catch (Exception ex)

            {

                

                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
            finally
            {
                cdn.Close();
            }
        }


    }
}