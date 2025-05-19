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
    public partial class Contact : System.Web.UI.Page
    {

        SqlConnection cdn;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)    
        {

        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            try
            {
                cdn = new SqlConnection(str);
                string query = @"Insert into contact values(@Name, @Email, @Subject, @Message)";
                cmd = new SqlCommand(query, cdn);
                cmd.Parameters.AddWithValue("@Name",name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());
                cdn.Open();
                int r= cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thanks for reaching out will look into your query!";
                    lblMsg.CssClass = "alert alert-success";
                    clear();
                }

                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cannot save record now, plz try after sometime..!";
                    lblMsg.CssClass = "alert alert-danger";
                    clear();

                }
            }

            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + " '); </script>");
            }

            finally
           {
                cdn.Close();
            }

        }

        private void clear()
        {
            name.Value = string.Empty;
            email.Value = string.Empty;

            subject.Value = string.Empty;
            message.Value = string.Empty;

        }
    }
}