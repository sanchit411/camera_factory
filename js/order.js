/*
* Sanchit Arora
* jadrn057
* Project #2
* Spring 2018
*/

var currentListOfProducts;        // current list of products in the cart
var cartSize;
var cart = new shopping_cart("jadrn057");


/*  We load the the shopping cart and order summary 

    Sanchit Arora
    CS545
    Fall 2017
*/    

$(document).ready(function() {
    
        updateDisplay();
        $('.update').blur( function(e) {;
            e.preventDefault();
            validateQuantity(this.name, this.value);
            
        });   
              
        $('.delete').on('click', function() {
            cart.delete(this.name);
            location.reload();
            });
    
        function updateDisplay() {
            var cartArray = cart.getCartArray();
            var orderString = "<div class='card text-center'><div class='card-header'>Sales Information</div>";
            orderString +=" <div id='error_update'></div><div class='card-body'><div class='table-responsive'>";
            var sub_total = 0.0;
            var tax = 0.0;
            var total = 0.0;
            orderString += "<table class='table table-hover table-bordered'>";
            orderString += "<thead ><tr><th scope='col'><strong>Product Name</strong></th> <th scope='col'><strong>Item Quantity</strong>"+
            "</th><th scope='col'><strong>Item Price</strong></th><th scope='col'><strong>Total</strong></th>";
            orderString +="</tr></thead><tbody>"
            if(cart.size()>0) {
                for(i=0; i < cartArray.length; i++) {
                    orderString +="<tr><div class='media' ><td>";
                    orderString += "<img class='mr-3 img-size' src='/~jadrn057/proj1/design/"+
                    cartArray[i][4]+"' alt=\""+cartArray[i][0]+"\""+
                    " />";          
                    orderString += "<div class='media-body'>\n"+"<h5 class='mt-0 mb-1'>"+cartArray[i][2]+"</h5></td></div>";
                    orderString += "<td><input type='number'class='update'id='"+cartArray[i][0]+"' name='"+cartArray[i][0]+"' value='"+ cartArray[i][1]+"' min='1' max='100'/><br>";
                    orderString += "<br><button type='button' class='btn btn-danger delete' name='"+cartArray[i][0]+"'>Delete</button></td>";
                    orderString += "<td><strong>$"+cartArray[i][3]+"</strong></td>"
                    var local_total = parseFloat(cartArray[i][1])*parseFloat(cartArray[i][3]);
                    orderString += "<td><strong>$"+local_total.toFixed(2)+"</strong></td></tr></div>";
                    sub_total = sub_total + local_total;
                }
                
                tax = (sub_total*0.08);
                total = sub_total+tax+5.0;
                orderString += "</tbody></table></div></div>";
                orderString +="<div class='card-footer'>";
                orderString +="<div class='card text-center'><div class='card-header'>Order Summary</div>";
                orderString += "<div class='card-body'><div class='table-responsive'>";
                orderString += "<table class='table table-hover '><tbody>"
                orderString += "<tr><td class='text-left' colspan='3'><strong>Subtotal</strong></td><td class='text-right'><strong>$"+sub_total.toFixed(2)+"</strong></td></tr>";
                orderString += "<tr><td class='text-left' colspan='3'><strong>Tax</strong></td><td class='text-right'><strong>$"+tax.toFixed(2)+"</strong></td></tr>";
                orderString += "<tr><td class='text-left' colspan='3'><strong>Delivery</strong></td><td class='text-right'><strong>$5.00</strong></td></tr>";
                orderString += "<tr class='table-primary'><td class='text-left' colspan='3'><strong>Total</strong></td><td class='text-right'><strong>$"+total.toFixed(2)+"</strong></td></tr>";
                orderString += "</tbody></table></div></div>"+
                "<div class='card-footer text-center'>";
                orderString += "<button type='button' class='btn btn-primary' id='order_button'>Order Now</button>"+
                "</div></div></div>";
    
                
    
                
            } else {
                orderString = "<div class='card text-center'><div class='card-header'>Sales Information</div>";
                orderString +="<div class='card-body'>";
                orderString += "<p class='confirmation_error'>Cart is empty</p><br>";
                orderString += "<a href='/jadrn057/jsp_files/browse.jsp' class='btn btn-primary'>Browse Gallary</a></div></div>";
            }
            $('#order_conf').html(orderString); 
            $('#count').text(cart.size());    
        }
        $( "#dialog-modal" ).dialog({
            padding:70,
            height:700,
            width: 800,
            modal: true,
            autoOpen: false
    });
    
    $('#order_button').on('click', function($e) {       
            $("#dialog-modal").dialog('open');
            });
    
            $('#same_value').click(function() {
                if($("#same_value").is(':checked')){
                    updateAddress(true);
                }
            else{
                 updateAddress(false); 
            }
            });
            
    });

