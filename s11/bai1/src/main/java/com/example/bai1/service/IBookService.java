package com.example.bai1.service;

import com.example.bai1.model.Book;

import java.util.List;

public interface IBookService {
    List<Book> display();

    void addBook(Book book);

    void removeBook(int id);

    List<Book> searchBook(String tile);

    Book findById(int id);

    void updateBook(int id,String name, int price, String description, String supplier);
}
