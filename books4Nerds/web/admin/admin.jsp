<%-- 
    Document   : admin
    Created on : Dec 1, 2019, 9:20:58 PM
    Author     : tduffy
--%>
<%@ include file="../WEB-INF/jspf/checkLogin.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Admin</title></head>
    <body>
        <a href="tableMod.jsp?tableName=Books">Administer Books</a><br/>
        <a href="tableMod.jsp?tableName=Authors">Administer Authors</a><br/>
        <a href="tableMod.jsp?tableName=Publishers">Administer Publishers</a>
    </body>
</html>
