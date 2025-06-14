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
  <section class="tips">
    <h2><span>Care</span> tips</h2>

<div class="row">
      <!-- Left section -->
      <div class="section">
        <div class="tips-img">
          <img src="img/care1.jpg" alt="Tips" />
        </div>
        <div class="content">
          <h3><b>Nutrition Matters:</b></h3>
          <p>
            Ensure your pet receives a well-balanced diet suitable for
			their species, size, and age. Consult your veterinarian to
			choose the right pet food and feeding schedule. Fresh water 
			should always be available.
          </p>
        </div>
      </div>

      <!-- Right section -->
      <div class="section">
        <div class="tips-img">
          <img src="img/care2.jpg" alt="Tips" />
        </div>
        <div class="content">
          <h3><b>Regular Exercise:</b></h3>
          <p>
            Keep your pet active with regular exercise. Whether it's walks,
			playtime, or interactive toys, physical activity is crucial for
			their physical and mental well-being.
          </p>
        </div>
      </div>
    </div>

    <div class="row">
      <!-- Left section -->
      <div class="section">
        <div class="tips-img">
          <img src="img/care3.jpg" alt="Tips" />
        </div>
        <div class="content">
          <h3><b>Comfortable Living Space:</b></h3>
          <p>
            Provide a safe and comfortable environment for your pet. This includes 
			a cozy bed, suitable shelter, and a clean living space. Make sure to 
			cat-proof or dog-proof your home to avoid potential hazards.
          </p>
        </div>
      </div>

      <!-- Right section -->
      <div class="section">
        <div class="tips-img">
          <img src="img/care4.jpg" alt="Tips" />
        </div>
        <div class="content">
          <h3><b>Love and Attention:</b></h3>
          <p>
            Above all, shower your pet with love and attention. Your companionship is 
			one of the most vital aspects of their well-being.
          </p>
        </div>
      </div>
    </div>
  </section>
  <!-- Content end -->

	
    <jsp:include page="footer.jsp" />
    <!-- modal box item detail start -->
    <div class="modal" id="item-detail-modal">
      <div class="modal-container">
        <a href="#" class="close-icon"><i data-feather="x"></i></a>
        <div class="modal-content">
          <img src="img/product1.jpg" alt="Product 1" />
          <div class="product-content">
            <h3>Product 1</h3>
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut quas
              illum nulla possimus sunt suscipit aliquid unde, cupiditate
              tempora odio culpa facere, saepe impedit quo!
            </p>
            <div class="product-stars">
              <i data-feather="star" class="star-full"></i>
              <i data-feather="star" class="star-full"></i>
              <i data-feather="star" class="star-full"></i>
              <i data-feather="star" class="star-full"></i>
              <i data-feather="star"></i>
            </div>
            <div class="product-price">RM 500 <span>1000</span></div>
            <a href="#"
              ><i data-feather="shopping-bag"></i><span>Add to Cart</span></a
            >
          </div>
        </div>
      </div>
    </div>

    <!-- modal box item detail end -->
    <!-- Feather Icons -->
    <script>
      feather.replace();
    </script>

    <!-- My Javascript -->
    <script src="js/script.js"></script>
  </body>
</html>

