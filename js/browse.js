/*
* Sanchit Arora
* jadrn057
* Project #2
* Spring 2018
*/

var products;
var currentListOfProducts;      // current list being populated in the grid
var cart = new shopping_cart("jadrn057");

$(document).ready(function() {
    get_products();
    currentListOfProducts = new Array();
    var cartSize = cart.size();
    $('#cart_quantity').text(cartSize);

    // Event Listener for on click of filter options in the sidebar
    $('#filter_button').bind('click', function(e){
        e.preventDefault();
        getFilteredData();
    });

    // Delegated Events handling when user clicks "Add to Cart"

        addToCart();
  

});

function getFilteredData() {
    console.log("filterOptionChecked()");

    var vendor = document.getElementsByName("camera_vendor");
    var category = document.getElementsByName("camera_category");
    var max = document.getElementById("max_price").value;
    var min = document.getElementById("min_price").value;
    var str_vendor =" AND venID in("
    for(i=0; i<vendor.length;i++){
        if(vendor[i].checked == true)
        str_vendor += vendor[i].value + ",";
    }
    str_vendor += "0)";
    var str_cat =" AND catID in("
    for(i=0; i<category.length;i++){
        if(category[i].checked == true)
        str_cat += category[i].value + ",";
    }
    str_cat += "0) ";
    if(str_vendor == " AND venID in(0)")
        str_vendor="";
    if(str_cat == " AND catID in(0) " )
        str_cat ="";
    var str_qty = " AND ";
    if((document.getElementById("checkbox_stock").checked==true) && (document.getElementById("checkbox_coming").checked==true)){
        str_qty = "";
    }
    else if((document.getElementById("checkbox_stock").checked==true) && (document.getElementById("checkbox_coming").checked==false)){
        str_qty += "quantity > 0";
     }
     else if ((document.getElementById("checkbox_stock").checked==false) && (document.getElementById("checkbox_coming").checked==true)){
        str_qty += "quantity = 0";
     }
     else {
         str_qty = "";
     }
     
    var query = "SELECT vendor.name, vendorModel, retail, image, quantity,sku FROM product join vendor on venID = id where ";
    query += " retail BETWEEN "+min+ " AND "+max+str_vendor + str_cat + str_qty + ";";
    var urlPath = "/jadrn057/servlet/DBFilter";


    $.ajax({
        url: urlPath,
        type: "GET",
        data: {"query":query},
        success: function(response) {
            if(response == "")
                document.getElementById("get_product").innerHTML = "<p class='not-found'> No Such Item Found</p></br><a href='/jadrn057/jsp_files/browse.jsp'>Browse Gallery</a>";
            else
                document.getElementById("get_product").innerHTML = response;
        },
        error: function(response) {

        }
    });
}

function get_products(){
    $.ajax ({
        url:"http://jadran.sdsu.edu/jadrn057/servlet/DisplayDB", success: function(result) {
        document.getElementById("get_product").innerHTML = result;
        }
    });
}

function addToCart() {
    $('#get_product').on('click', $('#get_product input[type="button"]'), function(event) {

        // Check if the event element has the value 'Add to Cart' which verifies
        // that the button was clicked, which can be referenced by event.target.
        event.preventDefault();
        if ( $(event.target).text() != 'Add To Cart') {
            return;
        }

        var sku = event.target.id;

        // Call ProductDetails.java and redirect to ProductDetails.jsp
        var urlPath = "/jadrn057/product_info.html?sku=" +sku;
        window.location.href = urlPath;
    });
}

