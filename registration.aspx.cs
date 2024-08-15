using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


namespace project1
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your Page_Load logic here
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Your ddlCountry_SelectedIndexChanged logic here
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get user input from form fields
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string country = ddlCountry.SelectedItem.Text; // Assuming you want to capture the selected country

            // Insert user into the database
            RegisterUser(username, email, password, country);
        }

        private void RegisterUser(string username, string email, string password, string country)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Password, Email, Country) VALUES (@Username, @Password, @Email, @Country)";
                SqlCommand command = new SqlCommand(query, connection);

                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Country", country);

                connection.Open();
                command.ExecuteNonQuery();
            }

            // Redirect to login page after successful registration
            Response.Redirect("login.aspx");
        }

    }
}