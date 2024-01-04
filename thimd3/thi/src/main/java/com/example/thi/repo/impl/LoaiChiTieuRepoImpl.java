package com.example.thi.repo.impl;

import com.example.thi.model.LoaiChiTieu;
import com.example.thi.repo.BaseRepository;
import com.example.thi.repo.ILoaiChiTieuRepo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoaiChiTieuRepoImpl implements ILoaiChiTieuRepo {
    private static final String HIEN_THI = "SELECT * FROM loai_chi_tieu;";


    @Override
    public List<LoaiChiTieu> hienThiLoaiChiTieu() {
        List<LoaiChiTieu> loaiChiTieuList = new ArrayList<>();

        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(HIEN_THI);
            while (resultSet.next()) {
                int idLoaiChiTieu = resultSet.getInt("id_loai_chi_tieu");
                String tenLoaiChiTieu = resultSet.getString("ten_loai_chi_tieu");
                loaiChiTieuList.add(new LoaiChiTieu(idLoaiChiTieu, tenLoaiChiTieu));

            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return loaiChiTieuList;

    }
}
