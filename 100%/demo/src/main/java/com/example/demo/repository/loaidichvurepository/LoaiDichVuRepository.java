package com.example.demo.repository.loaidichvurepository;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.repository.BaseRepository;
import com.example.demo.repository.dichvudikemrepository.DichVuDiKemRepository;
import com.example.demo.repository.dichvudikemrepository.IDichVuDiKemRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoaiDichVuRepository implements ILoaiDichVuRepository {
    private final String LAY_TAT_CA_LOAI_DICH_VU = "select * from loai_dich_vu;";
    private final String THEM_LOAI_DICH_VU = "INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES (?)";
    private final String SUA_LOAI_DICH_VU = "update loai_dich_vu set loai_dich_vu.ten_loai_dich_vu = ? where loai_dich_vu.id_loai_dich_vu = ?;";
    private final String XOA_LOAI_DICH_VU = "delete from loai_dich_vu where loai_dich_vu.id_loai_dich_vu = ?";

    @Override
    public List<LoaiDichVu> layDanhSachLoaiDichVu() {
        List<LoaiDichVu> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(LAY_TAT_CA_LOAI_DICH_VU);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_loai_dich_vu");
                String name = resultSet.getString("ten_loai_dich_vu");
                list.add(new LoaiDichVu(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                statement.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void themLoaiDichVu(LoaiDichVu loaiDichVu) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(THEM_LOAI_DICH_VU);
            preparedStatement.setString(1, loaiDichVu.getTenLoaiDichVu());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void suaLoaiDichVu(LoaiDichVu loaiDichVu) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUA_LOAI_DICH_VU);
            preparedStatement.setString(1, loaiDichVu.getTenLoaiDichVu());
            preparedStatement.setInt(2, loaiDichVu.getMaLoaiDichVu());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void xoaLoaiDichVu(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(XOA_LOAI_DICH_VU);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public LoaiDichVu layThongTinLDV(int id) {
        List<LoaiDichVu> list = layDanhSachLoaiDichVu();
        for (LoaiDichVu loaiDichVu : list) {
            if (loaiDichVu.getMaLoaiDichVu() == id) {
                return loaiDichVu;
            }
        }
        return null;
    }
}
