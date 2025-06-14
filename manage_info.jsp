<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.petshop.model.RegistrationUser" %>
<%
    RegistrationUser user = (RegistrationUser) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Information</title>
    <style>
        /* Existing styles */
        body {
            margin: 0;
            padding: 0;
            background-image: url("img/kucing1.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-color: black;
            color: white;
            font-size: 18px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: var(--primary);
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px 20px;
            border-radius: 10px;
            width: fit-content;
            box-sizing: border-box;
            margin-top: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            max-width: 600px;
            margin-top: 30px;
            margin-bottom: 30px;
            background-color: black;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #666;
            color: white;
        }

        th {
            background-color: #b6895b;
            color: #010101;
        }

        .edit-button, .save-button, .cancel-button {
            background-color: transparent;
            color: #b6895b;
            border: none;
            cursor: pointer;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .edit-button:hover, .save-button:hover, .cancel-button:hover {
            background-color: #b6895b;
            color: #010101;
        }

        .done-button {
            background-color: #b6895b;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
        }

        .done-button:hover {
            background-color: #010101;
            color: #b6895b;
        }

        .text-button {
            background: none;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            text-decoration: underline;
            font-size: 18px;
            display: block;
            margin: 0 auto;
        }

        .hidden {
            display: none;
        }

        .toggle-eye {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #b6895b;
        }

        .password-wrapper {
            position: relative;
        }

        /* Additional styles for modal */
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
        }

        .modal-content {
            background-color: #010101;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            color: #b6895b;
            text-align: center;
            border-radius: 10px;
        }

        .close {
            color: #b6895b;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #f00;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-button {
            background-color: #b6895b;
            color: #010101;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin: 10px;
        }

        .modal-button:hover {
            background-color: #010101;
            color: #b6895b;
        }
    </style>
</head>
<body>
    <h1>Manage Information</h1>
    <form id="editForm" action="ManageInfoServlet" method="post">
        <table>
            <tr>
                <th>Field</th>
                <th>Value</th>
                <th>Action</th>
            </tr>
            <!-- Existing rows for user information -->
            <tr>
                <td>Name:</td>
                <td>
                    <span id="name"><%= user.getFullName() %></span>
                    <input type="text" id="name-input" name="name" value="<%= user.getFullName() %>" class="hidden">
                </td>
                <td>
                    <button type="button" id="name-edit" onclick="editField('name')" class="edit-button">Edit</button>
                    <button type="button" id="name-save" onclick="saveEdit('name')" class="save-button hidden">Save</button>
                    <button type="button" id="name-cancel" onclick="cancelEdit('name')" class="cancel-button hidden">Cancel</button>
                </td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td>
                    <span id="phoneNumber"><%= user.getPhoneNumber() %></span>
                    <input type="text" id="phoneNumber-input" name="phoneNumber" value="<%= user.getPhoneNumber() %>" class="hidden">
                </td>
                <td>
                    <button type="button" id="phoneNumber-edit" onclick="editField('phoneNumber')" class="edit-button">Edit</button>
                    <button type="button" id="phoneNumber-save" onclick="saveEdit('phoneNumber')" class="save-button hidden">Save</button>
                    <button type="button" id="phoneNumber-cancel" onclick="cancelEdit('phoneNumber')" class="cancel-button hidden">Cancel</button>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <span id="email"><%= user.getEmail() %></span>
                    <input type="email" id="email-input" name="email" value="<%= user.getEmail() %>" class="hidden">
                </td>
                <td>
                    <button type="button" id="email-edit" onclick="editField('email')" class="edit-button">Edit</button>
                    <button type="button" id="email-save" onclick="saveEdit('email')" class="save-button hidden">Save</button>
                    <button type="button" id="email-cancel" onclick="cancelEdit('email')" class="cancel-button hidden">Cancel</button>
                </td>
            </tr>
            <tr>
                <td>Username:</td>
                <td>
                    <span id="username"><%= user.getUsername() %></span>
                    <input type="text" id="username-input" name="username" value="<%= user.getUsername() %>" class="hidden">
                </td>
                <td>
                    <button type="button" id="username-edit" onclick="editField('username')" class="edit-button">Edit</button>
                    <button type="button" id="username-save" onclick="saveEdit('username')" class="save-button hidden">Save</button>
                    <button type="button" id="username-cancel" onclick="cancelEdit('username')" class="cancel-button hidden">Cancel</button>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <div class="password-wrapper">
                        <span id="password">********</span>
                        <input type="text" id="password-input" name="password" value="<%= user.getPassword() %>" class="hidden">
                        <i id="toggle-eye" class="fas fa-eye toggle-eye hidden" onclick="togglePasswordVisibility()"></i>
                    </div>
                </td>
                <td>
                    <button type="button" id="password-edit" onclick="editField('password')" class="edit-button">Edit</button>
                    <button type="button" id="password-save" onclick="saveEdit('password')" class="save-button hidden">Save</button>
                    <button type="button" id="password-cancel" onclick="cancelEdit('password')" class="cancel-button hidden">Cancel</button>
                </td>
            </tr>
        </table>
        <button type="submit" class="text-button">Save All Changes</button>
    </form>
    <a href="home.jsp" class="done-button">Exit</a>
    <button id="deleteAccountButton" class="modal-button">Delete Account</button>

    <!-- The Modal -->
    <div id="deleteAccountModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="confirmationText">Are you sure you want to delete your account?</p>
            <button id="confirmDeleteButton" class="modal-button">Yes, Delete</button>
            <button id="secondConfirmButton" class="modal-button hidden">Confirm Deletion</button>
            <button class="modal-button" onclick="closeModal()">Cancel</button>
        </div>
    </div>

    <script>
        // Function to handle edit actions
        function editField(fieldName) {
            var field = document.getElementById(fieldName);
            var input = document.getElementById(fieldName + "-input");
            var editButton = document.getElementById(fieldName + "-edit");
            var saveButton = document.getElementById(fieldName + "-save");
            var cancelButton = document.getElementById(fieldName + "-cancel");

            field.classList.add("hidden");
            input.classList.remove("hidden");
            editButton.classList.add("hidden");
            saveButton.classList.remove("hidden");
            cancelButton.classList.remove("hidden");

            if (fieldName === "password") {
                document.getElementById("toggle-eye").classList.remove("hidden");
            }
        }

        // Function to cancel edit actions
        function cancelEdit(fieldName) {
            var field = document.getElementById(fieldName);
            var input = document.getElementById(fieldName + "-input");
            var editButton = document.getElementById(fieldName + "-edit");
            var saveButton = document.getElementById(fieldName + "-save");
            var cancelButton = document.getElementById(fieldName + "-cancel");

            input.value = field.textContent;
            field.classList.remove("hidden");
            input.classList.add("hidden");
            editButton.classList.remove("hidden");
            saveButton.classList.add("hidden");
            cancelButton.classList.add("hidden");

            if (fieldName === "password") {
                document.getElementById("toggle-eye").classList.add("hidden");
                input.type = "password";
                document.getElementById("toggle-eye").classList.add("fa-eye");
                document.getElementById("toggle-eye").classList.remove("fa-eye-slash");
            }
        }

        // Function to save edits
        function saveEdit(fieldName) {
            var form = document.getElementById("editForm");
            form.submit();
        }

        // Function to toggle password visibility
        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("password-input");
            var toggleEye = document.getElementById("toggle-eye");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                toggleEye.classList.remove("fa-eye");
                toggleEye.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                toggleEye.classList.remove("fa-eye-slash");
                toggleEye.classList.add("fa-eye");
            }
        }

        // Modal functions
        var modal = document.getElementById("deleteAccountModal");
        var btn = document.getElementById("deleteAccountButton");
        var span = document.getElementsByClassName("close")[0];
        var confirmDeleteButton = document.getElementById("confirmDeleteButton");
        var secondConfirmButton = document.getElementById("secondConfirmButton");
        var confirmationText = document.getElementById("confirmationText");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
            resetModal();
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                resetModal();
            }
        }

        function closeModal() {
            modal.style.display = "none";
            resetModal();
        }

        function resetModal() {
            confirmationText.textContent = "Are you sure you want to delete your account?";
            confirmDeleteButton.classList.remove("hidden");
            secondConfirmButton.classList.add("hidden");
        }

        confirmDeleteButton.onclick = function() {
            confirmationText.textContent = "This action is irreversible. Your data will be deleted permanently.";
            confirmDeleteButton.classList.add("hidden");
            secondConfirmButton.classList.remove("hidden");
        }

        secondConfirmButton.onclick = function() {
            fetch('DeleteAccountServlet', {
                method: 'POST',
                credentials: 'same-origin',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'username=<%= user.getUsername() %>'
            }).then(response => {
                if (response.ok) {
                    window.location.href = 'login.jsp';
                } else {
                    alert('Error deleting account.');
                }
            });
        }
    </script>
</body>
</html>
