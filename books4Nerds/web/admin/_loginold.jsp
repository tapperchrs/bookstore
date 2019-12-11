<%-- 
    Document   : index
    Created on : Oct 28, 2019, 12:19:47 PM
    Author     : 01792538
--%>
<%@page import="java.sql.*, org.apache.derby.jdbc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String dbURI = "jdbc:derby://localhost:1527/bookstore";
    String sql;
    jdbc:
    derby://localhost:1527/bookstore [ on APP]
    DriverManager.registerDriver(new ClientDriver());
    Connection con = DriverManager.getConnection(dbURI, "app", "app");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from books where special = 1");
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" id="index" lang=""> <!--<![endif]-->
    <html>
        <%@include file="WEB-INF/jspf/HEAD.jspf" %>
        <body>
        <form action="../LoginServlet" method="post">
          User ID: <input type="text" name="userId"/><br/>
          Password: <input type="password" name="password"/><br/>
          <input type="submit" value="Log In"/>
        </form>
    </body>



    </html>
