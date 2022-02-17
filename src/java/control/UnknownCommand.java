package control;

import java.io.IOException;
import javax.servlet.ServletException;

public class UnknownCommand extends FrontCommand {

    @Override
    void process() throws ServletException, IOException {
        forward("/commanderrorview.jsp");
    }
    
}
