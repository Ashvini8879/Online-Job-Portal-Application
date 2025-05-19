using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;


namespace MyJobPortal.User
{
    public partial class ResumeBuild : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    showUserInfo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        private void showUserInfo()

        {

            try
            {
                con = new SqlConnection(str);

                string query = "Select * from [User] where UserId=@userId";

                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@userId", Request.QueryString["id"]);

                con.Open();

                sdr = cmd.ExecuteReader();

                if (sdr.HasRows)

                {

                    if (sdr.Read())

                    {
                        txtusername.Text = sdr["Username"].ToString();

                        txtFullName.Text = sdr["Name"].ToString();

                        txtEmail.Text = sdr["Email"].ToString();

                        txtMobileNumber.Text = sdr["Mobile"].ToString();

                        txtTenth.Text = sdr["TenthGrade"].ToString();

                        txtTwelfth.Text = sdr["TwelveGrade"].ToString();

                        txtGraduation.Text = sdr["GraduationGrade"].ToString();

                        txtPostGraduation.Text = sdr["PostGraduationGrade"].ToString();

                        txtPhd.Text = sdr["Phd"].ToString();

                        txtWork.Text = sdr["Workson"].ToString();

                        txtExperience.Text = sdr["Experience"].ToString();

                        txtAddress.Text = sdr["Address"].ToString();

                        DropDownList1.SelectedValue = sdr["Country"].ToString();
                    }

                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "User not found!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }

            finally
            {
                con.Close();
            }


        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)

        {
            
            try

            {

                if (Request.QueryString["id"] != null)

                {

                    string concatquery = string.Empty;
                    string filePath = string.Empty;

                    //bool isValidToExecute= false;
                    bool isValid = false;

                    con = new SqlConnection(str);

                    if (fuResume.HasFile)

                    {

                        if (Utils.IsValidExtensionResume(fuResume.FileName))

                        {

                            concatquery = "Resume=@resume,";
                            isValid = true;


                        }

                        else
                        {
                            concatquery = string.Empty;
                            
                        }

                    }

                    else

                    {
                        concatquery = string.Empty;
                    }

                    query = @"Update [User] set Username=@Username, Name=@Name, Email=@Email, Mobile=@Mobile, TenthGrade=@TenthGrade, TwelveGrade=@TwelveGrade, GraduationGrade=@GraduationGrade, PostGraduationGrade=@PostGraduationGrade, Phd=@PHD, WorksOn=@WorksOn, 
              Experience=@Experience," + concatquery + " Address=@Address, Country=@Country where UserId=@UserId";


                    cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());

                    cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());

                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                    cmd.Parameters.AddWithValue("@Mobile", txtMobileNumber.Text.Trim());

                    cmd.Parameters.AddWithValue("@TenthGrade", txtTenth.Text.Trim());

                    cmd.Parameters.AddWithValue("@TwelveGrade", txtTwelfth.Text.Trim());

                    cmd.Parameters.AddWithValue("@GraduationGrade", txtGraduation.Text.Trim());

                    cmd.Parameters.AddWithValue("@PostGraduationGrade", txtPostGraduation.Text.Trim());

                    cmd.Parameters.AddWithValue("@PHD", txtPhd.Text.Trim());

                    cmd.Parameters.AddWithValue("@WorksOn", txtWork.Text.Trim());

                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());

                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

                    cmd.Parameters.AddWithValue("@Country", DropDownList1.SelectedValue);

                    cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidExtensionResume(fuResume.FileName))
                        {
                            string filePath1 = "Resume/" + fuResume.FileName;

                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resume/") + fuResume.FileName);

                            cmd.Parameters.AddWithValue("@resume", filePath1);

                            isValid = true;
                        }
                        else
                        {
                            concatquery = string.Empty;
                            lblMsg.Visible = true;
                            lblMsg.Text = "Please select .doc, .docx, .pdf file for resume!";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValid = true;
                    }

                    if (isValid)

                    {

                        con.Open();

                        int r = cmd.ExecuteNonQuery();

                        if (r > 0)

                        {

                            lblMsg.Visible = true;

                            lblMsg.Text = "Resume details updated successful..!";

                            lblMsg.CssClass = "alert alert-success";

                        }

                        else

                        {

                            lblMsg.Visible = true;

                            lblMsg.Text = "Cannot update the records, please try after sometime..!";

                            lblMsg.CssClass = "alert alert-danger";

                        }
                    }

                }

                else

                {

                    lblMsg.Visible = true;

                    lblMsg.Text = "Cannot update the records, please try <b>Re-Login</b>..!";

                    lblMsg.CssClass = "alert alert-danger";

                }

            }

            catch (SqlException ex)

            {

                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))

                {

                    lblMsg.Visible = true;

                    lblMsg.Text = "<b>" + txtusername.Text.Trim() + "</b> username already exist, try new one..!";

                    lblMsg.CssClass = "alert alert-danger";

                }

                else

                {

                }

                Response.Write("<script>alert('" + ex.Message + "'); </script>");

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

    }
}
