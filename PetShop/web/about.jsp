<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Pet Shop</title>
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700;1,700&display=swap" rel="stylesheet" />
      <script src="https://unpkg.com/feather-icons"></script>
      <link rel="stylesheet" href="css/style.css" />
      <link rel="stylesheet" href="css/master.css"/>
      <style>
       
        .owners-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin: 20px;
        }
        .owner {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
            padding: 0 20px;
        }
        .owner-img {
            flex: 1;
            max-width: 200px; /* Adjust the size as needed */
            margin: 0 20px;
            margin-left:15%;
            
        }
        .owner-img img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .owner-content {
            flex: 2;
            text-align: left;
            margin-right:15%;
        }
        .owner-content h3 {
            color: #b6895b;
            font-size: 24px;
        }
        .owner-content p {
            font-size: 16px;
            color: #555;
        }
    </style>
   </head>
   <body>
      <jsp:include page="nav.jsp" />
      <section class="about">
         <h2><span>Meet the</span> PawPaw Family!</h2>
         <section class="owners-section">
        <div class="owner">
            <div class="owner-img">
                <img src="img/azie.jpg" alt="Owner 1">
            </div>
            <div class="owner-content">
                <h3>Aziana</h3>
                <h4>Operations Director</h4>
                <p>
                    Aziana oversees the day-to-day operations of PawPaw, ensuring efficiency, productivity, and alignment with our goals.
                </p>
            </div>
        </div>
        <div class="owner">
            <div class="owner-img">
                <img src="img/hidayah.jpg" alt="Owner 2">
            </div>
            <div class="owner-content">
                <h3>Hidayah</h3>
                <h4>Enrichment Consultant</h4>
                <p>
                    Hidayah, focuses on designing engaging and stimulating environments for the pets, both at PawPaw and for customers' homes.
                </p>
            </div>
        </div>
        <div class="owner">
            <div class="owner-img">
                <img src="img/nurjie.jpg" alt="Owner 3">
            </div>
            <div class="owner-content">
                <h3>Nurjie</h3>
                <h4>Supplies Sales & Advisor</h4>
                <p>
                   Nurjie is involved in assisting customers finding the right products in the shop for their beloved pets and always made sure stocks the are available for everyone.
                </p>
            </div>
        </div>
        <div class="owner">
            <div class="owner-img">
                <img src="img/shuhana.jpg" alt="Owner 4">
            </div>
            <div class="owner-content">
                <h3>Syuhana</h3>
                <h4>Wellness Specialist</h4>
                <p>
                   Syuhana, responsible for the daily care of the pets in PawPaw, ensuring they are fed, clean, happy and healthy during their stay at PawPaw.
                </p>
            </div>
        </div>
    </section>
      </section>
      <jsp:include page="footer.jsp" />
      <script>
         feather.replace();
      </script>
      <script src="js/script.js"></script>
   </body>
</html>
