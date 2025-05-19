using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace MyJobPortal.User
{
    public partial class Register : System.Web.UI.Page
    {

        SqlConnection cdn;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (!IsValidPassword(txtPassword.Text.Trim()))
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Password must be at least 8 characters long, include uppercase, lowercase, digit, and special character.";
                lblMsg.CssClass = "alert alert-danger";
                return;
            }

            try
            {
                using (cdn = new SqlConnection(str))
                {
                    cdn.Open();

                    // Check if the username already exists
                    string checkQuery = "SELECT COUNT(*) FROM [User] WHERE Username = @Username";
                    using (cmd = new SqlCommand(checkQuery, cdn))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());
                        int userExists = (int)cmd.ExecuteScalar();

                        if (userExists > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Username already exists. Please choose another.";
                            lblMsg.CssClass = "alert alert-danger";
                            return;
                        }
                    }

                    // Insert user details
                    string insertQuery = @"INSERT INTO [User] 
                (Username, Password, Name, Address, Mobile, Email, Country) 
                VALUES 
                (@Username, @Password, @Name, @Address, @Mobile, @Email, @Country)";

                    using (cmd = new SqlCommand(insertQuery, cdn))
                    {
                        cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Mobile", txtMobileNumber.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Country", DropDownList1.SelectedValue);

                        cmd.ExecuteNonQuery();

                        lblMsg.Visible = true;
                        lblMsg.Text = "Registration successful!";
                        lblMsg.CssClass = "alert alert-success";

                        // Optional: Clear the fields
                        ClearForm();

                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
        }

    

        private bool IsValidPassword(string password)
        {
            string pattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
            return System.Text.RegularExpressions.Regex.IsMatch(password, pattern);
        }

        private void ClearForm()
        {
            txtusername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtFullName.Text = "";
            txtAddress.Text = "";
            txtMobileNumber.Text = "";
            txtEmail.Text = "";
            DropDownList1.SelectedIndex = 0;
        }

    }
}
