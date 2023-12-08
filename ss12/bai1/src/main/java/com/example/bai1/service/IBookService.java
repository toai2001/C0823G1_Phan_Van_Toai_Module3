package com.example.bai1.service;

import com.example.bai1.model.Book;

import java.util.List;

public interface IBookService {
    List<Book> display();
    void addBook(Book book);
    void remove(int id);
    void update(Book book);
    Book findById(int checkId);

}
