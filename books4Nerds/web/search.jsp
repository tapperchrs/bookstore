<%-- 
    Document   : search
    Created on : Oct 28, 2019, 1:32:26 PM
    Author     : 01792538
--%>
<%@page import="java.sql.*, org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sql;
    String keyword = request.getParameter("keyword");
    String dbURI = "jdbc:derby://localhost:1527/bookstore";
    DriverManager.registerDriver(new ClientDriver());
    Connection con = DriverManager.getConnection(dbURI, "app", "app");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from booksquery where title like '%"+ keyword + "%'");
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <%@include file="WEB-INF/jspf/HEAD.jspf" %>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <div id="header"></div>


        <!-- Main jumbotron for a primary marketing message or call to action -->

        <div class="container">
            <!-- Example row of columns -->
            <div class="sort col-lg-12">
                
            </div>
            <div class="items col-md-12">
                
            </div>
                

        </div>

    <div id="footer"></div>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>');</script>

    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/main.js"></script>

</body>



</html>
