﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyJobPortal.Admin
{
    public partial class UserList : System.Web.UI.Page
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
                ShowUsers();
            }

        }


        private void ShowUsers()

        {

            string query = string.Empty;

            cdn = new SqlConnection(str);

            query = @"Select Row_Number() over(Order by (Select 1)) as [Sr.No], UserId, Name, Email, Mobile, Country from [User]";

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
            ShowUsers();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try

            {

                GridViewRow row = GridView1.Rows[e.RowIndex];

                int userId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);

                cdn = new SqlConnection(str);

                cmd = new SqlCommand("Delete from [User] where UserId = @id", cdn);

                cmd.Parameters.AddWithValue("@id", userId);

                cdn.Open();

                int r = cmd.ExecuteNonQuery();

                if (r > 0)

                {

                    lblMsg.Text = "User deleted successfully!";

                    lblMsg.CssClass = "alert alert-success";

                }

                else

                {

                    lblMsg.Text = "Cannot delete this record!";

                    lblMsg.CssClass = "alert alert-danger";

                }

                

                GridView1.EditIndex = -1;

                ShowUsers();

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