package com.example.bai1.repo.impl;

import com.example.bai1.model.Author;
import com.example.bai1.model.Category;
import com.example.bai1.repo.BaseRepository;
import com.example.bai1.repo.ICategoryRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepoImpl implements ICategoryRepo {
    private static final String SELEC_CATEGORY = "SELECT * FROM category ";

    @Override
    public List<Category> display() {
        Connection connection = BaseRepository.getConnection();
        List<Category> categoryList = new ArrayList<>();
//        Category category = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELEC_CATEGORY);
            while (resultSet.next()) {
                int categoryId = resultSet.getInt("category_id");
                String categoryName = resultSet.getString("category_name");
                categoryList.add(new Category(categoryId, categoryName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList ;
    }
}
