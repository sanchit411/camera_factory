<!DOCTYPE html>
<%--
Sanchit Arora
jadrn057
Project #2
Spring 2018
--%>

<%
    String searchResultsHTML = (String) request.getAttribute("searchResults");
%>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Search</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="/jadrn057/css/menu.css">
        <link rel="stylesheet" href="/jadrn057/css/browse.css">
        <link rel="stylesheet" href="/jadrn057/css/footer.css">

        <script type="text/javascript" src="/jadrn057/js/jquery/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <script type="text/javascript" src="/jadrn057/js/shopping_cart.js"></script>
        <script type="text/javascript" src="/jadrn057/js/menu_search.js"></script>
        <!--script type="text/javascript" src="/jadrn057/js/browse.js"></script-->
    </head>
    <body>
        <%-- MENU --%>
        <%@ include file="menu.jsp" %>

        <div id="content">
            <div id="get_product">
                <% out.print(searchResultsHTML); %>
            </div>
        </div>

        <%-- FOOTER --%>
        <%@ include file="footer.jsp" %>
    </body>
</html>
