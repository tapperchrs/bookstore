<%-- 
    Document   : cart
    Created on : Oct 28, 2019, 1:27:33 PM
    Author     : 01792538
--%>
<%@page import="java.sql.*, org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String isbn = request.getParameter("isbn");

    

    String dbURI = "jdbc:derby://localhost:1527/bookstore";
    DriverManager.registerDriver(new ClientDriver());
    Connection con = DriverManager.getConnection(dbURI, "app", "app");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from booksquery where isbn = '" + isbn + "'");
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


        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="cart">
            <div class="container">
                <h1 class="cart-title">Shopping Cart</h1>
                <p style="text-align: center;" class="cart-title"><a class="btn btn-primary btn-lg" href="checkout.jsp" role="button">Checkout</a></p>            
                <div class="labels">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-10">
                        <p class="col-md-2">Title:</p>
                        <p class="col-md-2">Condition:</p>
                        <p class="col-md-2">Author:</p>
                        <p class="col-md-2">Quantity:</p>
                        <p class="col-md-2">Price:</p>
                        <div class="col-md-2"></div>
                    </div>
                </div>
                <div class=" col-md-12 item1">
                    <div class="itempic col-md-2">
                        <img src="images/bookimg/SQLUnleashed.JPG" alt=""/>
                    </div>
                    <div class="iteminfo col-md-10">
                        <p class="col-md-2">SQL Unleashed</p>
                        <p class="col-md-2">New</p>
                        <p class="col-md-2">_____</p>
                        <p class="col-md-2">1&#9660;</p>
                        <p class="col-md-2">
                            $_____
                        </p>
                        <p class="col-md-2"><i class="material-icons">remove_shopping_cart</i></p>            


                    </div>
                </div>
                <div class="col-md-5">

                </div>
                <div class=" col-md-12 item2">
                    <div class="itempic col-md-2">
                        <img src="images/bookimg/KillerInteractiveSites.gif" alt=""/>
                    </div>
                    <div class="iteminfo col-md-10">
                        <p class="col-md-2"> Creating Killer Interactive Sites</p>
                        <p class="col-md-2">New</p>
                        <p class="col-md-2">_____</p>
                        <p class="col-md-2">1&#9660;</p>
                        <p class="col-md-2">
                            $_____
                        </p>
                        <p class="col-md-2"><i class="material-icons">remove_shopping_cart</i></p>            

                    </div>
                    <div class="col-md-5">

                    </div>
                </div>
                <div class=" col-md-12 item3">
                    <div class="itempic col-md-2">
                        <img src="images/bookimg/InformationArchitecture.gif" alt=""/>
                    </div>
                    <div class="iteminfo col-md-10">
                        <p class="col-md-2">Information Architecture</p>
                        <p class="col-md-2">Used</p>
                        <p class="col-md-2">_____</p>
                        <p class="col-md-2">1&#9660;</p>
                        <p class="col-md-2">
                            $_____
                        </p>
                        <p class="col-md-2"><i class="material-icons">remove_shopping_cart</i></p>            

                    </div>
                </div>
                <div class=" col-md-12 item4">
                    <div class="itempic col-md-2">
                        <img src="images/bookimg/CreatingVirtualStore.gif" alt=""/>
                    </div>
                    <div class="iteminfo col-md-10">
                        <p class="col-md-2">Creating the Virtual Store</p>
                        <p class="col-md-2">New</p>
                        <p class="col-md-2">_____</p>
                        <p class="col-md-2">1&#9660;</p>
                        <p class="col-md-2">
                            $_____
                        </p>
                        <p class="col-md-2"><i class="material-icons">remove_shopping_cart</i></p>            

                    </div>
                </div>
            </div>


        </div>
        <div class="related">
            <div class="container">
                <h1 class="row2 col-lg-12">
                    Related Books
                </h1>
                <div class="col-lg-3">
                    <img src="images/bookimg/CreatingVirtualStore.gif" alt=""/>
                    <p class="col-sm-12 subtitle">Creating the Virtual Store</p>
                    <p class="col-sm-12">&#11088;&#11088;&#11088;</p>
                    <p class="col-sm-12">Price: $_____</p>
                </div>
                <div class="col-lg-3">
                    <img src="images/bookimg/NonDesignerWebBook.gif" alt=""/>
                    <p class="col-sm-12 subtitle">Non Designer Web Book</p>
                    <p class="col-sm-12">&#11088;&#11088;&#11088;&#11088;</p>
                    <p class="col-sm-12">Price: $_____</p>
                </div>
                <div class="col-lg-3">
                    <img src="images/bookimg/WebPageDesign.gif" alt=""/>
                    <p class="col-sm-12 subtitle">Web Page Design</p>
                    <p class="col-sm-12">&#11088;&#11088;&#11088;&#11088;&#11088;</p>
                    <p class="col-sm-12">Price: $_____</p>
                </div>
                <div class="col-lg-3">
                    <img src="images/bookimg/WebPubHTML.JPG" alt=""/>
                    <p class="col-sm-12 subtitle">Web Publishing with HTML</p>
                    <p class="col-sm-12">&#11088;&#11088;</p>
                    <p class="col-sm-12">Price: $_____</p>
                </div>
            </div>
        </div>

        <div id="footer"></div>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>');</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>



</html>
