/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;

import java.text.NumberFormat;
import java.util.*;

/**
 *
 * @author 01792538
 */
public class ShoppingCart {

    private Vector cart = new Vector();
    private int itemCount;
    private double total;

    public boolean addItem(Item item) {
        boolean retValue = true;
        if (itemCount == 0) {
            //first Item
            cart.addElement(item);
            itemCount++;
            return true;

        } else {
            //compare ISBN
            String isbn = item.getISBN();
            for (int i = 0; i < itemCount; i++) {
                Item cartItem = (Item) cart.elementAt(i);
                if (isbn.equals(cartItem.getISBN())) {
                    //found a match
                    retValue = false;
                    break;
                }
            }
            if (retValue) {
                //we have checked the cart, no match, add item
                cart.addElement(item);
                itemCount++;
                return true;
            } else {
                //item already in cart
                return false;
            }
        }

    }

    public Item getItem(int index) {
        return (Item) cart.elementAt(index);

    }

    public void removeItem(int index) {
        cart.remove(index);
        itemCount--;
    }

    public void removeItem(Item item) {
        cart.remove(item);
        itemCount--;
    }

    public void clearCart() {
        if (cart.size() > 0) {
            cart.removeAllElements();
        }
        itemCount = 0;
    }
    public int getItemCount() {
        return itemCount;
    }
    
    public Vector getCart() {
        return cart;
    }
    
    public double getTotal() {
        total = 0;
        for (int i = 0; i<itemCount; i++) {
            Item cartItem = (Item) cart.elementAt(i);
            double unitPrice = Double.parseDouble(cartItem.getPrice());
            int quantity = cartItem.getQuantity();
            total += unitPrice * quantity;
        }
        return total;
    }
    
    public String getStringTotal() {
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        return nf.format(getTotal());
    }
}
