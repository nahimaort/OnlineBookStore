package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import model.ShoppingCart;

public class PerformPurchaseCommand extends FrontCommand {

    @Override
    void process() throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        cart.getShoppingCart().clear();
        session.setAttribute("cart", cart);
        forward("/successfulpurchaseview.jsp");
    }
    
}
