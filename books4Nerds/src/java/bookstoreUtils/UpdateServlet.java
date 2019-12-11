/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.derby.jdbc.ClientDriver;

/**
 *
 * @author tduffy
 */

@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("Update Started doPost");
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
        try{
            String dbURI = "jdbc:derby://localhost:1527/bookstore";
            DriverManager.registerDriver(new ClientDriver());
            con = DriverManager.getConnection(dbURI);
            stmt = con.createStatement();
            StringBuffer query = new StringBuffer(128);
            query.append("update " + tableName + " set ");
            
            //Remember to change autonumber in authors table to Number
            
            Enumeration params = request.getParameterNames();
            while(params.hasMoreElements()){
                String name = (String)params.nextElement();
                if(name.equals("pKey")||name.equals(pKey))
                    continue;
                String val = request.getParameter(name);
                if(val.equals("null"))
                    continue;
                if(name.equalsIgnoreCase("Pub_No")||name.equalsIgnoreCase("Au_No")||name.equalsIgnoreCase("Special")||name.equalsIgnoreCase("UnitWeight")||name.equalsIgnoreCase("au_id")||name.equalsIgnoreCase("pub_id"))
                    query.append(name + " = " + val + ", ");
                else
                    query.append(name + " = '" + val + "', ");
                
            }
            query.deleteCharAt(query.length()-2);
            query.append("where " + pKey + " = ");
            if(tableName.equals("Books"))
                query.append("'"  + request.getParameter(pKey) + "'");
            else
                query.append(request.getParameter(pKey));
            System.out.println(query.toString());
            stmt.executeUpdate(query.toString());
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
