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
        <title>Order</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="/jadrn057/css/menu.css">
        <link rel="stylesheet" href="/jadrn057/css/order.css">
        <link rel="stylesheet" href="/jadrn057/css/footer.css">
        <link rel="stylesheet" href="/jadrn057/css/jquery-ui.css" >

        
        <script type="text/javascript" src="/jadrn057/js/jquery/jquery.js"></script>
        <script type="text/javascript" src="/jadrn057/js/jquery/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script type="text/javascript" src="/jadrn057/js/shopping_cart.js"></script>
        <script type="text/javascript" src="/jadrn057/js/menu_search.js"></script>
        <script type="text/javascript" src="/jadrn057/js/order.js"></script>
    </head>
    <body>
        <%-- MENU --%>
        <%@ include file="menu.jsp" %>
        <div id="error_update"></div>
        <div id="order_conf" class="content"></div>
        <div id="dialog-modal" class="widget-dialog-container" title="Complete Your Order">
                <div class="error" id="error"></div>
                    <form method="post" action="/jadrn057/jsp_files/confirmation.jsp" onsubmit="return validateForm()">    
                        <fieldset>
                                <legend>Billing Address</legend>
                                <input placeholder="First Name" type="text" name="billing" id="b_first_name" tabindex="1"  required autofocus>
                                <input placeholder="Last Name" name="billing" type="text" id="b_last_name" tabindex="3"  required>
                                <input placeholder="Address Line 1" name="billing"  id="b_address_line_1" type="text" tabindex="7" required>
                                <input placeholder="Address Line 2  (optional)" name="billing" id="b_address_line_2" type="text" tabindex="8" >
                                <input placeholder="City" name="billing" type="text" id="b_city" tabindex="9"  required>
                                <select name="billing" tabindex="10"   id="b_state" required>
                                        <option value="">Select a State</option>
                                        <option value="AL">Alabama</option>
                                        <option value="AK">Alaska</option>
                                        <option value="AZ">Arizona</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="CA">California</option>
                                        <option value="CO">Colorado</option>
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="DC">District Of Columbia</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="HI">Hawaii</option>
                                        <option value="ID">Idaho</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IN">Indiana</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NV">Nevada</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NM">New Mexico</option>
                                        <option value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="OH">Ohio</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="OR">Oregon</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="TX">Texas</option>
                                        <option value="UT">Utah</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WA">Washington</option>
                                        <option value="WV">West Virginia</option>
                                        <option value="WI">Wisconsin</option>
                                        <option value="WY">Wyoming</option>
                                </select>
                                <input placeholder="Zipcode" name="billing"  id="b_zip"type="text" tabindex="11"  required>
                                <input placeholder="Your Phone Number: XXX-XXX-XXXX" name="billing" type="tel" id="b_phone" pattern="^\d{3}-\d{3}-\d{4}$" tabindex="12"  required>                    
                            </fieldset>
                            <fieldset>
                                    <legend>Shipping Address</legend>
                                    <input type="checkbox" id="same_value">Same as the Billing Address
                                    <br>
                                    <input placeholder="First Name" type="text" name="first_name" id="s_first_name" tabindex="1"  required>
                                    <input placeholder="Last Name" name="Last Name" type="text" id="s_last_name"tabindex="3"  required>
                                    <input placeholder="Address Line 1" name="shipping" type="text" id="s_address_line_1" tabindex="7" required>
                                    <input placeholder="Address Line 2  (optional)" name="shipping" id="s_address_line_2" type="text" tabindex="8" >
                                    <input placeholder="City" name="shipping" type="text" id="s_city" tabindex="9"  required>
                                    <select name="shipping" tabindex="10"  id="s_state" required>
                                            <option value="">Select a State</option>
                                            <option value="AL">Alabama</option>
                                            <option value="AK">Alaska</option>
                                            <option value="AZ">Arizona</option>
                                            <option value="AR">Arkansas</option>
                                            <option value="CA">California</option>
                                            <option value="CO">Colorado</option>
                                            <option value="CT">Connecticut</option>
                                            <option value="DE">Delaware</option>
                                            <option value="DC">District Of Columbia</option>
                                            <option value="FL">Florida</option>
                                            <option value="GA">Georgia</option>
                                            <option value="HI">Hawaii</option>
                                            <option value="ID">Idaho</option>
                                            <option value="IL">Illinois</option>
                                            <option value="IN">Indiana</option>
                                            <option value="IA">Iowa</option>
                                            <option value="KS">Kansas</option>
                                            <option value="KY">Kentucky</option>
                                            <option value="LA">Louisiana</option>
                                            <option value="ME">Maine</option>
                                            <option value="MD">Maryland</option>
                                            <option value="MA">Massachusetts</option>
                                            <option value="MI">Michigan</option>
                                            <option value="MN">Minnesota</option>
                                            <option value="MS">Mississippi</option>
                                            <option value="MO">Missouri</option>
                                            <option value="MT">Montana</option>
                                            <option value="NE">Nebraska</option>
                                            <option value="NV">Nevada</option>
                                            <option value="NH">New Hampshire</option>
                                            <option value="NJ">New Jersey</option>
                                            <option value="NM">New Mexico</option>
                                            <option value="NY">New York</option>
                                            <option value="NC">North Carolina</option>
                                            <option value="ND">North Dakota</option>
                                            <option value="OH">Ohio</option>
                                            <option value="OK">Oklahoma</option>
                                            <option value="OR">Oregon</option>
                                            <option value="PA">Pennsylvania</option>
                                            <option value="RI">Rhode Island</option>
                                            <option value="SC">South Carolina</option>
                                            <option value="SD">South Dakota</option>
                                            <option value="TN">Tennessee</option>
                                            <option value="TX">Texas</option>
                                            <option value="UT">Utah</option>
                                            <option value="VT">Vermont</option>
                                            <option value="VA">Virginia</option>
                                            <option value="WA">Washington</option>
                                            <option value="WV">West Virginia</option>
                                            <option value="WI">Wisconsin</option>
                                            <option value="WY">Wyoming</option>
                                    </select>
                                    <input placeholder="Zipcode" name="shipping" id="s_zip" type="text" tabindex="11"  required>
                                    <input placeholder="Your Phone Number: XXX-XXX-XXXX" name="phone" id="s_phone" type="tel" pattern="^\d{3}-\d{3}-\d{4}$" tabindex="12"  required>                    
                                </fieldset>
                                <fieldset>
                                    <legend>Payment Method</legend>
                                    <div class="payment">
                                            <input name="payment" type="radio"  value="Visa" checked>Visa	
                                            <input name="payment" type="radio"  value="Mastercard">Mastercard
                                            <input name="payment" type="radio"  value="Discover">Discover
                                            <input name="payment" type="radio"  value="American Express">American Express
                                        </div>
                                        <div class="form-group" name="card" id="card-number-field">
                                                <input type="text" placeholder="XXXX-XXXX-XXXX-XXXX"class="form-control" name="credit_card" pattern="^\d{4}-\d{4}-\d{4}-\d{4}$" tabindex="19" id="cardNumber" required>
                                            </div>
                                            <div class="form-group" id="expiration-date" name="Expiry Date">
                                                <label>Expiration Date</label>
                                                <select id='month' name="Month">
                                                    <option value="01">January</option>
                                                    <option value="02">February </option>
                                                    <option value="03">March</option>
                                                    <option value="04" selected>April</option>
                                                    <option value="05">May</option>
                                                    <option value="06">June</option>
                                                    <option value="07">July</option>
                                                    <option value="08">August</option>
                                                    <option value="09">September</option>
                                                    <option value="10">October</option>
                                                    <option value="11">November</option>
                                                    <option value="12">December</option>
                                                </select>
                                                <select id='year' name="Year">
                                                    <option value="18"> 2018</option>
                                                    <option value="19"> 2019</option>
                                                    <option value="20"> 2020</option>
                                                    <option value="21"> 2021</option>
                                                    <option value="22"> 2022</option>
                                                    <option value="23"> 2023</option>
                                                </select>
                                            </div>
                                </fieldset>
                        
                        
                                <input type="reset" class="btn btn-warning" />
                                <input type="submit" class="btn btn-primary" value="Submit Order"/> 
                    </form>       
                    </div>


        <%-- FOOTER --%>
        <%@ include file="footer.jsp" %>
    </body>
</html>
