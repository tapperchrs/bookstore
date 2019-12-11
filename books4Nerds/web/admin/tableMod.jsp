<%-- 
    Document   : tableMod
    Created on : Dec 1, 2019, 9:25:22 PM
    Author     : tduffy
--%>
<%@page import="org.apache.derby.jdbc.ClientDriver"%>
<%@page import="bookstoreUtils.*,java.sql.*"%>
<%@ include file="../WEB-INF/jspf/checkLogin.jspf" %>
<%@ include file="../WEB-INF/jspf/connection.jspf" %>
<%
    String tableName = request.getParameter("tableName");
    session.setAttribute("tableName",tableName);
%>
<!DOCTYPE html>
<html>
<head><title>Admin <%= tableName %></title></head>
<body>
    Admin <%= tableName %><br/>
    <a href="admin.jsp">Switch Tables</a><br/>
    <a href="addNew.jsp">New Record</a><br/>
    <%
    String query = "";
    if(tableName.equals("Books"))
        query = "select ISBN, Title from Books order by Title";
    else
        query = "select * from " + tableName;
    ResultSet rs = stmt.executeQuery(query);
    %>
    <%= BookstoreUtils.getTable(rs,1,true,2,1,"details.jsp") %>
    <%@ include file="../WEB-INF/jspf/close.jspf" %>
</body>
</html>
