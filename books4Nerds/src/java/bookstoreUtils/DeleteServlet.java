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
public class DeleteServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteServlet at " + request.getContextPath() + "</h1>");
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
        String pKey = request.getParameter("pKey");
        String value = request.getParameter("value");
        try{
            String dbURI = "jdbc:derby://localhost:1527/bookstore";
            DriverManager.registerDriver(new ClientDriver());
            con = DriverManager.getConnection(dbURI);
            stmt = con.createStatement();
            String query;
            if(tableName.equals("Books"))
                query = "delete from " + tableName + " where " + pKey + " = '" + value + "'";
            else
                query = "delete from " + tableName + " where " + pKey + " = " + value;
            System.out.println(query);
            stmt.executeUpdate(query);
            response.sendRedirect("admin/tableMod.jsp?tableName=" + tableName);
            return;
        }catch(Exception e){
            response.sendRedirect("error.jsp?msg=" + e.getMessage());
            System.out.println(e.toString());
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
