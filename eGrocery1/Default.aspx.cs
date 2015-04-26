using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eGrocery1
{
    public partial class Default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                register.Visible = true;
                login.Visible = false;

                btn_registerLink.Style.Add("background", "#00ffff");
            }
            
            
        }

        protected void btn_registerLink_OnClick(object sender, EventArgs e)
        {
            register.Visible = true;
            btn_registerLink.Style.Add("background", "#00ffff");

            login.Visible = false;
            btn_loginLink.Style.Remove("background");
        }

        protected void btn_loginLink_OnClick(object sender, EventArgs e)
        {
            login.Visible = true;
            btn_loginLink.Style.Add("background", "#00ffff");

            register.Visible = false;
            btn_registerLink.Style.Remove("background");
        }

        protected void btn_Register_OnClick(object sender, EventArgs e)
        {
            User u = new User();
            u.Name = txt_Name.Text;
            u.Username = txt_Userid.Text;
            u.Password = txt_Password.Value;
            u.Email = txt_Email.Text;
            u.Type = ddl_Type.SelectedValue;


            using (SampleDataContext sd = new SampleDataContext())
            {
                List<String> usernames =  (from s in sd.Users
                            select s.Username).ToList();
                if (!usernames.Contains(u.Username))
                {
                    sd.Users.InsertOnSubmit(u);
                    sd.SubmitChanges();
                }
                else 
                {
                    lbl_userRegister.Text = "Username already exists!";
                }
            }

        }
        protected void btn_Login_OnClick(object sender, EventArgs e)
        {
            User loginUser = null;
            using (SampleDataContext sd = new SampleDataContext())
            {
                loginUser = (User)(from u in sd.Users
                                  where u.Username == txt_login_userid.Text && u.Password == txt_login_password.Value
                                select u).FirstOrDefault();
            }

            if (loginUser != null)
            {
                if (loginUser.Type == "Owner")
                    Response.Redirect("Admin.aspx");
                else if (loginUser.Type == "Employee")
                    Response.Redirect("Employee.aspx");
            }
            else
            {
                lbl_credentials.Text = "Incorrect username or password!";
            }
        }
    }
}