/*----- validating the payment form -------*/    
    function validateForm() {
        
        
            // First Name
            var billFirstName = document.getElementById('b_first_name').value.trim();
            if (billFirstName == "" || billFirstName.length == 0)
            {
                document.getElementById("b_first_name").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the First Name!";
                return false;
            }
            else
            {
                document.getElementById("error").style.display = "none";
            }
    
        
            //Last Name
            var billLastName = document.getElementById('b_last_name').value.trim();
            if (billLastName == "" || billLastName.length == 0)
            {
                document.getElementById("b_last_name").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the Last Name!";
                return false;
            }
            else
            {
                document.getElementById("error").style.display = "none";   
            }
    
            //Address1
            var billAddress1 = document.getElementById("b_address_line_1").value.trim();
            if (billAddress1 == "" || billAddress1.length == 0 || billAddress1.length < 2)
            {
                document.getElementById("b_address_line_1").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the Address!";
                return false;
            }
            else{
             document.getElementById("error").style.display = "none"; 
            }
            
            // State
             var billState = document.getElementById("b_state").value;
            if (billState == "") {
                document.getElementById("b_state").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please select a state!";
                return false;
            } else {
                document.getElementById("error").style.display = "none"; 
            }
            
            //City
            var billCity = document.getElementById("b_city").value.trim();
        
            if (billCity.length < 2) {
                document.getElementById("b_city").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please enter a city!";
                return false;
            }
            else {
                document.getElementById("error").style.display = "none"; 
            }
    
            //Zip
            var billZip = document.getElementById("b_zip").value.trim();
            if (billZip == "" || billZip.length != 5)
            {
                document.getElementById("b_zip").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the Valid Zip! Exactly 5 digits!";
                return false;
            }{
                document.getElementById("error").style.display = "none"; 
            }
            
            var regexName=/^\d{5}$/;
    
                if(regexName.test(document.getElementById("b_zip").value))
                {
                    document.getElementById("error").style.display = "none";     
                }
                else
                {
                    document.getElementById("b_zip").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Please Enter the Valid Zip! Only numbers allowed!";
                    return false;
                }        
        
            // Phone Number
            var billPhone = document.getElementById("b_phone").value.trim();
            if (typeof billPhone === 'undefined' || billPhone == "")
            {
                document.getElementById("b_phone").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Telephone must match the pattern (XXX-XXX-XXXX) and is required";
                return false;
            }else {
                document.getElementById("error").style.display = "none"; 
            }
            
        
            var regexName=/^\d{3}-\d{3}-\d{4}$/;
            if(regexName.test(document.getElementById("b_phone").value))
            {
                document.getElementById("error").style.display = "none";     
            }
            else
            {
                document.getElementById("s_phone").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter Telephone as XXX-XXX-XXXX! Only numbers allowed!";
                return false;
            } 
        
            var shipFirstName = document.getElementById('s_first_name').value.trim();
            if (shipFirstName == "" || shipFirstName.length == 0)
            {
                document.getElementById("s_first_name").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the First Name!";
                return false;
            }
            else
            {
                document.getElementById("error").style.display = "none";
            }
            var shipLastName = document.getElementById('s_last_name').value.trim();
            if (shipLastName == "" || shipLastName.length == 0)
            {
                document.getElementById("s_last_name").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the Last Name!";
                return false;
            }
            else
            {
                document.getElementById("error").style.display = "none";   
            }
    
            var shipAddress1 = document.getElementById("s_address_line_1").value.trim();
            if (shipAddress1 == "" || shipAddress1.length == 0 || shipAddress1.length < 2)
            {
                document.getElementById("s_address_line_1").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please Enter the Address!";
                return false;
            }
            else{
             document.getElementById("error").style.display = "none"; 
            }
            var shipState = document.getElementById("s_state").value;
            if (shipState == "") {
                document.getElementById("s_state").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Please select a state!";
                return false;
            } else {
                document.getElementById("error").style.display = "none"; 
            }
    
            var shipCity = document.getElementById("s_city").value.trim();
            
                if (shipCity.length < 2) {
                    document.getElementById("s_city").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Please enter a city!";
                    return false;
                }
                else {
                    document.getElementById("error").style.display = "none"; 
                }
                var shipZip = document.getElementById("s_zip").value.trim();
                if (shipZip == "" || shipZip.length != 5)
                {
                    document.getElementById("s_zip").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Please Enter the Valid Zip! Exactly 5 digits!";
                    return false;
                }else {
                    document.getElementById("error").style.display = "none"; 
                }
                var regexName=/^\d{5}$/;
                if(regexName.test(document.getElementById("s_zip").value))
                {
                    document.getElementById("error").style.display = "none";     
                }
                else
                {
                    document.getElementById("s_zip").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Please Enter the Valid Zip! Only numbers allowed!";
                    return false;
                }  
    
                var shipPhone = document.getElementById("s_phone").value.trim();
                if (typeof shipPhone === 'undefined' || shipPhone == "")
                {
                    document.getElementById("s_phone").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Telephone must match the pattern (XXX-XXX-XXXX) and is required";
                    return false;
                }else {
                    document.getElementById("error").style.display = "none"; 
                }
                var regexName=/^\d{3}-\d{3}-\d{4}$/;
                if(regexName.test(document.getElementById("s_phone").value))
                {
                    document.getElementById("error").style.display = "none";     
                }
                else
                {
                    document.getElementById("b_phone").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Please Enter Telephone as XXX-XXX-XXXX! Only numbers allowed!";
                    return false;
                } 
            // Credit card
            var billPhone = document.getElementById("cardNumber").value.trim();
            if (typeof billPhone === 'undefined' || billPhone == "")
            {
                document.getElementById("cardNumber").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Credit card must match the pattern (XXXX-XXXX-XXXX-XXXX) and is required";
                return false;
            }else {
                document.getElementById("error").style.display = "none"; 
            }
            var regexName=/^\d{4}-\d{4}-\d{4}-\d{4}$/;
            if(regexName.test(document.getElementById("cardNumber").value))
            {
                document.getElementById("error").style.display = "none";     
            }
            else
            {
                document.getElementById("cardNumber").focus();
                document.getElementById("error").style.display = "block";
                document.getElementById("error").innerHTML = "Credit card must match the pattern (XXXX-XXXX-XXXX-XXXX) and is required";
                return false;
            } 
            // Expiry Date
            var year = document.getElementById('year').value.trim();
            if(year=="18"){
                var month = document.getElementById('month').value.trim();
                if(month < "5"){
                    document.getElementById("month").focus();
                    document.getElementById("error").style.display = "block";
                    document.getElementById("error").innerHTML = "Expiry Date Should be greater than today date";
                    return false;
                } else {
                    document.getElementById("error").style.display = "none"; 
                }
            }
            var update = updateTable();
            if(update == false) {
                return false;
            }
            return true;
        }
        function updateAddress(same){
         
            if (same == true){
            
                $('#s_first_name').val($('#b_first_name').val());
                $('#s_last_name').val($('#b_last_name').val());
                $('#s_address_line_1').val($('#b_address_line_1').val());
                $('#s_address_line_2').val($('#b_address_line_2').val());
                $('#s_state').val($('#b_state').val());
                $('#s_city').val($('#b_city').val());
                $('#s_zip').val($('#b_zip').val());
                $('#s_phone').val($('#b_phone').val());
           }
    
            else{
          
                $('#s_first_name').val("");
                $('#s_last_name').val("");
                $('#s_address_line_1').val("");
                $('#s_address_line_2').val("");
                $('#s_state').val("");
                $('#s_city').val("");
                $('#s_zip').val("");
                $('#s_phone').val("");
            }
        }
    
        function validateQuantity(sku,qty) {

            var query = "SELECT quantity FROM product where sku in ('"+sku+"');"; 
            var urlPath = "/jadrn057/servlet/QuantityValidate";
            alert(query);
            
        
            $.ajax({
                url: urlPath,
                type: "GET",
                data: {"query":query},
                success: function(response) {
                    if(response == "")
                    {
                        document.getElementById(sku).value = response;
                        document.getElementById("error_update").innerHTML = "<p class='error'> Desired Qunatity Not Available</p>";
                        
                    }    
                    else {
                        if (parseInt(response,10)>parseInt(qty,10)){
                            cart.setQuantity(sku, qty);
                            location.reload();
                            document.getElementById("error_update").innerHTML = "";
                            
                        }
                        else {
                            document.getElementById(sku).value = response;
                            document.getElementById("error_update").innerHTML = "<p class='error'> Desired Qunatity Not Available</p>";
                          ;
                        }
                    }
                    
                },
                error: function(response) {
        
                }
            });
        }
        function updateTable(){
            var cartArray = cart.getCartArray();
            
            var query = "UPDATE product SET quantity = case ";
            if (cartArray.length > 0){
                for (var i = 0; i < cartArray.length; i++) {
                    query += "when sku='"+ cartArray[i][0] +"' then quantity -"+ cartArray[i][1] +" ";     
                }
                query += "else quantity end;"
                var bool = updateRequest(query);
                return bool;
            }
            else{
                return false
            }
        }
        
        function updateRequest(query) {

            cart.deleteCookie();
            $.ajax({
                url: "http://jadran.sdsu.edu/jadrn057/servlet/Confirmation",
                data: {"query": query},
                success: function (response) {
                    if (response.length > 0 &&response != null && response !== undefined) {
                        alert(response);
                        return false;
                    }
                    else {
                        alert("Success");
                        
                        return true;
                    }
                }
            });
        }
        
        