package com.example.bai1.model;

public class Book {
    private int id;
    private  String tile;
    private int pageSize;
    private String author;
    private String category;


    public Book(String tile, int pageSize, String author, String category) {
        this.tile = tile;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Book(int id, String tile, int pageSize, String author, String category) {
        this.id = id;
        this.tile = tile;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTile() {
        return tile;
    }

    public void setTile(String tile) {
        this.tile = tile;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
