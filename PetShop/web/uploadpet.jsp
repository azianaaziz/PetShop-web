-<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.petshop.model.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
    <meta http-equiv="X-UA-Compatible" content="IE-Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Shop</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;700&display=swap" rel="stylesheet">
    <!-- Feather Icons -->
    <script src="https://unpkg.com/feather-icons"></script>
    <!-- My Style -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/master.css">
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 100;
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
            max-width: 500px;
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
        .modal-content .btn {
            background-color: #b6895b;
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
            display: inline-block;
            margin: 5px;
        }
        .modal-content .btn:hover {
            background-color: #8f6e4c;
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #333;
            padding: 20px;
            color: white;
            text-align: center;
            border-radius: 10px;
            z-index: 101;
            font-family: 'Poppins', sans-serif;
        }
        .open-popup {
            display: block;
        }
    </style>
</head>
<body>
    <%
        String username = (String) session.getAttribute("username");
        UserDAO userDAO = new UserDAO();
        RegistrationUser user = null;
        if (username != null) {
            user = userDAO.getUserByUsername(username);
        }
    %>
    <jsp:include page="nav.jsp" />

    <!-- Upload pet section start -->
    <section id="uppet" class="upfeedback">
        <h2><span>Add Your</span> Pet's Details</h2>
        <p>Tell us about your adorable pet! Upload a cute photo and share their unique story. Let?s celebrate every paw-some friend together!</p>
        <div class="row">
            <form id="petForm" action="PetServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                <div class="img">
                    <label for="file-input">
                        <img id="uploaded-image" src="img/Upload.png" alt="Click to upload image">
                    </label>
                    <input id="file-input" type="file" name="image" accept="image/*" required style="display: none;" onchange="displayImage(event)">
                </div>
                <div class="input-group">
                    <input type="text" name="name" placeholder="Name" required>
                </div>
                <div class="input-group">
                    <input type="text" name="title" placeholder="Title" required>
                </div>
                <div class="input-group">
                    <input type="text" name="details" placeholder="Details (breed, age, etc.)" required>
                </div>
                <button type="button" class="btn" onclick="showConfirmModal()">Confirm</button>
            </form>
            <div id="confirmModal" class="modal">
                <div class="modal-content">
                    <p>Are you sure all the details are correct?</p>
                    <div>
                        <button class="btn" onclick="confirmSubmission()">Yes</button>
                        <button class="btn" onclick="closeConfirmModal()">No</button>
                    </div>
                </div>
            </div>
            <div id="popup" class="popup">
                <h2 style="font-size: 1.5em;">Please Enter All Details!</h2>
                <p style="color: #fff; font-size: 1.2em;">Oops! It looks like you missed something. Please fill out all fields to continue.</p>
                <button type="button" class="btn" onclick="closePopup()">OK</button>
            </div>
            <script>
                let popup = document.getElementById("popup");
                let confirmModal = document.getElementById("confirmModal");

                function showConfirmModal() {
                    if (validateForm()) {
                        confirmModal.style.display = "flex";
                    }
                }

                function closeConfirmModal() {
                    confirmModal.style.display = "none";
                }

                function confirmSubmission() {
                    confirmModal.style.display = "none";
                    openSuccessPopup();
                    setTimeout(() => {
                        document.getElementById("petForm").submit();
                    }, 500); // Slight delay to show the popup
                }

                function openPopup() {
                    popup.classList.add("open-popup");
                }

                function closePopup() {
                    popup.classList.remove("open-popup");
                }

                function openSuccessPopup() {
                    popup.innerHTML = `<h2 style="font-size: 1.5em;">Your adoption has been posted!</h2>
                                       <p style="color: #fff; font-size: 1.2em;">Paw-some! Click "OK" to go back to the adoption page.</p>
                                       <button type="button" class="btn" onclick="closePopupAndNavigate()">OK</button>`;
                    openPopup();
                }

                function closePopupAndNavigate() {
                    popup.classList.remove("open-popup");
                    window.location.href = 'adoption.jsp';
                }

                document.querySelector('#uploaded-image').addEventListener('click', () => {
                    document.querySelector('#file-input').click();
                });

                function displayImage(event) {
                    const image = document.getElementById('uploaded-image');
                    image.src = URL.createObjectURL(event.target.files[0]);
                    image.onload = () => {
                        URL.revokeObjectURL(image.src);
                    }
                }

                function validateForm() {
                    let form = document.getElementById("petForm");
                    let inputs = form.querySelectorAll("input[required]");
                    for (let input of inputs) {
                        if (input.value.trim() === "") {
                            openPopup();
                            return false;
                        }
                    }
                    return true;
                }
            </script>
        </div>
    </section>
    <!-- Upload pet section end -->

    <!-- Footer start -->
    <jsp:include page="footer.jsp" />
    <!-- Feather Icons -->
    <script>
        feather.replace();
    </script>
    <!-- My Javascript -->
    <script src="js/script.js"></script>
</body>
</html>
