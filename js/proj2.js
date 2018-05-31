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

    });
