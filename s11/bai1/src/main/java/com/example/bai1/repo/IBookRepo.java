package com.example.bai1.repo;

import com.example.bai1.model.Book;

import java.util.List;

public interface IBookRepo {
    List<Book> display();

    void addBook(Book book);

    void removeBook(int id);

    List<Book> searchBook(String tile);

    Book findById(int id);

    void updateBook(int id,String tile, int pageSize, String author, String category);
}
