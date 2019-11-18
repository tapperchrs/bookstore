<%-- 
    Document   : login
    Created on : Oct 28, 2019, 1:32:13 PM
    Author     : 01792538
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div id="checkout">

            <div class="container">
                <div class="col-lg-6 check">
                    <h1 class="col-lg-12" >Create an Account</h1>
                    <h2 class="col-sm-6">Enter your email</h2>
                    <input type="text" placeholder="Email" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Enter your password</h2>
                    <input type="password" placeholder="Password" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Re-enter your password</h2>
                    <input type="password" placeholder="Password" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Security Email</h2>
                    <input type="text" placeholder="Security Email" class="form-control col-sm-5">
                    <p style="text-align: center; margin-top: 20px;" class="cart-title col-lg-12"><a class="btn btn-primary btn-lg" href="index.html" role="button">Create Account</a></p>
                </div>
                <div class="col-lg-6 check">
                    <h1 class="col-lg-12" >Sign In</h1>
                    <h2 class="col-sm-6">Email</h2>
                    <input type="text" placeholder="Email" class="form-control col-sm-5">
                    <h2 class="col-sm-6">Password</h2>
                    <input type="password" placeholder="Password" class="form-control col-sm-5">
                    <h2 style="text-align: right;" class="col-md-12"><a style="color: #3285DF;" href="index.html">Forgot Password?</a></h2>
                    <p style="text-align: center; margin-top: 20px;" class="cart-title col-lg-12"><a class="btn btn-primary btn-lg" href="index.html" role="button">Sign In</a></p>            

                </div>
            </div>
            
            <div id="footer"></div>
        </div>
        <script>window.jry || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>

</html>
