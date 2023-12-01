package com.example.bai1.repo.impl;

import com.example.bai1.model.Book;
import com.example.bai1.repo.IBookRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BookRepoImpl implements IBookRepo {
    private static final String DISPLAY = "  select * from book";
    private static final String ADD = "INSERT INTO book(tile,size_page,author,category)\n" +
            "value (?,?,?,?);";
    private static final String DELETE = "DELETE FROM book\n" +"WHERE id = ?";

    @Override
    public List<Book> display() {
        Connection connection = BaseRepository.getConnection();
        List<Book> bookList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(DISPLAY);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String tile = resultSet.getString("tile");
                int pageSize = resultSet.getInt("size_page");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                bookList.add(new Book(id, tile, pageSize, author, category));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public void addBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, book.getTile());
            preparedStatement.setInt(2, book.getPageSize());
            preparedStatement.setString(3, book.getAuthor());
            preparedStatement.setString(4, book.getCategory());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateBook(Book book) {

    }

    @Override
    public void removeBook(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> searchBook(String tile) {
        return null;
    }

    @Override
    public Book findById(int id) {
        return null;
    }
}
