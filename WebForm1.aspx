<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ab._Default" %>


            <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml">

            <head runat="server">
                <title>BMI || AGE || CURRENCY</title>
                <style>
         
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            background-image:url('b3.jpg'); 
             background-repeat:no-repeat;
             background-size:cover; 
            padding: 0;
        }

        .container {

            display: flex;
           
            justify-content: space-around;
            align-items: stretch; /* Align items to stretch vertically */
            padding: 20px;
        }

        .calculator {
            width: 300px;
            min-height: 500px; /* Set a minimum height for all containers */
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 10px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column; /* Align children vertically */
        }

        .calculator h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .result {
            font-weight: bold;
            margin-top: auto; /* Push result to the bottom */
            text-align: center;
        }
        .btn-secondary {}

        
        footer {
        text-align: center;
        color: white;
        margin-top: 10px; /* Adjust as needed */
        padding: 10px;
        }
        

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
   
            <!-- BMI Calculator -->
            <div class="calculator" style="background-color:#f0f0f0">
                <h2>BMI Calculator</h2><br />
                <div class="form-group">
                    <label class="form-label" for="txtHeight">Height:</label>
                    <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" placeholder="Enter Height"></asp:TextBox>
                    <asp:RadioButtonList ID="rblHeightUnit" runat="server">
                        <asp:ListItem Text="feet with inches(example:5.5)" Value="feet" />
                    </asp:RadioButtonList>
                    <asp:TextBox ID="txtInches" runat="server" CssClass="form-control" placeholder="Inches" Visible="false"></asp:TextBox>

                </div>
                <div class="form-group">
                    <label class="form-label" for="txtWeight">Weight:</label>
                    <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="Enter Weight"></asp:TextBox>
                    <asp:RadioButtonList ID="rblWeightUnit" runat="server">
                        <asp:ListItem Text="kg" Value="kg" />
                        <asp:ListItem Text="pounds" Value="pounds" />
                    </asp:RadioButtonList>
                </div>
                <asp:Button ID="btnResetBMI" runat="server" Text="Reset" OnClick="btnResetBMI_Click" CssClass="btn btn-primary" /><br />

                <asp:Button ID="btnCalculateBMI" runat="server" Text="Calculate BMI" OnClick="btnCalculateBMI_Click" CssClass="btn btn-primary" />
                
                <div class="result">
                    <asp:Label ID="lblResultBMI" runat="server"></asp:Label>

                </div>
            </div>

            <!-- Age Calculator -->
            <div class="calculator" style="background-color:#f0f0f0">
                <h2>Age Calculator</h2><br />
                <div class="form-group">
                    <label class="form-label" for="ddlDay">Enter Your DOB:</label>
                    <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="btnResetAge_Click" CssClass="btn btn-primary" /><br />

                <asp:Button ID="btnCalculateAge" runat="server" Text="Calculate Age" OnClick="btnCalculateAge_Click" CssClass="btn btn-primary" />
                <div class="result">
                    <asp:Label ID="lblResultAge" runat="server"></asp:Label>
                </div>
            </div>

            <!-- Currency Converter -->
            <div class="calculator" style="background-color:#f0f0f0">
                <h2>Currency Converter</h2><br />
                <div class="form-group">
                    <label class="form-label" for="txtAmount">Enter Amount:</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label" for="ddlFromCurrency">From Currency:</label>
                    <asp:DropDownList ID="ddlFromCurrency" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Currency" Value="" />
                        <asp:ListItem Text="USD" Value="USD" />
                        <asp:ListItem Text="EUR" Value="EUR" />
                        <asp:ListItem Text="JPY" Value="JPY" />
                        <asp:ListItem Text="GBP" Value="GBP" />
                        <asp:ListItem Text="AUD" Value="AUD" />
                        <asp:ListItem Text="CAD" Value="CAD" />
                        <asp:ListItem Text="CHF" Value="CHF" />
                        <asp:ListItem Text="CNY" Value="CNY" />
                        <asp:ListItem Text="SEK" Value="SEK" />
                        <asp:ListItem Text="NZD" Value="NZD" />
                        <asp:ListItem Text="INR" Value="INR" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label" for="ddlToCurrency">To Currency:</label>
                    <asp:DropDownList ID="ddlToCurrency" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select Currency" Value="" />
                        <asp:ListItem Text="USD" Value="USD" />
                        <asp:ListItem Text="EUR" Value="EUR" />
                        <asp:ListItem Text="JPY" Value="JPY" />
                        <asp:ListItem Text="GBP" Value="GBP" />
                        <asp:ListItem Text="AUD" Value="AUD" />
                        <asp:ListItem Text="CAD" Value="CAD" />
                        <asp:ListItem Text="CHF" Value="CHF" />
                        <asp:ListItem Text="CNY" Value="CNY" />
                        <asp:ListItem Text="SEK" Value="SEK" />
                        <asp:ListItem Text="NZD" Value="NZD" />
                        <asp:ListItem Text="INR" Value="INR" />
                    </asp:DropDownList>
                </div>
                <asp:Button ID="Button3" runat="server" Text="Reset" OnClick="btnResetCurrency_Click" CssClass="btn btn-primary" /><br />
                <asp:Button ID="btnConvertCurrency" runat="server" Text="Convert" OnClick="btnConvertCurrency_Click" CssClass="btn btn-primary" />
                <div class="result">
                    <asp:Label ID="lblResultCurrency" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
    <footer>
    <p>&copy; 2024 || ABHISHEK</p>
</footer>
</body>
</html>
