/*
* Sanchit Arora
* jadrn057
* Project #2
* Spring 2018
*/

var cart = new shopping_cart("jadrn057");

$(document).ready(function() {

    var cartSize = cart.size();
    $('#cart_quantity').text(cartSize); 

    $("#searchbar").keypress( function(event) {
        // Check if user tapped enter on keyboard
        if (event.keyCode == 13) {
            var searchTerm = $(this).val();

            
            var urlPath = "/jadrn057/servlet/SearchProducts?search=" + searchTerm;
            window.location.href = urlPath;            
        }
    });
});
