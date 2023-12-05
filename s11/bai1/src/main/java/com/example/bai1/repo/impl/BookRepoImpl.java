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
    private static final String DELETE = "DELETE FROM book" + " WHERE id = ?";
    private static final String FINDBYID = "select * FROM book" + " WHERE id = ?";

    private static final String UPDATE = "UPDATE book" +
            " SET tile = ?, \n" +
            " size_page = ?, \n" +
            " author = ?, \n" +
            "category = ?\n" +
            "WHERE id = ?";

    private static final String SEARCH ="SELECT book.tile " +
            "FROM book " +
            "WHERE tile LIKE ?";

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
    public void removeBook(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> searchBook(String tile) {
//        Connection connection = BaseRepository.getConnection();
//        List<Book> bookList = new ArrayList<>();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
//            preparedStatement.setString(1,"%"+tile+"%");
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()){
//                String tile1 =resultSet.getString("tile");
//                bookList.add(new Book(tile));
//
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
        return null;
    }

    @Override
    public Book findById(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FINDBYID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Book(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getInt(3),
                        resultSet.getString(4),
                        resultSet.getString(5));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void updateBook(int id,String tile, int pageSize, String author, String category) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, tile);
            preparedStatement.setDouble(2, pageSize);
            preparedStatement.setString(3, author);
            preparedStatement.setString(4, category);
            preparedStatement.setInt(5,id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
