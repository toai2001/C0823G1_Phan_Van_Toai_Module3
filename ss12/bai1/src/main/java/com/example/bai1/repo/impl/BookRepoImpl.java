package com.example.bai1.repo.impl;

import com.example.bai1.model.Author;
import com.example.bai1.model.Book;
import com.example.bai1.model.Category;
import com.example.bai1.repo.BaseRepository;
import com.example.bai1.repo.IBook;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepoImpl implements IBook {
    private static final String SELECT_BOOK = "select books_id,books_tile,books_page_size,authors_name,category_name \n" +
            "from books b \n" +
            "left join authors a \n" +
            "on a.authors_id = b.authors_id \n" +
            "left join category c \n" +
            "on c.category_id = b.category_id\n";
    private static final String FIND_BY_ID = "select books_id,books_tile,books_page_size,authors_id,authors_name,category_id,category_name \n" +
            "from books b \n" +
            "left join authors a \n" +
            "on a.authors_id = b.authors_id \n" +
            "left join category c \n" +
            "on c.category_id = b.category_id\n" + " WHERE books_id = ? ";
    private static final String INSER_INTO_BOOK = " INSERT INTO books(books_tile,books_page_size,category_id,authors_id) values(?,?,?,?);";
        private static final String DELETE_BOOK = "DELETE FROM books" + " WHERE books_id = ?";
    private static final String UPDATE = "UPDATE books" +
            " SET books_tile = ?, \n" +
            " books_page_size = ?, \n" +
            " authors_id = ?, \n" +
            "category_id = ?\n" +
            "WHERE books_id = ?";

    @Override
    public List<Book> display() {
        Connection connection = BaseRepository.getConnection();
        List<Book> bookList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_BOOK);
            while (resultSet.next()) {
                int id = resultSet.getInt("books_id");
                String bookTile = resultSet.getString("books_tile");
                int bookPageSize = resultSet.getInt("books_page_size");
                String authorName = resultSet.getString("authors_name");
                String categoryName = resultSet.getString("category_name");
                bookList.add(new Book(id, bookTile, bookPageSize, new Author(categoryName), new Category(authorName)));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public void addBook(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSER_INTO_BOOK);
            preparedStatement.setString(1, book.getBookTile());
            preparedStatement.setInt(2, book.getBookPageSize());
            preparedStatement.setInt(3, book.getCategory().getCategoryId());
            preparedStatement.setInt(4, book.getAuthor().getAuthorId());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Book book) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setInt(1, book.getId());
            preparedStatement.setString(2, book.getBookTile());
            preparedStatement.setInt(3, book.getBookPageSize());
            preparedStatement.setInt(4, book.getAuthor().getAuthorId());
            preparedStatement.setInt(5, book.getCategory().getCategoryId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public Book findById(int checkId) {
        Connection connection = BaseRepository.getConnection();
        Book book = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, checkId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("books_id");
                String bookTile = resultSet.getString("books_tile");
                int bookPageSize = resultSet.getInt("books_page_size");
                int authorsId = resultSet.getInt("authors_id");
                String authorName = resultSet.getString("authors_name");
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");


                book = new Book(id, bookTile, bookPageSize, new Author(authorsId, authorName), new Category(categoryId, categoryName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return book;
    }
}
