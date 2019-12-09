<%-- 
    Document   : search
    Created on : Oct 28, 2019, 1:32:26 PM
    Author     : 01792538
--%>
<%@page import="java.sql.*, org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String keyword = request.getParameter("keyword");

    StringBuffer sb = new StringBuffer(64);
    sb.append("select * from booksquery where title like '%");
    sb.append(keyword);
    sb.append("%' or au_lastname like '%");
    sb.append(keyword);
    sb.append("%' or isbn like '%");
    sb.append(keyword);
    sb.append("%' or keywords like '%");
    sb.append(keyword);
    sb.append("%' or description like '%");
    sb.append(keyword);
    sb.append("%' order by price desc");

    String dbURI = "jdbc:derby://localhost:1527/bookstore";
    DriverManager.registerDriver(new ClientDriver());
    Connection con = DriverManager.getConnection(dbURI, "app", "app");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sb.toString());
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
<!--            <div class="sort col-lg-12">
                <h1>Filter By:</h1>
                <div class="col-sm-12 sorted">
                    
                    <input class="col-sm-2" style="height:20px!important;" placeholder="ISBN"/>

                    <input class="col-sm-2" style="height:20px!important;" placeholder="Author"/>

                    <input class="col-sm-2" style="height:20px!important;" placeholder="Title"/>

                    <select class="col-sm-2">
                        <option value="Category" disabled="disabled">Category</option>

                        <option value="category">category</option>
                    </select>

                    <select class="col-sm-2">
                        <option value="Price" placeholder="Price" hidden="yes">Price</option>
                        <option value="Price" placeholder="Price">< $20.00</option>
                        <option value="Price" placeholder="Price">$20.00 - $35.00</option>
                        <option value="Price" placeholder="Price">> $35.00</option>
                    </select>

                    <select class="col-sm-2">
                        <option value="Publisher" placeholder="Publisher" hidden="yes">Publisher</option>
                        <option value="Publisher" placeholder="Publisher">Publisher</option>
                        <option value="Publisher" placeholder="Publisher">Publisher</option>
                    </select>
                </div>
            </div>-->
            <div class="items col-md-12">
                <h1 class="col-lg-12 results">Search Results</h1>
                <%
                    while (rs.next()) {

                %>
                <div class="col-md-3">
                    <a href="book.jsp?isbn=<%= rs.getString("isbn")%>"><h2><%= rs.getString("title")%></h2></a>
                    <a href="book.jsp?isbn=<%= rs.getString("isbn")%>"><img src="<%= rs.getString("coverpic")%>" alt="<%= rs.getString("title")%>"/></a>
                    <p>Author: <%= rs.getString("au_firstname")%> <%= rs.getString("au_midname")%> <%= rs.getString("au_lastname")%></p>
                    <p>Price: $<%= rs.getString("price")%></p>
                    <p>Publisher: <%= rs.getString("pub_name")%></p>
                    <div class="col-md-12">
                        <p><a class="btn btn-primary col-md-6" href="book.jsp?isbn=<%= rs.getString("isbn")%>" role="button"><i class="material-icons">info</i></a>
                            <a class="btn btn-primary col-md-6" href="cart.jsp?isbn=<%=rs.getString("isbn")%>" role="button"><i class="material-icons">add_shopping_cart</i></a>
                        </p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>

    </div>

    <div id="footer"></div>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>');</script>

    <script src="js/vendor/bootstrap.min.js"></script>

    <script src="js/main.js"></script>

</body>



</html>
