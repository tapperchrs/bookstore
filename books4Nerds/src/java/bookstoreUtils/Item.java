/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;

import java.sql.*;
import org.apache.derby.jdbc.*;

/**
 *
 * @author 01792538
 */
public class Item {

    private String ISBN, title, price, au_lastname, coverpic;
    private int quantity;

    public Item(String isbn) throws SQLException {
        String dbURI = "jdbc:derby://localhost:1527/bookstore";
        DriverManager.registerDriver(new ClientDriver());
        Connection con = DriverManager.getConnection(dbURI);
        Statement stmt = con.createStatement();
        String sql = "select isbn, title, price, au_lastname, coverpic from booksquery where isbn = '" + isbn + "'";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        this.ISBN = isbn;
        this.title = rs.getString("title");
        this.price = rs.getString("price");
        this.au_lastname = rs.getString("au_lastname");
        this.coverpic = rs.getString("coverpic");
        this.quantity = 1;
    }

    public String getISBN() {
        return ISBN;
    }

    public String getTitle() {
        return title;
    }

    public String getPrice() {
        return price;
    }

    public String getAuthor() {
        return au_lastname;
    }

    public String getCoverpic() {
        return coverpic;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
