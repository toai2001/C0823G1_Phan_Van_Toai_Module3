package com.example.bai1.model;

public class Book {
    private  int id ;
    private String bookTile;
    private int bookPageSize;
    private Author author;
    private Category category;


    public Book(int id, String bookTile, int bookPageSize, Author author,Category category) {
        this.id = id;
        this.bookTile = bookTile;
        this.bookPageSize = bookPageSize;
        this.category = category;
        this.author = author;
    }

    public Book(String bookTile, int bookPageSize, Author author, Category category) {
        this.bookTile = bookTile;
        this.bookPageSize = bookPageSize;
        this.category = category;
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBookTile() {
        return bookTile;
    }

    public void setBookTile(String bookTile) {
        this.bookTile = bookTile;
    }

    public int getBookPageSize() {
        return bookPageSize;
    }

    public void setBookPageSize(int bookPageSize) {
        this.bookPageSize = bookPageSize;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
