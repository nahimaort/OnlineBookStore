package model;

import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Book {
    private String title;
    private String isbn;
    private long pages;
    private JSONObject date;
    private String thumbnailUrl;
    private String shortDescription;
    private String longDescription;
    private String status;
    private JSONArray authors;
    private JSONArray categories;
    private float price;

    public Book(String title, String isbn, long pages, JSONObject date, String thumbnailUrl, 
            String shortDescription, String longDescription, String status, JSONArray authors, JSONArray categories, float price) {
        this.title = title;
        this.isbn = isbn;
        this.pages = pages;
        this.date = date;
        this.thumbnailUrl = thumbnailUrl;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.status = status;
        this.authors = authors;
        this.categories = categories;
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public String getIsbn() {
        return isbn;
    }

    public long getPages() {
        return pages;
    }

    public JSONObject getDate() {
        return date;
    }
    
    public String getParsedDate() {
        JSONObject dateObj = this.getDate();
        String strDate = (String) dateObj.get("$date");
        String parsedDate = strDate.substring(0, strDate.indexOf('T'));
        return parsedDate;
    }
    
    public String getParsedAuthors() {
        ArrayList<String> authorsArray = new ArrayList<String>();
        for ( Object a : this.getAuthors()) {
            authorsArray.add((String) a);
        }
        String authorsStr = String.join(", ", authorsArray);
        return authorsStr;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public String getStatus() {
        return status;
    }

    public JSONArray getAuthors() {
        return authors;
    }

    public JSONArray getCategories() {
        return categories;
    }
    
    public float getPrice() {
        return price;
    }
    
    public String toString() {
        String str = "";
        str += "Title: " + title + "\n";
        str += "ISBN: " + isbn + "\n";
        str += "Pages: " + pages + "\n";
        str += "Thumbnail URL: " + thumbnailUrl + "\n";
        str += "Short description: " + shortDescription + "\n";
        str += "Long description: " + longDescription + "\n";
        str += "Status: " + status + "\n";
        str += "Authors: " + authors + "\n";
        str += "Categories: " + categories + "\n";
        return str;
    }
}
