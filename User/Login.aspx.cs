using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MyJobPortal.User
{
    public partial class Login : System.Web.UI.Page
    {

        SqlConnection cdn;
        SqlCommand cmd;
        SqlDataReader sdr;

        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string username, password = string.Empty;



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                username = txtusername.Text.Trim();
                password = txtPassword.Text.Trim();

                // Check for hardcoded admin credentials
                if (username == "Admin" && password == "12345")
                {
                    Session["admin"] = username;
                    Response.Redirect("../Admin/Dashboard.aspx", false);
                }



                else
                {

                    cdn = new SqlConnection(str);
                    string query = @"Select * from [User] where Username = @Username and Password = @Password";
                    cmd = new SqlCommand(query, cdn);
                    cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    
                    cdn.Open();
                    sdr = cmd.ExecuteReader();

                    if (sdr.Read())
                    {
                        Session["user"] = sdr["Username"].ToString();
                        Session["userId"] = sdr["UserId"].ToString();
                        Response.Redirect("AfterLogin.aspx", false);
                    }

                    else
                    {
                        showErrorMsg("User");
                    }

                    cdn.Close();

                }

            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + " '); </script>");
                cdn.Close();
            }

        }

        private void showErrorMsg(string userType)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "<b>" + userType + "</b> credentials are incorrect.!";
            lblMsg.CssClass = "alert alert-danger";
        }
    }
}