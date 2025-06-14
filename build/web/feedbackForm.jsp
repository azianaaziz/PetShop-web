<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Feedback</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700;1,700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/master.css"/>
</head>
<body>
    <jsp:include page="nav.jsp" />
    <section class="feedback">
    <h2 style="text-align:center;">Submit Your Feedback</h2>

    <form action="FeedbackServlet" method="post" enctype="multipart/form-data" style="width: 50%; margin: auto;">
        <label>Title:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>

        <label>Subject:</label><br>
        <textarea name="subject" rows="5" cols="40" required></textarea><br><br>

        <label>Photo:</label><br>
        <input type="file" name="photo" accept="image/*" required><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
    </section>
    <jsp:include page="footer.jsp" />
</body>
</html>
