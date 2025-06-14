<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
    <meta http-equiv="X-UA-Compatible" content="IE-Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pet Shop</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700;1,700&display=swap" rel="stylesheet" />
    <!-- Feather Icons -->
    <script src="https://unpkg.com/feather-icons"></script>
    <!-- My Style -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/master.css" />
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: black;
            color: white;
        }

        .menu {
            flex: 1;
        }

        .menu-card {
            border-radius: 10%;
            overflow: hidden;
            margin: 20px;
            flex: 1 0 21%;
            max-width: 300px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: black;
            color: white;
        }

        .menu-card img {
            border-radius: 10%;
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .menu-card-title {
            font-size: 1.5em;
            font-weight: 700;
            margin: 10px 0;
            color: white;
        }

        .menu-card-price {
            font-size: 1.2em;
            color: white;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }

        .btn- {
            background-color: #b6895b;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            font-size: 1em;
            border-radius: 25px;
            transition: background-color 0.3s;
            margin: 20px auto;
            display: block;
        }

        .btn-:hover {
            background-color: #a67b4a;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: black;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 300px;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            color: white;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .modal-content p {
            margin-bottom: 20px;
        }

        .modal-content .btn-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        .modal-content .btn-container .btn- {
            width: 48%;
        }

        .hover-menu {
            position: relative;
            display: inline-block;
        }

        .hover-menu-content {
            display: none;
            position: absolute;
            background-color: black;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .hover-menu-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .hover-menu:hover .hover-menu-content {
            display: block;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />

    <!-- adoption section start -->
    <section id="shop" class="menu">
        <h2><span>Share Your</span> Love</h2>
        <p>Every pet deserves a loving home. Browse through our adorable companions and give them the forever family they?ve been waiting for. Your new best friend is just a click away!</p>
        <div class="row">
            <%
                // Database connection setup
                String jdbcURL = "jdbc:mysql://localhost:3306/petshop"; // Replace with your database details
                String jdbcUsername = "root";
                String jdbcPassword = "admin";

                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                    String selectAllPetsSQL = "SELECT * FROM Pets";
                    preparedStatement = connection.prepareStatement(selectAllPetsSQL);
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        String title = resultSet.getString("title");
                        String details = resultSet.getString("details");
                        String image = resultSet.getString("image");
            %>
            <div class="menu-card">
                <img src="<%= request.getContextPath() + "/" + image %>" alt="<%= title %>" class="menu-card-img" />
                <h2 class="menu-card-title" style="color:#b6895b">-<%= name %> -</h2>
                <h3 class="menu-card-title"> <%= title %> </h3>
                <p class="menu-card-price"><%= details %></p>
                <button type="button" class="btn- requestAdoptionBtn" data-id="<%= id %>">Request Adoption</button>
            </div>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (preparedStatement != null) preparedStatement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
        <button type="button" class="btn" id="uploadButton">Pet for Adoption</button>
    </section>
    <!-- adoption section end -->

    <!-- Modal for adoption request confirmation -->
    <div id="adoptionModal" class="modal">
        <div class="modal-content">
            <p>We'll share your details with the pet owner. Do you agree?</p>
            <div class="btn-container">
                <button type="button" class="btn-" id="agreeButton">Yes</button>
                <button type="button" class="btn-" id="disagreeButton">No</button>
            </div>
        </div>
    </div>

    <!-- Modal for adoption request success -->
    <div id="successModal" class="modal">
        <div class="modal-content">
            <p>Your details have been sent! Please wait for the owner to get in touch with you. Thankyou.</p>
            <button type="button" class="btn-" id="closeSuccessModal">Close</button>
        </div>
    </div>

    <!-- Modal for login prompt -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <p>You need to log in first.</p>
            <a href="login.jsp" class="btn">Login now</a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <!-- Feather Icons -->
    <script>
        feather.replace();
    </script>
    <!-- My Javascript -->
    <script src="js/script.js"></script>
    <script>
        document.getElementById('uploadButton').addEventListener('click', function() {
            <% if (session.getAttribute("username") == null) { %>
                document.getElementById('loginModal').style.display = 'flex';
            <% } else { %>
                window.location.href = 'uploadpet.jsp';
            <% } %>
        });

        document.querySelectorAll('.requestAdoptionBtn').forEach(button => {
            button.addEventListener('click', function() {
                var petId = this.getAttribute('data-id');
                <% if (session.getAttribute("username") == null) { %>
                    document.getElementById('loginModal').style.display = 'flex';
                <% } else { %>
                    document.getElementById('adoptionModal').style.display = 'flex';
                    document.getElementById('agreeButton').addEventListener('click', function() {
                        // Here, you should implement the logic to send the details to the owner
                        // For example, using AJAX to send a request to a server-side script
                        document.getElementById('adoptionModal').style.display = 'none';
                        document.getElementById('successModal').style.display = 'flex';
                    });
                    document.getElementById('disagreeButton').addEventListener('click', function() {
                        document.getElementById('adoptionModal').style.display = 'none';
                        window.location.href = 'adoption.jsp';
                    });
                <% } %>
            });
        });

        function closeModal() {
            document.getElementById('loginModal').style.display = 'none';
            document.getElementById('adoptionModal').style.display = 'none';
            document.getElementById('successModal').style.display = 'none';
        }

        document.getElementById('closeSuccessModal').addEventListener('click', function() {
            closeModal();
        });

        // Close the modal when the user clicks anywhere outside of the modal
        window.onclick = function(event) {
            var loginModal = document.getElementById('loginModal');
            var adoptionModal = document.getElementById('adoptionModal');
            var successModal = document.getElementById('successModal');
            if (event.target == loginModal) {
                loginModal.style.display = "none";
            } else if (event.target == adoptionModal) {
                adoptionModal.style.display = "none";
            } else if (event.target == successModal) {
                successModal.style.display = "none";
            }
        }
    </script>
</body>
</html>
