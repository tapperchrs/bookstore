<%-- 
    Document   : checkout
    Created on : Oct 28, 2019, 1:29:01 PM
    Author     : 01792538
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <a href="index.html">
                        <img class="nav-img" src="images/B4N_MAIN_DF3770.png" alt=""/>
                    </a>  



                </div>





            </div><!--/.navbar-collapse -->

        </nav>

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div id="checkout">
            <div class="cart-checkout">
                <div class="container">
                    <div class="col-lg-3">
                        <img src="images/bookimg/SQLUnleashed.JPG" alt=""/>
                        <p class="col-sm-12 subtitle">SQL Unleashed Store</p>
                        <p class="col-sm-12">Quantity: 1</p>
                        <p class="col-sm-12">Price: $__.__</p>
                    </div>
                    <div class="col-lg-3">
                        <img src="images/bookimg/KillerInteractiveSites.gif" alt=""/>
                        <p class="col-sm-12 subtitle">Creating Killer Interactive Websites</p>
                        <p class="col-sm-12">Quantity: 1</p>
                        <p class="col-sm-12">Price: $__.__</p>
                    </div>
                    <div class="col-lg-3">
                        <img src="images/bookimg/InformationArchitecture.gif" alt=""/>
                        <p class="col-sm-12 subtitle">Information Architecture</p>
                        <p class="col-sm-12">Quantity: 1</p>
                        <p class="col-sm-12">Price: $__.__</p>
                    </div>
                    <div class="col-lg-3">
                        <img src="images/bookimg/CreatingVirtualStore.gif" alt=""/>
                        <p class="col-sm-12 subtitle">Creating The Virtual Store</p>
                        <p class="col-sm-12">Quantity: 1</p>
                        <p class="col-sm-12">Price: $__.__</p>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="col-lg-6 check">
                    <h1 class="col-lg-12" >Shipping Information</h1>
                    <h2 class="col-sm-6">First Name</h2>
                    <input type="text" placeholder="First Name" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Last Name</h2>
                    <input type="text" placeholder="Last Name" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Email</h2>
                    <input type="text" placeholder="Email" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Street Address</h2>
                    <input type="text" placeholder="Street Address" class="form-control col-sm-5">

                    <h2 class="col-sm-6">City</h2>
                    <input type="text" placeholder="City" class="form-control col-sm-5">

                    <h2 class="col-sm-6">State</h2>
                    <input type="text" placeholder="State" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Country</h2>
                    <input type="text" placeholder="Country" class="form-control col-sm-5">

                    <h2 class="col-sm-6">ZIP Code</h2>
                    <input type="text" placeholder="ZIP Code" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Phone Number</h2>
                    <input type="text" placeholder="Phone Number" class="form-control col-sm-5">

                    <h2 class="col-sm-6">Apt/Suite</h2>
                    <input type="text" placeholder="Apt/Suite" class="form-control col-sm-5">

                </div>
                <div class="col-lg-6 check">
                    <h1 class="col-lg-12" >Payment Information</h1>
                    <h2 class="col-sm-6">Card Number</h2>
                    <input type="text" placeholder="XXXX-XXXX-XXXX-XXXX" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Expiration Date</h2>
                    <input type="text" placeholder="MM/YYYY" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Security Code</h2>
                    <input type="text" placeholder="###" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Name on Card</h2> 
                    <input type="text" placeholder="Name" class="form-control col-sm-5">
                </div>
                <div class="col-lg-12">
                    <p style="text-align: center; margin-top: 20px;" class="cart-title col-lg-12"><a class="btn btn-primary btn-lg" href="index.html" role="button">Confirm Purchase</a></p>            
                </div>
                <hr style="background-color: #3285DF; height: 1px; color: #3285DF;">
                <div class="col-lg-6 check">
                    <h1 class="col-lg-12" >Personal Info</h1>
                    <h2 class="col-sm-6">Email</h2>
                    <input type="text" placeholder="Email" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Password</h2>
                    <input type="password" placeholder="Password" class="form-control col-sm-5">
                </div>
                <div class="col-lg-6">
                    <p style="text-align: center; margin-top: 20px; vertical-align: middle;" class="cart-title col-lg-12"><a class="btn btn-primary btn-lg" role="button">Create & Log into Account</a></p>            
                </div>
            </div>
            <footer>
                <div class="container footer-content">

                    <p class='col-sm-12 copyright'>
                        &copy; Books 4 Nerds Co. 2019
                    </p>
                </div>
            </footer>
        </div>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>



</html>
