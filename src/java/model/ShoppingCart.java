package model;

import java.util.HashMap;
import java.util.Map;

public class ShoppingCart {
    Map<Book, Integer> shoppingCart = new HashMap<>();
    
    public Map<Book, Integer> getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(Map<Book, Integer> shoppingCart) {
        this.shoppingCart = shoppingCart;
    }
    
    public void addToCart(Book book) {
        shoppingCart.put(book, shoppingCart.containsKey(book) ? shoppingCart.get(book) + 1: 1);
    }
    
    public Integer getCuantity(Book book) {
        return shoppingCart.get(book);
    }

    public void removeFromCart(Book book) {
        Integer cuantity = shoppingCart.get(book) - 1;
        if (cuantity > 0) {
            shoppingCart.put(book, cuantity);
        }
        else if (cuantity == 0) {
            shoppingCart.remove(book);
        }
    }
}
