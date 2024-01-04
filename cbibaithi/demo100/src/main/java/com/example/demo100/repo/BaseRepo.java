package com.example.demo100.repo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepo {
        private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hoa_qua";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    private BaseRepo() {
    }

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}