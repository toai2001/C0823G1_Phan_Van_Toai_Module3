package com.example.demo100.repo.impl;

import com.example.demo100.model.HangHoa;
import com.example.demo100.model.LoaiHangHoa;
import com.example.demo100.repo.BaseRepo;
import com.example.demo100.repo.IHangHoaRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HangHoarepo implements IHangHoaRepo {
    private static final String HIEN_THI = "select id_hang_hoa,ma_hang_hoa,ten_hang_hoa,don_vi_hang_hoa,ten_loai_hang_hoa,ngay_thu_hoach\n" +
            "from hang_hoa left join loai_hang_hoa on hang_hoa.id_loai_hang_hoa=loai_hang_hoa.id_loai_hang_hoa;";
    private static final String DELETE = "DELETE FROM hang_hoa" + " WHERE id_hang_hoa = ?";
    private static final String ADD = "INSERT INTO hang_hoa (ma_hang_hoa,ten_hang_hoa,don_vi_hang_hoa,ten_loai_hang_hoa,ngay_thu_hoach) VALUES(?,?,?,?,?);";


    @Override
    public List<HangHoa> display() {
        Connection connection = BaseRepo.getConnection();
        List<HangHoa> hangHoaList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(HIEN_THI);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_hang_hoa");
                String maHangHoa = resultSet.getString("ma_hang_hoa");
                String tenHangHoa = resultSet.getString("ten_hang_hoa");
                String donViHangHoa = resultSet.getString("don_vi_hang_hoa");
                String tenLoaiHangHoa = resultSet.getString("ten_loai_hang_hoa");
                Date ngayThuHoach = resultSet.getDate("ngay_thu_hoach");
                hangHoaList.add(new HangHoa(id, maHangHoa, tenHangHoa, donViHangHoa, new LoaiHangHoa(tenLoaiHangHoa), ngayThuHoach));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hangHoaList;
    }

    @Override
    public void add(HangHoa hangHoa) {
        Connection connection = BaseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, hangHoa.getMaHangHoa());
            preparedStatement.setString(2, hangHoa.getTenHangHoa());
            preparedStatement.setString(3, hangHoa.getDonViHangHoa());
            preparedStatement.setInt(4, hangHoa.getLoaiHangHoa().getIdLoaiHangHoa());
            preparedStatement.setDate(5, (java.sql.Date) hangHoa.getNgayThuHoach());
            preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepo.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void update(HangHoa hangHoa) {

    }

    @Override
    public HangHoa findById(int checkId) {
        return null;
    }
}
