package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Catalogue;
import model.ShoppingCart;

public class RemoveFromCartCommand extends FrontCommand{
    @Override
    void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        Catalogue catalogue = (Catalogue) session.getAttribute("catalogue");
        String isbn = (String) request.getParameter("isbn");

        Book book = catalogue.findByIsbn(isbn);
        cart.removeFromCart(book);
        forward("/shoppingcartview.jsp");
    }
}
