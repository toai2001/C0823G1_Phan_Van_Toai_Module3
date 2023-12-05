package com.example.bai1.service.impl;

import com.example.bai1.model.Book;
import com.example.bai1.repo.IBookRepo;
import com.example.bai1.repo.impl.BookRepoImpl;
import com.example.bai1.service.IBookService;

import java.util.List;

public class BookServiceImpl implements IBookService {
    private IBookRepo iBookRepo = new BookRepoImpl();

    @Override
    public List<Book> display() {
        return iBookRepo.display();
    }

    @Override
    public void addBook(Book book) {
        iBookRepo.addBook(book);
    }


    @Override
    public void removeBook(int id) {
        iBookRepo.removeBook(id);
    }

    @Override
    public List<Book> searchBook(String tile) {
        return iBookRepo.searchBook(tile);
    }

    @Override
    public Book findById(int id) {
        return iBookRepo.findById(id);
    }

    @Override
    public void updateBook(int id,String tile, int pageSize, String author, String category) {
        iBookRepo.updateBook(id ,tile,pageSize,author,category);

    }
}
