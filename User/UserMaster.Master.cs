using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyJobPortal.User
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["user"] != null)
            {
                lbRegisterorProfile.Text = "Profile";
                lbLoginorLogout.Text = "Logout";
            }

            else
            {
                lbLoginorLogout.Text = "Login";
                lbRegisterorProfile.Text = "Register";
            }

        }

        protected void RegisterorProfile(object sender, EventArgs e)
        {
            if (lbRegisterorProfile.Text == "Profile")
            {
                Response.Redirect("Profile.aspx");
            }

            else
            {
                Response.Redirect("Register.aspx");
            }
        }

        protected void LoginorLogout(object sender, EventArgs e)
        {

            if (lbLoginorLogout.Text == "Login")
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
    }
}