<%-- 
    Document   : cart
    Created on : Oct 28, 2019, 1:27:33 PM
    Author     : 01792538
--%>
<%@page import="java.util.Vector"%>
<%@page import="bookstoreUtils.Item"%>
<%@page import="bookstoreUtils.ShoppingCart"%>
<%@page import="java.sql.*, org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String itemParam = request.getParameter("isbn");
    String clearParam = request.getParameter("clear");
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
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" id="index" lang=""> <!--<![endif]-->
    <%@include file="WEB-INF/jspf/HEAD.jspf" %>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <div id="header"></div>
        <div class="cart">
            <div class="container">
                <h1 class="cart-title">Shopping Cart</h1>
                <%
                    if (cart == null) {
                %>
                <h1 class="cart-title">Shopping Cart is Empty</h4>
                    <p>
                        <a href="results.jsp" class="button">Continue Shopping</a>
                    </p>
                    <%
                    } else {
                    %>
                    <p style="text-align: center;" class="cart-title"><a class="btn btn-primary btn-lg" href="checkout.jsp" role="button">Checkout</a></p>            

                    <form action="UpdateCartServlet" method="post">
                        <%
                            Vector items = cart.getCart();
                            int itemCount = items.size();
                            if (itemCount == 0) {
                        %>
                        <h1 class="cart-title">Shopping Cart is Empty</h4>
                            <p>
                                <a href="results.jsp" class="button">Continue Shopping</a>
                            </p>
                            <%
                                }
                            %>
                            <div class="labels">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-10">
                                    <p class="col-md-2">Title:</p>
                                    <p class="col-md-2">Author:</p>
                                    <p class="col-md-2">Quantity:</p>
                                    <p class="col-md-2">Price:</p>
                                    <div class="col-md-2"></div>
                                </div>
                            </div>
                            <%
                                for (int i = 0; i < itemCount; i++) {
                                    Item item = (Item) items.elementAt(i);
                            %>

                            <div class=" col-md-12 item1">
                                <div class="itempic col-md-2"><img src="<%= item.getCoverpic()%>" alt=""/></div>
                                <div class="iteminfo col-md-10">
                                    <p class="col-md-2"><%= item.getTitle()%></p>
                                    <p class="col-md-2"><%= item.getAuthor()%></p>
                                    <p class="col-md-2">
                                        <i class="material-icons-outlined button" onClick="increaseQuantity('item<%= i%>')">add_circle_outline</i>
                                        <input type="text" size="2" name="item<%= i%>" id="item<%= i%>" value="<%= item.getQuantity()%>" readonly="readonly" />
                                        <i class="material-icons-outlined button" onClick="decreaseQuantity('item<%= i%>')">remove_circle_outline</i>
                                        <!--<i class="material-icons-outlined button" onClick="removeItem('item0')">delete</i>-->
                                    </p>
                                    <p class="col-md-2"><%= item.getPrice()%></p>
                                </div>
                            </div>
                            <%
                                }
                                if (itemCount != 0) {
                            %>
                            <p style="text-align: right">
                                <input type="submit" value="Update Cart" class="button"/> <a href="cart.jsp?clear=true" class="button">Clear Cart</a> 
                                <a href="results.jsp" class="button">Continue Shopping</a>
                            </p>
                            <%
                                }
                            %>  
                    </form>
                    <%
                        }
                    %>
            </div>

        </div>
        <div id="footer"></div>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>');</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>



</html>
