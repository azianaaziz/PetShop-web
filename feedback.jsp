<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.petshop.model.Feedback" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pet Shop</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Feather Icons -->
    <script src="https://unpkg.com/feather-icons"></script>

    <!-- My Style -->
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/master.css"/>
</head>

<body>
    <jsp:include page="nav.jsp" />

    <!-- Content start -->
    <section class="feedback">
        <h2 style="text-align: center;"><span>Feed</span>back</h2>

        <!-- Button to submit feedback -->
        <div style="text-align:center; margin-bottom:20px;">
            <a href="feedbackForm.jsp">
                <button type="button" class="btn" id="addFeedbackButton">Add Feedback</button>
            </a>
        </div>


        <!-- Static Feedback Start -->
        <div class="row">
            <div class="section">
                <div class="feedback-img">
                    <img src="img/feedback1.jpeg" alt="Feedback" />
                </div>
                <div class="content">
                    <h2><b>Paw-erful Praises</b></h2>
                    <h3>Bella Pawsington</h3>
                    <p>I just had to paws for a moment to express my sheer delight with Pawpaw Petshop! Shopping for my feline companions has never been this convenient and enjoyable. The website is a breeze to navigate, and the selection of cat goodies is simply meow-tastic.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="section">
                <div class="feedback-img">
                    <img src="img/feedback11.jpeg" alt="Feedback" />
                </div>
                <div class="content">
                    <h2><b>AMAZING!!</b></h2>
                    <h3>HappyHoundOwner</h3>
                    <p>I just had to share the tail-wagging success of my recent shopping spree at TailWag Haven! 🐶 As a proud owner of a lively Labrador named Max, finding top-quality supplies is essential. TailWag Haven exceeded my expectations in every aspect.</p>
                </div>
            </div>
        </div>
        <!-- Static Feedback End -->

        <!-- Dynamic Feedback Start -->
        <%
            List<Feedback> feedbackList = (List<Feedback>) application.getAttribute("feedbackList");
            if (feedbackList != null) {
                for (Feedback fb : feedbackList) {
        %>
        <div class="row">
            <div class="section">
                <div class="feedback-img">
                    <img src="<%= fb.getPhotoPath() %>" alt="Feedback" style="width:200px; height:auto;" />
                </div>
                <div class="content">
                    <h2><b><%= fb.getTitle() %></b></h2>
                    <h3><%= fb.getName() %></h3>
                    <p><%= fb.getSubject() %></p>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
        <!-- Dynamic Feedback End -->

    </section>
    <!-- Content end -->

    <jsp:include page="footer.jsp" />

    <!-- Feather Icons -->
    <script>
        feather.replace();
    </script>

    <!-- My Javascript -->
    <script src="js/script.js"></script>
</body>
</html>
