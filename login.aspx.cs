using System;
using System.Configuration;
using System.Data.SqlClient;

namespace project1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Add your login logic here
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            if (ValidateUser(username, password))
            {
                // Redirect to the home page or any other secure page
                Response.Redirect("~/WebForm1.aspx");
            }
            else
            {
                Response.Write("Invalid credentials");
            }
        }

        private bool ValidateUser(string username, string password)
        {
            bool isValid = false;

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                int count = (int)command.ExecuteScalar();

                if (count > 0)
                {
                    // User exists with the provided credentials
                    isValid = true;
                }
            }

            return isValid;
        }




    }
}
