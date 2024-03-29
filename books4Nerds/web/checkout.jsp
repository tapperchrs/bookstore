<%-- 
    Document   : checkout
    Created on : Oct 28, 2019, 1:29:01 PM
    Author     : 01792538
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="bookstoreUtils.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String itemParam = request.getParameter("isbn");
    String clearParam = request.getParameter("clear");
    DecimalFormat df = new DecimalFormat("0.00");
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (itemParam != null) {
        Item item = new Item(itemParam);
        //Adding an item
        if (cart != null) {
            //cart exists
            if (cart.addItem(item)) {
                session.setAttribute("cart", cart);
            }
        } else {
            //First item
            cart = new ShoppingCart();
            cart.addItem(item);
            session.setAttribute("cart", cart);
        }
    } else if (clearParam != null) {
        if (cart != null) {
            cart.clearCart();
            session.setAttribute("cart", cart);
        }
    }
    //refresh the cart
    cart = (ShoppingCart) session.getAttribute("cart");
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]
[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]
[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]
[if gt IE 8]>--> <html class="no-js" id="book" lang=""> <!--<![endif]-->
    <%@include file="WEB-INF/jspf/HEAD.jspf" %>

    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a href="index.jsp">
                        <img class="nav-img" src="images/B4N_MAIN_3285DF.png" alt=""/>
                    </a>  
                </div>
            </div><!--/.navbar-collapse -->

        </nav>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div id="checkout">
            <div class="cart-checkout">
                <div class="container col-lg-12">     
                    <%
                        String tax = df.format(Math.floor(cart.getTotal() * .0635));
                        Double total = cart.getTotal() + Double.valueOf(tax);
                    %>
                    <div class="col-lg-3">
                        <h2 class="check-total" >Cost of Books: <%=cart.getStringTotal()%></h2>
                        <h2 class="check-total" >Sales Tax: $<%=tax%></h2>
                        <h2 class="check-total" >Shipping & Handling: FREE</h2>
                        <h2 class="check-total-2" >Total Cost: $<%=df.format(total)%></h2>
                    </div>

                    <div class="col-lg-9">
                        <%
                            Vector items = cart.getCart();
                            int itemCount = items.size();
                            for (int i = 0; i < itemCount; i++) {
                                Item item = (Item) items.elementAt(i);
                        %>
                        <div style="height:250px; width: 300px;" class="col-lg-3">
                            <img src="<%= item.getCoverpic()%>" alt=""/>
                            <p class="col-sm-12 subtitle"><%= item.getTitle()%></p>
                            <p class="col-sm-12">Quantity: <%= item.getQuantity()%></p>
                            <p class="col-sm-12">Price per Book: $<%= item.getPrice()%></p>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div class="container">
                <form action="SubmitOrderServlet" method="post">
                    <div class="col-lg-6 check">
                        <h1 class="col-lg-12" >Shipping Information</h1>
                        <input type="text" name="FIRSTNAME" placeholder="First Name" required="required" class="form-control col-sm-5">
                        <input type="text" name="LASTNAME" placeholder="Last Name" required="required" class="form-control col-sm-5">
                        <input type="text" name="CUSTOMEREMAIL" placeholder="Email" required="required" class="form-control col-sm-5">
                        <input type="text" name="SHIPADDRESS" placeholder="Street Address" required="required" class="form-control col-sm-5">
                        <input type="text" name="SHIPCITY" placeholder="City" required="required" class="form-control col-sm-5">
                        <input type="text" name="SHIPREGION" placeholder="State" required="required" class="form-control col-sm-5">

                        <input type="text" name="SHIPPOSTALCODE" placeholder="ZIP Code" required="required" class="form-control col-sm-5">
                        <input type="text" name="PHONE" placeholder="Phone Number" class="form-control col-sm-5">
                        <input type="text" name="APT" placeholder="Apt/Suite" class="form-control col-sm-5">
                    </div>
                    <div class="col-lg-6 check">
                        <h1 class="col-lg-12" >Payment Information</h1>
                        <select size="1" name="CreditCardTypeID" style="margin-bottom: 5px;">
                            <option selected value="0" disabled>Select the Card Type</option>
                            
                            <option value="3">American Express</option>
                            <option value="2">MasterCard</option>
                            <option value="1">Visa</option>
                            <option value="6">IOU ;)</option>
                        </select>
                        <input type="text" name="CreditCard" placeholder="XXXX-XXXX-XXXX-XXXX" required="required" class="form-control col-sm-5">
                        <input type="text" name="CardExpMo" placeholder="MM" required="required" class="form-control col-sm-5">
                        <input type="text" name="CardExpYr" placeholder="YYYY" required="required" class="form-control col-sm-5">
                    </div>
                </form>
                <div class="col-lg-12">
                    <p style="text-align: center; margin-top: 20px;" class="cart-title col-lg-12"><a onClick="document.forms[0].submit(), thankYou()" class="button btn btn-primary btn-lg" href="index.jsp">Confirm Order</a></p>            
                </div>
            </div>
        </div>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>



</html>
