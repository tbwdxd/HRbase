using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication3
{
    public partial class LogIn : System.Web.UI.Page
    {
        public string conString = "Data Source=DESKTOP-FTCTJD0;Initial Catalog=HRbase;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_login_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();
            string ChkEmailID = "select EMail from Users where EMail='" + txtemail.Text + "')";
            SqlCommand emailtemp = new SqlCommand(ChkEmailID, conn);
            string email = emailtemp.ExecuteScalar().ToString();
            conn.Close();
            if (email == txtemail.Text)
            {
                conn.Open();
                string ChkPassword = "select Password from Users where EMail='" + txtemail.Text + "'";
                SqlCommand passcmd = new SqlCommand(ChkPassword, conn);
                string password = passcmd.ExecuteScalar().ToString().Replace(" ","");
                if(password == txtpassword.Text)
                {
                    Session["New"] = txtemail.Text;
                    Response.Write("Password is correct");
                }
                else
                {
                    Response.Write("Password is NOT correct");
                }
                conn.Close();
            }
            else
            {
                Response.Write("Email is NOT correct");
            }
            
            
        }

    }
}
