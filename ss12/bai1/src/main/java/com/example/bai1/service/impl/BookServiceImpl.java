package com.example.bai1.service.impl;

import com.example.bai1.model.Book;
import com.example.bai1.repo.IBook;
import com.example.bai1.repo.impl.BookRepoImpl;
import com.example.bai1.service.IBookService;

import java.util.List;

public class BookServiceImpl implements IBookService {
    private IBook iBook = new BookRepoImpl();
    @Override
    public List<Book> display() {
        return iBook.display();
    }

    @Override
    public void addBook(Book book) {
        iBook.addBook(book);
        }

    @Override
    public void remove(int id) {
        iBook.remove(id);

    }

    @Override
    public void update(Book book) {
        iBook.update(book);
    }

    @Override
    public Book findById(int checkId) {
        return  iBook.findById(checkId);
    }
}
