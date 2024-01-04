package com.example.demo100.repo.impl;

import com.example.demo100.model.LoaiHangHoa;
import com.example.demo100.repo.BaseRepo;
import com.example.demo100.repo.ILoaiHangHoa;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class LoaiHangHoaRepo implements ILoaiHangHoa {
    private static final String HIEN_THI = "select * from loai_hang_hoa;";


    @Override
    public List<LoaiHangHoa> hienThiLoaiHangHoa() {
        Connection connection = BaseRepo.getConnection();
        List<LoaiHangHoa> loaiHangHoaList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(HIEN_THI);
            while (resultSet.next()) {
                int loaiHangHoaId = resultSet.getInt("id_loai_hang_hoa");
                String tenLoaiHangHoa = resultSet.getString("ten_loai_hang_hoa");
                loaiHangHoaList.add(new LoaiHangHoa(loaiHangHoaId, tenLoaiHangHoa));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return loaiHangHoaList;
    }
}
