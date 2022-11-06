<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

    <title>Ekka | 403.</title>

    <!-- site Favicon -->
    <link rel="icon" href="/user/assets/images/favicon/favicon.png" sizes="32x32"/>
    <link rel="apple-touch-icon" href="/user/assets/images/favicon/favicon.png"/>
    <meta name="msapplication-TileImage" content="/user/assets/images/favicon/favicon.png"/>

    <!-- css Icon Font -->
    <link rel="stylesheet" href="/user/assets/css/vendor/ecicons.min.css"/>

    <!-- css All Plugins Files -->
    <link rel="stylesheet" href="/user/assets/css/plugins/animate.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/jquery-ui.min.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/countdownTimer.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/slick.min.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/nouislider.css"/>
    <link rel="stylesheet" href="/user/assets/css/plugins/bootstrap.css"/>

    <!-- Main Style -->
    <link rel="stylesheet" href="/user/assets/css/style.css"/>
    <link rel="stylesheet" href="/user/assets/css/responsive.css"/>

</head>

<body>

<!-- Start main Section -->
<section class="ec-under-maintenance">

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="under-maintenance">
                    <h1>Error 403</h1>
                    <h4>The page was Forbidden.</h4>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                        been the industry's standard dummy.</p>
                    <sec:authorize access="hasAnyRole('ROLE_USER')">
                        <a href="/ekka" class="btn btn-lg btn-primary" tabindex="0">Back to Home</a>
                    </sec:authorize>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <a href="/ekka/admin" class="btn btn-lg btn-primary" tabindex="0">Back to Home</a>
                    </sec:authorize>
                </div>
            </div>
            <div class="col-md-6 disp-768">
                <div class="under-maintenance">
                    <img class="maintenance-img" src="/user/assets/images/common/404.png" alt="maintenance">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End main Section -->

<!-- Vendor JS -->
<script src="/user/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="/user/assets/js/vendor/jquery.notify.min.js"></script>
<script src="/user/assets/js/vendor/jquery.bundle.notify.min.js"></script>
<script src="/user/assets/js/vendor/popper.min.js"></script>
<script src="/user/assets/js/vendor/bootstrap.min.js"></script>
<script src="/user/assets/js/vendor/jquery-migrate-3.3.0.min.js"></script>
<script src="/user/assets/js/vendor/modernizr-3.11.2.min.js"></script>

<!--Plugins JS-->
<script src="/user/assets/js/plugins/swiper-bundle.min.js"></script>
<script src="/user/assets/js/plugins/countdownTimer.min.js"></script>
<script src="/user/assets/js/plugins/scrollup.js"></script>
<script src="/user/assets/js/plugins/jquery.zoom.min.js"></script>
<script src="/user/assets/js/plugins/slick.min.js"></script>
<script src="/user/assets/js/plugins/infiniteslidev2.js"></script>
<script src="/user/assets/js/vendor/jquery.magnific-popup.min.js"></script>
<script src="/user/assets/js/plugins/jquery.sticky-sidebar.js"></script>

<!-- Main Js -->
<script src="/user/assets/js/vendor/index.js"></script>
<script src="/user/assets/js/main.js"></script>

</body>
</html>