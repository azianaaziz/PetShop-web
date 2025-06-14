<%@ page import="java.sql.*, java.util.*" %>
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
        <!-- Hero section start -->
        <section class="hero">
            <main class="content">
                <h1>Hello <span>
                        <%
                            if (user != null) {
                                out.print(user.getUsername() + "!");
                            } else {
                                out.print("Pet Pals!");
                            }
                        %>
                    </span></h1>
                <div class="slideshow-container">
                    <div class="mySlides">
                        <img src="img/slide1.jpg" alt="Slide 1">
                    </div>
                    <div class="mySlides">
                        <img src="img/slide2.jpg" alt="Slide 2">
                    </div>
                    <div class="mySlides">
                        <img src="img/slide3.jpg" alt="Slide 3">
                    </div>
                </div>
                <p>Welcome to PetShop, where tails wag and purrs abound! Discover purr-fect deals on pet essentials that will have your furry friends leaping with joy. Join our PawPaw Club for exclusive offers, gifts, and more!</p>
                <a href="products.jsp" class="cta">Buy Now</a>
            </main>
        </section>
        <!-- Hero section end -->
        <!-- Footer start -->
        <jsp:include page="footer.jsp" />
        <!-- Feather Icons -->
        <script>
            feather.replace();
        </script>
        <!-- My Javascript -->
        <script src="js/script.js"></script>
        <script>
            // JavaScript for the slideshow
            var slideIndex = 0;

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1;
                }
                slides[slideIndex - 1].style.display = "block";
                setTimeout(showSlides, 5000);
            }

            showSlides();
        </script>
    </body>
</html>
