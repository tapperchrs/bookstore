<%-- 
    Document   : addNew
    Created on : Dec 1, 2019, 9:33:56 PM
    Author     : tduffy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.apache.derby.jdbc.ClientDriver"%>
<%@page import="bookstoreUtils.*,java.sql.*"%>
<%@ include file="../WEB-INF/jspf/checkLogin.jspf" %>
<%@ include file="../WEB-INF/jspf/connection.jspf" %>
<%
String tableName = (String)session.getAttribute("tableName");
%>
<html>
<head><title>Add New Record</title>
</head>
<body>
<%
/*String query = "select * from " + tableName;
if(tableName.equals("Books"))
    query = "select * from " + tableName + " where " + pKey + " = '" + value + "'";
else
    query = "select * from " + tableName + " where " + pKey + " = " + value;
*/

    ResultSet rs = stmt.executeQuery("select * from " + tableName);
    rs.next();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnCount = rsmd.getColumnCount();
%>
<form action="../NewRecordServlet" method="post">
<%
    for(int i=1; i<=columnCount; i++){
%>
<%= rsmd.getColumnLabel(i) %>: <textarea rows="2" cols="50" name="<%= rsmd.getColumnLabel(i) %>" value=""></textarea><br/>
<%
    }
%>
<input type="submit" value="Insert"/><button onClick="history.go(-1)">Cancel</button>
</form>
<%@ include file="../WEB-INF/jspf/close.jspf" %>
</body>
</html>

