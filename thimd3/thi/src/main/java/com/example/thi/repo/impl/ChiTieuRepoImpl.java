package com.example.thi.repo.impl;

import com.example.thi.model.ChiTieu;
import com.example.thi.model.LoaiChiTieu;
import com.example.thi.repo.BaseRepository;
import com.example.thi.repo.IChiTieuRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ChiTieuRepoImpl implements IChiTieuRepo {
    private static final String HIEN_THI = "select id_chi_tieu, ten_chi_tieu,ngay_chi,so_tien_chi,so_tien_chi,mo_ta_them,ten_loai_chi_tieu\n" +
            "from chi_tieu left join loai_chi_tieu on chi_tieu.id_loai_chi_tieu = loai_chi_tieu.id_loai_chi_tieu;";


    private static final String XOA = "delete from chi_tieu where id_chi_tieu =? ; ";
    private static final String ADD = "INSERT INTO chi_tieu (ten_chi_tieu,ngay_chi,so_tien_chi,mo_ta_them,id_loai_chi_tieu) VALUES(?,?,?,?,?);";


    @Override
    public List<ChiTieu> display() {

        List<ChiTieu> chiTieuList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(HIEN_THI);
            while (resultSet.next()) {
                int idChiTieu = resultSet.getInt("id_chi_tieu");
                String tenChiTieu = resultSet.getString("ten_chi_tieu");
                Date ngayChi = resultSet.getDate("ngay_chi");
                Long soTienChi = resultSet.getLong("so_tien_chi");
                String moTaTHem = resultSet.getString("mo_ta_them");
                String loaiChiTieu = resultSet.getString("ten_loai_chi_tieu");
                chiTieuList.add(new ChiTieu(idChiTieu, tenChiTieu, ngayChi, soTienChi, moTaTHem, new LoaiChiTieu(loaiChiTieu)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return chiTieuList;
    }

    @Override
    public void add(ChiTieu chiTieu) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);

                preparedStatement.setString(1, chiTieu.getTenChiTieu());
                preparedStatement.setDate(2, (java.sql.Date) chiTieu.getNgayChi());
                preparedStatement.setLong(3, chiTieu.getSoTienChi());
                preparedStatement.setString(4, chiTieu.getMoTaThem());
                preparedStatement.setInt(5, chiTieu.getLoaiChiTieu().getIdLoaiChiTieu());
                preparedStatement.executeUpdate();
                preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(XOA);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }




    }
}
