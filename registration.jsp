<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/master.css">
    <style>
        body {
            background-image: url("img/kucing1.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            background-size: cover;
            
        }

        form {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, 0.7); 
        }

        h2 {
            text-align: center;
            color: var(--primary); /* Assuming --primary is a custom variable */
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: white; /* Change label font color to white */
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white background */
            color: white; /* Change input font color to white */
        }

        input[type="submit"] {
            width: 50%;
            background-color: var(--primary); /* Assuming --primary is a custom variable */
            color: white;
            border: none;
            cursor: pointer;
            padding: 8px; /* Adjusted padding to make button smaller */
            font-size: 14px; /* Adjusted font size */
            border-radius: 3px;
            margin-left:25%;
        }

        input[type="submit"]:hover {
            background-color: #a6764a; /* Adjust hover color as needed */
        }
    </style>
</head>
<body>
<form action="RegistrationServlet" method="post">
    <h2>Create an account</h2>
    
    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" required>
    
    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    
    <input type="submit" value="Register">
</form>
</body>
</html>
