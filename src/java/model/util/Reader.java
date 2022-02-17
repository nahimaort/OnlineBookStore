package model.util;

import model.Catalogue;

public interface Reader {
    void addItemsFromReader(String path, Catalogue catalog);
}
