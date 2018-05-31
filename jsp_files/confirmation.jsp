<!DOCTYPE html>
<!--
Sanchit Arora
jadrn057
Project #2
Spring 2018
-->
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Confirmation</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="/jadrn057/css/carousel.css">
        <link rel="stylesheet" href="/jadrn057/css/menu.css">
        <link rel="stylesheet" href="/jadrn057/css/proj2.css">
        <link rel="stylesheet" href="/jadrn057/css/footer.css">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script type="text/javascript" src="/jadrn057/js/shopping_cart.js"></script>
        <script type="text/javascript" src="/jadrn057/js/menu_search.js"></script>

    </head>
    <body>
        <%-- MENU --%>
        <%@ include file="menu.jsp" %>

        <div id="content">
            <h3 class="stock">Your order have been placed</h3></div>
            <main role="main">
                    <div id="content">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="first-slide" src="/jadrn057/images/caru_cam1.jpg" alt="First slide">
                                    <div class="container">
                                        <div class="carousel-caption text-right">
                                            <p><a class="btn btn-lg btn-primary" href="jsp_files/browse.jsp" role="button">Browse gallery</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="second-slide" src="/jadrn057/images/caru_cam2.jpg" alt="Second slide">
                                    <div class="container">
                                        <div class="carousel-caption text-left">
                                            <p><a class="btn btn-lg btn-primary" href="jsp_files/contact.jsp" role="button">Contact</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="third-slide" src="/jadrn057/images/caru_cam3.jpg" alt="Third slide">
                                    <div class="container">
                                        <div class="carousel-caption text-left">
                                            <p><a class="btn btn-lg btn-primary" href="jsp_files/order.jsp" role="button">Order Now</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
            <div>
            

        <%-- FOOTER --%>
        <%@ include file="footer.jsp" %>
    </body>
</html>
