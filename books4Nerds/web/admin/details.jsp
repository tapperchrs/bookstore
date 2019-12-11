<%-- 
    Document   : details
    Created on : Dec 1, 2019, 9:40:41 PM
    Author     : tduffy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.apache.derby.jdbc.ClientDriver"%>
<%@page import="bookstoreUtils.*,java.sql.*"%>
<%@ include file="../WEB-INF/jspf/checkLogin.jspf" %>
<%@ include file="../WEB-INF/jspf/connection.jspf" %>
<%
    java.util.Enumeration e = request.getParameterNames();
    String pKey = (String)e.nextElement();
    String value = request.getParameter(pKey);
    String tableName = (String)session.getAttribute("tableName");
%>
<html>
<head><title>Modify Details</title>
<script language="JavaScript">
function confirmDelete(){
    var del = confirm("Are you sure you wish to delete this record?");
    return del;
}
</script>
</head>
<body>
<%
    String query;
    if(tableName.equals("Books"))
        query = "select * from " + tableName + " where " + pKey + " = '" + value + "'";
    else
        query = "select * from " + tableName + " where " + pKey + " = " + value;

    ResultSet rs = stmt.executeQuery(query);
    rs.next();
    ResultSetMetaData rsmd = rs.getMetaData();
    int columnCount = rsmd.getColumnCount();
%>
<form action="../UpdateServlet" method="post">
<%
    for(int i=1; i<=columnCount; i++){
%>
<%= rsmd.getColumnLabel(i) %>: <textarea rows="2" cols="50" name="<%= rsmd.getColumnLabel(i) %>" value=""><%= rs.getString(i) %></textarea><br/>
<%
    }
%>
<input type="hidden" name="pKey" value="<%= pKey %>"/>
<input type="submit" value="Update"/><button onClick="history.go(-1)">Cancel</button>
</form>
<form action="../DeleteServlet" method="post" onSubmit="return confirmDelete()">
    <input type="hidden" name="pKey" value="<%= pKey %>"/>
    <input type="hidden" name="value" value="<%= value %>"/>
    <input type="submit" value="Delete"/>
</form>
    <%@ include file="../WEB-INF/jspf/close.jspf" %>
</body>
</html>
