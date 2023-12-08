package com.example.bai1.repo.impl;

import com.example.bai1.model.Author;
import com.example.bai1.repo.BaseRepository;
import com.example.bai1.repo.IAuthorRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorRepoImpl implements IAuthorRepo {
    private static final String SELECT_AUTHOR="SELECT * FROM authors";

    @Override
    public List<Author> display() {
        Connection connection = BaseRepository.getConnection();
        List<Author> authorList = new ArrayList<>();
//        Author author = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_AUTHOR);
            while (resultSet.next()){
                int authorId = resultSet.getInt("authors_id");
                String authorName = resultSet.getString("authors_name");
                authorList.add(new Author(authorId,authorName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return authorList;
    }
}
