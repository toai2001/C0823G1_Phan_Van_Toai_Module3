package com.example.demo.repository.taikhoanrepository;

import com.example.demo.model.TaiKhoan;
import com.example.demo.repository.BaseRepository;
import com.example.demo.service.Utils.BCryptUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaiKhoanRepository implements ITaiKhoanRepository {
    private static final String SELECT_BY_ID = "SELECT * FROM tai_khoan WHERE id_tai_khoan = ?";
    private static final String SELECT_ALL = "select * from tai_khoan";
    private static final String SELECT_ID_ACCOUNT = "select tai_khoan.id_tai_khoan\n" +
            "from tai_khoan\n" +
            "where tai_khoan.tai_khoan = ?;";
    private static final String NEW_EMPLOYEE = "insert into tai_khoan(tai_khoan, mat_khau, loai_tai_khoan) " +
            "values(?,?,?);";
    private static final String SELECT_BY_USERNAME = "SELECT * FROM tai_khoan WHERE tai_khoan = ?";
    private static final String SELECT_BY_USERNAME_AND_PASSWORD = "SELECT * FROM tai_khoan WHERE tai_khoan = ? AND mat_khau = ?";


    @Override
    public TaiKhoan findById(int idTaiKhoan) {
        Connection connection = BaseRepository.getConnection();
        TaiKhoan taiKhoan = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, idTaiKhoan);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                int taiKhoanId = resultSet.getInt("id_tai_khoan");
                String taiKhoan1 = resultSet.getString("tai_khoan");
                String matKhau1 = resultSet.getString("mat_khau");
                String type = resultSet.getString("loai_tai_khoan");
                taiKhoan = new TaiKhoan(taiKhoanId, taiKhoan1, matKhau1, type);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return taiKhoan;
    }

    @Override
    public List<TaiKhoan> findAll() {
        Connection connection = BaseRepository.getConnection();
        List<TaiKhoan> taiKhoanList = new ArrayList<>();
        TaiKhoan taiKhoan = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_tai_khoan");
                String useName = resultSet.getString("tai_khoan");
                String pass = resultSet.getString("mat_khau");
                String type = resultSet.getString("loai_tai_khoan");
                taiKhoan = new TaiKhoan(id, useName, pass, type);
                taiKhoanList.add(taiKhoan);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return taiKhoanList;
    }

    @Override
    public Boolean createAccount(TaiKhoan taiKhoan) {
        //NEW_EMPLOYEE = "insert into tai_khoan(tai_khoan, mat_khau, loai_tai_khoan) " +
        //            "values(?,?,?);";
        Connection connection = BaseRepository.getConnection();
        int count = 0;
        try {
            String passHash = BCryptUtils.encryptPassword(taiKhoan.getMatKhau());
            System.out.println(passHash);

            PreparedStatement preparedStatement = connection.prepareStatement(NEW_EMPLOYEE);
            preparedStatement.setString(1, taiKhoan.getTaiKhoan());
            preparedStatement.setString(2, passHash);
            preparedStatement.setString(3, taiKhoan.getLoaiTaiKhoan());
            count = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (count == 1);
    }

    @Override
    public TaiKhoan findByUsername(String taiKhoan) {
        Connection connection = BaseRepository.getConnection();
        TaiKhoan taiKhoan1 = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME);
            preparedStatement.setString(1, taiKhoan);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int account_id = resultSet.getInt("id_tai_khoan");
                String name = resultSet.getString("tai_khoan");
                String pass = resultSet.getString("mat_khau");
                String type = resultSet.getString("loai_tai_khoan");
                taiKhoan1 = new TaiKhoan(account_id, name, pass, type);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return taiKhoan1;
    }

    @Override
    public TaiKhoan findByUsernameAndPassWord(String taiKhoan, String matKhau) {
        Connection connection = BaseRepository.getConnection();
        TaiKhoan taiKhoan1 = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME_AND_PASSWORD);
            preparedStatement.setString(1, taiKhoan);
            preparedStatement.setString(2, matKhau);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int account_id = resultSet.getInt("id_tai_khoan");
                String name = resultSet.getString("tai_khoan");
                String pass = resultSet.getString("mat_khau");
                String type = resultSet.getString("loai_tai_khoan");
                taiKhoan1 = new TaiKhoan(account_id, name, pass, type);
            }
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return taiKhoan1;
    }

    @Override
    public int findIdAccount(String tk) {
        //SELECT_ID_ACCOUNT
        int idAccount = 0;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID_ACCOUNT);
          preparedStatement.setString(1,tk);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                 idAccount = resultSet.getInt("id_tai_khoan");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idAccount;
    }
}

