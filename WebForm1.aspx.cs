using System;
using System.Web.UI.WebControls;
//using System.Net.Http;
//using System.Threading.Tasks;
//using System.Web.Script.Serialization;
using System.Collections.Generic;

namespace ab
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void rblHeightUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtInches.Visible = (rblHeightUnit.SelectedValue == "feet");
        }

        protected void btnResetBMI_Click(object sender, EventArgs e)
        {
            // Reset BMI-related controls
            txtHeight.Text = string.Empty;
            txtInches.Text = string.Empty;
            txtWeight.Text = string.Empty;
            lblResultBMI.Text = string.Empty;
        }

        protected void btnResetAge_Click(object sender, EventArgs e)
        {
            // Reset Age-related controls
            ddlDay.SelectedIndex = 0;
            ddlMonth.SelectedIndex = 0;
            ddlYear.SelectedIndex = 0;
            lblResultAge.Text = string.Empty;
        }

        protected void btnResetCurrency_Click(object sender, EventArgs e)
        {
            // Reset Currency-related controls
            txtAmount.Text = string.Empty;
            ddlFromCurrency.SelectedIndex = 0;
            ddlToCurrency.SelectedIndex = 0;
            lblResultCurrency.Text = string.Empty;
        }

        protected void btnCalculateBMI_Click(object sender, EventArgs e)
        {
            // Validate input
            if (string.IsNullOrWhiteSpace(txtHeight.Text) || string.IsNullOrWhiteSpace(txtWeight.Text))
            {
                lblResultBMI.Text = "Please enter valid values.";
                return;
            }

            // Parse height input values
            if (!double.TryParse(txtHeight.Text, out double height))
            {
                lblResultBMI.Text = "Invalid input. Please enter numeric values for height.";
                return;
            }

            // Parse weight input values
            if (!double.TryParse(txtWeight.Text, out double weight))
            {
                lblResultBMI.Text = "Invalid input. Please enter numeric values for weight.";
                return;
            }

            // Convert weight to kilograms if in pounds
            if (rblWeightUnit.SelectedValue == "pounds")
            {
                weight *= 0.45359237;
            }

            // If height is in feet, convert to meters
            if (rblHeightUnit.SelectedValue == "feet")
            {
                height *= 0.3048; // Convert feet to meters
            }

            // Calculate BMI
            double bmi = weight / Math.Pow(height, 2);

            // Display result
            lblResultBMI.Text = $"BMI: {bmi:F2} - {CategorizeBMI(bmi)}";
        }



        // Function to categorize BMI
        private string CategorizeBMI(double bmi)
        {
            if (bmi < 18.5)
                return "UNDERWEIGHT";
            else if (bmi >= 18.5 && bmi < 24.9)
                return "HEATHY WEIGHT";
            else if (bmi >= 25.0 && bmi < 29.9)
                return "OVERWEIGHT";
            else
                return "OBESITY";
        }

// end of BMI

// start of Age
        protected void btnCalculateAge_Click(object sender, EventArgs e)
        {
            string day = ddlDay.SelectedValue;
            string month = ddlMonth.SelectedValue;
            string year = ddlYear.SelectedValue;

            if (string.IsNullOrWhiteSpace(day) || string.IsNullOrWhiteSpace(month) || string.IsNullOrWhiteSpace(year))
            {
                lblResultAge.Text = "Please select your birthday";
            }
            else
            {
                DateTime birthdayDate = new DateTime(int.Parse(year), int.Parse(month), int.Parse(day));
                DateTime currentDate = DateTime.Now;

                int years = currentDate.Year - birthdayDate.Year;
                int months = currentDate.Month - birthdayDate.Month;
                int days = currentDate.Day - birthdayDate.Day;

                // Adjust age components if needed
                if (days < 0)
                {
                    months--;
                    days += DateTime.DaysInMonth(currentDate.Year, currentDate.Month - 1);
                }

                if (months < 0)
                {
                    years--;
                    months += 12;
                }

                lblResultAge.Text = $"YOU ARE {years} YEARS, {months} MONTHS, AND {days} DAYS OLD.";
            }
        }
        //end of Age

        // start of currency
        protected void btnConvertCurrency_Click(object sender, EventArgs e)
        {
            // Validate input
            if (string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                lblResultCurrency.Text = "Please enter a valid amount.";
                return;
            }

            // Parse input values
            if (!double.TryParse(txtAmount.Text, out double amount))
            {
                lblResultCurrency.Text = "Invalid input. Please enter a numeric value.";
                return;
            }

            // Get selected currencies
            string fromCurrency = ddlFromCurrency.SelectedValue;
            string toCurrency = ddlToCurrency.SelectedValue;

            // Get the exchange rate
            double exchangeRate = GetExchangeRate(fromCurrency, toCurrency);

            if (exchangeRate > 0)
            {
                // Perform currency conversion
                double convertedAmount = amount * exchangeRate;

                // Display result
                lblResultCurrency.Text = $"{amount} {fromCurrency} = {convertedAmount:F2} {toCurrency}";
            }
            else
            {
                lblResultCurrency.Text = "Error fetching exchange rate. Please try again later.";
            }
        }

        // Method to get exchange rate
        private double GetExchangeRate(string fromCurrency, string toCurrency)
        {
            // You can implement your own logic to get exchange rates
            // For simplicity, I'll return some predefined rates

            Dictionary<string, double> exchangeRates = new Dictionary<string, double>
    {
        {"USD", 1.0},
        {"EUR", 0.85},
        {"JPY", 110.0},
        {"GBP", 0.73},
        {"AUD", 1.35},
        {"CAD", 1.26},
        {"CHF", 0.92},
        {"CNY", 6.48},
        {"SEK", 8.42},
        {"NZD", 1.47},
        {"INR", 83.16} // You can replace this with a real API call
    };

            if (exchangeRates.ContainsKey(fromCurrency) && exchangeRates.ContainsKey(toCurrency))
            {
                return exchangeRates[toCurrency] / exchangeRates[fromCurrency];
            }

            // Handle error
            return -1;
        }


        // start of page load

        protected void Page_Load(object sender, EventArgs e)
        {
    if (!IsPostBack)
    {
        // Populate day DropDownList
        ddlDay.Items.Add(new ListItem("Select Day", ""));
        for (int day = 1; day <= 31; day++)
        {
            ddlDay.Items.Add(day.ToString());
        }

        // Populate month DropDownList
        ddlMonth.Items.Add(new ListItem("Select Month", ""));
        for (int month = 1; month <= 12; month++)
        {
            ddlMonth.Items.Add(month.ToString());
        }

        // Populate year DropDownList (adjust the range based on your requirements)
        ddlYear.Items.Add(new ListItem("Select Year", ""));
        int currentYear = DateTime.Now.Year;
        for (int year = currentYear; year >= currentYear - 100; year--)
        {
            ddlYear.Items.Add(year.ToString());
        }
    }
}

     
    }
}
