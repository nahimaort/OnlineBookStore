package model;

import java.util.ArrayList;
import model.util.BookJSONReader;
import model.util.Reader;

public class Catalogue {
    private ArrayList<Book> catalog = new ArrayList<>();

    public Catalogue(String path) {
        Reader fileReader = new BookJSONReader();
        fileReader.addItemsFromReader(path, this);
    }
    
    public ArrayList<Book> getCatalogue() {
        return catalog;
    }
    
    public void addToCatalogue(Book book) {
        catalog.add(book);
    }
    
    public Book findByIsbn(String isbn) {
        for (Book b : this.getCatalogue()) {
            if (b.getIsbn().equals(isbn)) 
                return b;
        }
        return null;
    }
}
