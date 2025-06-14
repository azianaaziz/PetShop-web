<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" type="image/x-icon" href="img/cougar-clipart-bearcat.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pet Shop | FAQs</title>
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
        .faq-section {
            padding: 20px;
            max-width: 800px;
            margin: auto;
        }
        .faq-title {
            text-align: center;
            margin-bottom: 30px;
        }
        .faq-item {
            margin-bottom: 15px;
        }
        .faq-question {
            font-weight: bold;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            background-color: #b6895b;
            padding: 10px;
            border-radius: 5px;
        }
        .faq-answer {
            display: none;
            padding: 10px;
            background-color: black;
            border-left: 3px solid #b6895b;
            border-radius: 5px;
            margin-top: 5px;
        }
        .active .faq-answer {
            display: block;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp" />
    <section id="contact" class="contact">
      <h2><span>Customer</span> Help</h2>
    </section>
    <section class="faq-section">
        
        <div class="faq-category">
            <h3 style="font-size:30px">Ordering</h3>
            <br>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How can I check my order?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>You can check your order status by logging into your account and visiting the 'Orders' section.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>Can I cancel or change my order?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Orders can be canceled or changed within 24 hours of placement by contacting our customer service.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How do I apply my promotion code?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Enter your promotion code at checkout in the designated field to apply it to your order.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>What currency do you charge in?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>All prices are in USD, and your card will be charged in USD.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>What kind of payment do you currently accept?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>We accept major credit cards, PayPal, and bank transfers.</p>
                </div>
            </div>
        </div>

        <div class="faq-category">
            <h3 style="font-size:30px">Shipping, Returns & Exchanges</h3>
            <br>
            <div class="faq-item">
                <div class="faq-question">
                    <span>Do you ship internationally?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Yes, we offer international shipping to most countries. Shipping fees may vary.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>I've received a wrong or defective item.</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Please contact our customer service team to arrange a return or exchange for a defective item.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>I didn't receive my package.</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>If your package hasn't arrived within the estimated delivery time, please contact us for assistance.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>Why isn't the tracking of my package updated?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Tracking information can take 1-2 days to update. If there's no update after this period, contact us.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How long will it take for my order to arrive?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Delivery times vary depending on your location. Please refer to our shipping policy for detailed information.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How much is shipping fee?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Shipping fees are calculated based on your location and the weight of your order at checkout.</p>
                </div>
            </div>
        </div>

        <div class="faq-category">
            <h3 style="font-size:30px">Account</h3>
            <br>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How do I create an account?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Click on the 'Sign Up' button on the top right corner of the website and fill in your details to create an account.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>I forgot my password. What should I do?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Click on the 'Forgot Password' link on the login page and follow the instructions to reset your password.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How can I update my account information?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Log in to your account, go to the 'Account Settings' section, and update your information.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <span>How do I delete my account?</span>
                    <i data-feather="chevron-down"></i>
                </div>
                <div class="faq-answer">
                    <p>To delete your account, please contact our customer service team for assistance.</p>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <!-- Feather Icons -->
    <script>
        feather.replace();
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const faqItems = document.querySelectorAll(".faq-item");

            faqItems.forEach(item => {
                item.querySelector(".faq-question").addEventListener("click", () => {
                    item.classList.toggle("active");
                });
            });
        });
    </script>

    <!-- My Javascript -->
    <script src="js/script.js"></script>
</body>
</html>
