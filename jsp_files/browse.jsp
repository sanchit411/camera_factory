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
        <title>Browse Products</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="/jadrn057/css/menu.css">
        <link rel="stylesheet" href="/jadrn057/css/browse.css">
        <link rel="stylesheet" href="/jadrn057/css/footer.css">

        <script type="text/javascript" src="/jadrn057/js/jquery/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script type="text/javascript" src="/jadrn057/js/shopping_cart.js"></script>
        <script type="text/javascript" src="/jadrn057/js/menu_search.js"></script>
        <script type="text/javascript" src="/jadrn057/js/browse.js"></script>
    </head>
    <body>
        <%-- MENU --%>
        <%@ include file="menu.jsp" %>

        
            <div id="mySidenav" class="sidenav">
                <form name="productsFilterForm" method="get">
                    <hr>
                    <div class="filter-heading"><p>Category</p></div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="1" id="checkbox_dslr">
                        <label class="form-check-label" for="checkbox_dslr">
                            DSLR
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="2" id="checkbox_point">
                        <label class="form-check-label" for="checkbox_point">
                            Point and Shoot
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="3" id="checkbox_adv">
                        <label class="form-check-label" for="checkbox_adv">
                            Advanced Amateur
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="4" id="checkbox_underwater">
                        <label class="form-check-label" for="checkbox_underwater">
                            Underwater
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="5" id="checkbox_film">
                        <label class="form-check-label" for="checkbox_film">
                            Film
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="6" id="checkbox_mirrorless">
                        <label class="form-check-label" for="checkbox_mirrorless">
                            Mirrorless
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_category" type="checkbox" value="7" id="checkbox_superzoom">
                        <label class="form-check-label" for="checkbox_superzoom">
                            Superzoom
                        </label>
                    </div>
                    <hr>
                    <div class="filter-heading"> <p>Price</p> </div>
                    <div class="form-inline">    
                    <p>&nbsp;$<input type="number" class=" input-size form-control mb-2 mr-sm-2" name="min_price" id="min_price" value=0 min=0> To
                            $<input type="number" class=" input-size form-control mb-2 mr-sm-2" name="max_price" id="max_price" value=10000 max=1000></p>
                    </div>
                    <hr>
                    <div class="filter-heading"><p>Vendor</p></div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="1" id="checkbox_nikon">
                        <label class="form-check-label" for="checkbox_nikon">
                            Nikon
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="2" id="checkbox_canon">
                        <label class="form-check-label" for="checkbox_canon">
                            Canon
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="3" id="checkbox_olympus">
                        <label class="form-check-label" for="checkbox_olympus">
                            Olympus
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="4" id="checkbox_lumix">
                        <label class="form-check-label" for="checkbox_lumix">
                            Lumix
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="5" id="checkbox_pentax">
                        <label class="form-check-label" for="checkbox_pentax">
                            Pentax
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="6" id="Leica">
                        <label class="form-check-label" for="checkbox_Leica">
                            Leica
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="7" id="checkbox_sony">
                        <label class="form-check-label" for="checkbox_sony">
                            Sony
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_vendor" type="checkbox" value="8" id="checkbox_fuji">
                        <label class="form-check-label" for="checkbox_fuji">
                            Fuji
                        </label>
                    </div>
                    <hr>
                    <div class="filter-heading"><p>Availability</p></div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_availability" type="checkbox" value="inStock" id="checkbox_stock">
                        <label class="form-check-label" for="checkbox_stock">
                            In Stock
                        </label>
                    </div>
                    <div class="form-check" >
                        <input class="form-check-input" name="camera_availability" type="checkbox" value="comingSoon" id="checkbox_coming">
                        <label class="form-check-label" for="checkbox_coming">
                            Coming Soon
                        </label>
                    </div>
                    <hr>
                    <input type="button" id="filter_button" class="btn btn-success float-right" value="Apply">
                </form>
                    
            </div>
            <div id="content">
            <div id="get_product">
            </div>
        </div>

        <%-- FOOTER --%>
        <%@ include file="footer.jsp" %>
    </body>
</html>
