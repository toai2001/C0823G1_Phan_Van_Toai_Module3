package com.example.demo.repository.nhanvienrepository;

import com.example.demo.model.NhanVien;
import com.example.demo.model.TaiKhoan;
import com.example.demo.repository.BaseRepository;
import com.example.demo.repository.taikhoanrepository.ITaiKhoanRepository;
import com.example.demo.repository.taikhoanrepository.TaiKhoanRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NhanVienRepository implements INhanVienRepository {
    private final ITaiKhoanRepository taikhoanRepo = new TaiKhoanRepository();
    private static final String SELECT_ALL = "select * from nhan_vien;";
    private static final String DELETE = "delete from nhan_vien where id_nhan_vien = ?";
    private static final String INSERT = "INSERT INTO nhan_vien (ten_nhan_vien, so_dien_thoai, id_tai_khoan) VALUES (?,?,?);";
    private static final String SELECT_BY_ID = "select * from nhan_vien where id_nhan_vien = ?";
    private static final String UPDATE = "update nhan_vien set ten_nhan_vien = ?," +
            " so_dien_thoai= ?, id_tai_khoan = ? where id_nhan_vien = ? ";


    @Override
    public List<NhanVien> display() {
        Connection connection = BaseRepository.getConnection();
        List<NhanVien> nhanVienList = new ArrayList<>();
        NhanVien nhanVien = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_nhan_vien");
                String name = resultSet.getString("ten_nhan_vien");
                String phone = resultSet.getString("so_dien_thoai");
                TaiKhoan taiKhoanId = taikhoanRepo.findById(resultSet.getInt("id_tai_khoan"));
                nhanVienList.add(new NhanVien(id, name, phone, taiKhoanId));


            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nhanVienList;
    }

    @Override
    public void add(NhanVien nhanVien) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, nhanVien.getTenNhanVien());
            preparedStatement.setString(2, nhanVien.getSoDienThoaiNhanVien());
            preparedStatement.setInt(3, nhanVien.getMaTaiKhoan().getIdTaiKhoan());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void update(NhanVien nhanVien) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, nhanVien.getTenNhanVien());
            preparedStatement.setString(2, nhanVien.getSoDienThoaiNhanVien());
            preparedStatement.setInt(3, nhanVien.getMaTaiKhoan().getIdTaiKhoan());
            preparedStatement.setInt(4, nhanVien.getIdNhanVien());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public NhanVien findById(int checkId) {
        Connection connection = BaseRepository.getConnection();
        NhanVien nhanVien = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, checkId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id_nhan_vien");
                String name = resultSet.getString("ten_nhan_vien");
                String phone = resultSet.getString("so_dien_thoai");
                TaiKhoan taiKhoanId = taikhoanRepo.findById(resultSet.getInt("id_tai_khoan"));
                nhanVien = new NhanVien(id, name, phone, taiKhoanId);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nhanVien;
    }
}

