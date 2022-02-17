package model;

public class Receipt {
    private ShoppingCart cart;

    public Receipt(ShoppingCart cart) {
        this.cart = cart;
    }
    
    public float getPriceWithoutIGIC() {
        float price = 0F;
        for (Book book : this.cart.getShoppingCart().keySet()) {
            price += cart.getCuantity(book) * book.getPrice();
        }
        return price;
    }
    
    public float calculateIGIC(float price) {
        return 0.07F * price;
    }
    
    public float getTotalAmount() {
        float priceWithoutIGIC = this.getPriceWithoutIGIC();
        return priceWithoutIGIC + this.calculateIGIC(priceWithoutIGIC);
    }
}
