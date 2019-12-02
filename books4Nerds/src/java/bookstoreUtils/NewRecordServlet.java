/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.*;
import org.apache.derby.jdbc.ClientDriver;

/**
 *
 * @author tduffy
 */
public class NewRecordServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewRecordServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewRecordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        Connection con = null;
        Statement stmt;
        ResultSet rs;
        HttpSession session = request.getSession(false);
        String loggedIn = (String)session.getAttribute("loggedIn");
        if(!loggedIn.equals("true")){
            response.sendRedirect("admin/index.html");
            return;
        }
        String tableName = (String)session.getAttribute("tableName");
        try{
            String dbURI = "jdbc:derby://localhost:1527/bookstore";
            DriverManager.registerDriver(new ClientDriver());
            con = DriverManager.getConnection(dbURI);
            stmt = con.createStatement();
            StringBuffer query = new StringBuffer(128);
            StringBuffer fields = new StringBuffer(128);
            StringBuffer values = new StringBuffer(128);
            query.append("insert into " + tableName);
            Enumeration params = request.getParameterNames();
            fields.append(" (");
            values.append(" values(");
            while(params.hasMoreElements()){
                String name = (String)params.nextElement();
                String val = request.getParameter(name);
                fields.append(name + ", ");
                if(name.equalsIgnoreCase("Pub_No")||name.equalsIgnoreCase("Au_No")||name.equalsIgnoreCase("Special")||name.equalsIgnoreCase("UnitWeight")||name.equalsIgnoreCase("au_id")||name.equalsIgnoreCase("pub_id"))
                    values.append(val + ", ");
                else
                    values.append("'" + val + "', ");
                
            }
            fields.deleteCharAt(fields.length()-2);
            values.deleteCharAt(values.length()-2);
            fields.append(")");
            values.append(")");
            query.append(fields).append(values);
            System.out.println(query.toString());
            stmt.executeUpdate(query.toString());
            response.sendRedirect("admin/tableMod.jsp?tableName=" + tableName);
            return;
        }catch(Exception e){
            response.sendRedirect("error.jsp?msg=" + e.getMessage());
            return;
        }finally{
            try{
                if(con!=null)
                    con.close();
            }catch(Exception e){}
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
