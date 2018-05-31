
/*
* Sanchit Arora
* jadrn057
* Project #2
* Spring 2018
*/

var currentListOfProducts;      // current list being populated in the grid
var cart = new shopping_cart("jadrn057");

$(document).ready(function() {
    window.onload = display_product();
    currentListOfProducts = new Array();
    var cartSize = cart.size();
    $('#cart_quantity').text(cartSize);

    $(document).on('click', ".buy", function() {  
        var sku = this.id;
        var qty = document.getElementById("item_"+sku).value;
        var title = document.getElementById('title').innerHTML;
        var price = this.name;
        var image = this.value;
        cart.add(sku,qty,title,price,image);
        $(this).next().fadeIn(50).fadeOut(2000);
        var urlPath = "/jadrn057/jsp_files/order.jsp";
        window.location.href = urlPath;
    });
  

});

function display_product()   {
    var address = document.location.href;
    var sku = address.split("=");
    var query = "SELECT sku,  category.name, vendor.name, vendorModel, description, features, retail, quantity, image FROM product, vendor, category WHERE venID = vendor.id AND catID = category.id AND sku='" + sku[1] + "';";
    var urlPath = "http://jadran.sdsu.edu/jadrn057/servlet/DisplayProduct";
    $.ajax({
        url: urlPath,
        type: "GET",
        data: {"query":query},
        success: function(response) {
            console.log("AJAX call to ProductsFilter successful\n");
            if(response == "")
                document.getElementById("get_product").innerHTML = "<p class='not-found'> No Such Item Found</p></br><a href='/jadrn057/jsp_files/browse.jsp'>Browse Gallery</a>";
            else
                document.getElementById("get_product").innerHTML = response;
        },
        error: function(response) {
            console.log("AJAX call to ProductsFilter returned an error: " + response);
        }
    });
}