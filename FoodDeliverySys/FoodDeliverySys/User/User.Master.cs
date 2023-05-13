using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDeliverySys.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                formPage.Attributes.Add("class", "sub_page");
            }
            else
            {
                formPage.Attributes.Remove("class");
                // Load the control
                Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");
                // Add the control to the panel
                pnlSliderUserControl.Controls.Add(sliderUserControl);
            }

            if (Session["userId"] != null)
            {
                lbLoginOrLogout.Text = "Выйти";
            }
            else
            {
                lbLoginOrLogout.Text = "Войти";
            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
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