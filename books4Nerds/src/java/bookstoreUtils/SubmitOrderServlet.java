/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Enumeration;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.apache.derby.jdbc.ClientDriver;

/**
 *
 * @author tduffy
 */
public class SubmitOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet SubmitOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitOrderServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.sendRedirect("index.jsp");
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
        HttpSession session = request.getSession(true);
        ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
        String customerQuery = null;
        String orderDetailsQuery = null;
        //Grab custID from session if logged in.  Otherwise generate it here.
        int custID = new Random().nextInt(9999); 
        int orderID = new Random().nextInt(9999); 
        //Dump Customer Info into Customers Table
        //Enter Customer Query
        Enumeration e = request.getParameterNames();
        StringBuffer preCust = new StringBuffer(256);
        StringBuffer postCust = new StringBuffer(256);
        preCust.append("insert into Customers (");
        postCust.append(" values(");
        int i = 0;
        while(e.hasMoreElements()){
            if(i>0){
                preCust.append(", ");
                postCust.append(", ");
            }
            String name = (String)e.nextElement();
            preCust.append(name);
            //CreditCardTypeID maps to number field in DB for CreditCardType
            if(!name.equals("CreditCardTypeID")){
                postCust.append("'");
                postCust.append(request.getParameter(name));
                postCust.append("'");
            }else{
                //no quotes for CreditCardTypeID
                postCust.append(request.getParameter(name));
            }
            i++;
        }
        preCust.append(", CustomerID)");
        postCust.append(", " + custID + ")");
        customerQuery = preCust.toString() + postCust.toString();
        //End Customer Query
        int itemCount = cart.getItemCount();
        try{
            String dbURI = "jdbc:derby://localhost:1527/bookstore";
            DriverManager.registerDriver(new ClientDriver());
            Connection con = DriverManager.getConnection(dbURI);
            Statement stmt = con.createStatement();
            stmt.executeUpdate(customerQuery);
            
            //We'll need to execute the orderDetailsQuery for each item in the Shopping Cart
            for(int j=0; j<itemCount; j++){
                Item item = cart.getItem(j);
                orderDetailsQuery = "insert into OrderDetails (OrderID, ISBN, UnitPrice, Quantity, CustomerID) values(" + orderID + ", '" + item.getISBN() + "', '" + item.getPrice() + "', " + item.getQuantity() + ", " + custID + ")";
                stmt.executeUpdate(orderDetailsQuery);
            }
            
        }catch(Exception ex){
            response.sendRedirect("error.jsp?msg=" + ex.getMessage());
            return;
        }
        response.sendRedirect("index.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet to write orders to DB";
    }// </editor-fold>

}
