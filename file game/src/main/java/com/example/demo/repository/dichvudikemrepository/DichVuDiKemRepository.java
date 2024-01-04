package com.example.demo.repository.dichvudikemrepository;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.repository.BaseRepository;
import com.example.demo.service.loaidichvuservice.ILoaiDichVuService;
import com.example.demo.service.loaidichvuservice.LoaiDichVuService;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DichVuDiKemRepository implements IDichVuDiKemRepository {
    private final String HIEN_THI_DICH_VU_DI_KEM = "select * from dich_vu_di_kem left join loai_dich_vu on dich_vu_di_kem.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu;";
    private final String XOA_DICH_VU_DI_KEM = "delete from dich_vu_di_kem where id_dich_vu_di_kem = ?;";
    private final String SUA_DICH_VU_DI_KEM = "update dich_vu_di_kem set ten_dich_vu_di_kem = ?, gia_dich_vu_di_kem = ?, id_loai_dich_vu =  ? where id_dich_vu_di_kem = ?;";
    private final String LAY_DANH_SACH_DICH_VU_DI_KEM = "SELECT * FROM computer.dich_vu_di_kem;";
    private final String THEM_DICH_VU_DI_KEM = "INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia_dich_vu_di_kem, id_loai_dich_vu) VALUES (?,?,?);";
    private final ILoaiDichVuService loaiDichVuService = new LoaiDichVuService();

    @Override
    public List<DichVuDiKem> layDanhSachDichVuDiKem() {
        List<DichVuDiKem> dvdk = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(LAY_DANH_SACH_DICH_VU_DI_KEM);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_dich_vu_di_kem");
                String name = resultSet.getString("ten_dich_vu_di_kem");
                double price = resultSet.getDouble("gia_dich_vu_di_kem");
                LoaiDichVu maLoaiDichVu = new LoaiDichVu(resultSet.getInt("id_loai_dich_vu"));
                dvdk.add(new DichVuDiKem(id, name, price, maLoaiDichVu));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dvdk;
    }

    @Override
    public List<DichVuDiKem> hienThiDichVuDiKem() {
        List<DichVuDiKem> dvdk = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(HIEN_THI_DICH_VU_DI_KEM);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_dich_vu_di_kem");
                String name = resultSet.getString("ten_dich_vu_di_kem");
                double price = resultSet.getDouble("gia_dich_vu_di_kem");
                String tenLoaiDichVu = resultSet.getString("ten_loai_dich_vu");
                dvdk.add(new DichVuDiKem(id, name, price, tenLoaiDichVu));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return dvdk;
    }

    @Override
    public void themDichVuDiKem(DichVuDiKem dichVuDiKem) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(THEM_DICH_VU_DI_KEM);
            preparedStatement.setString(1, dichVuDiKem.getTenDichVuDiKem());
            preparedStatement.setDouble(2, dichVuDiKem.getGiaDichVuDiKem());
            preparedStatement.setInt(3, dichVuDiKem.getIdLoaiDichVu());
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
    public void suaDichVuDikem(DichVuDiKem dichVuDiKem) {
        Connection connection = BaseRepository.getConnection();
        System.out.println(dichVuDiKem.getIdLoaiDichVu());
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SUA_DICH_VU_DI_KEM);
            preparedStatement.setString(1, dichVuDiKem.getTenDichVuDiKem());
            preparedStatement.setDouble(2, dichVuDiKem.getGiaDichVuDiKem());
            preparedStatement.setInt(3, dichVuDiKem.getIdLoaiDichVu());
            preparedStatement.setInt(4, dichVuDiKem.getMaDichVuDiKem());
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
    public void xoaDichVuDiKem(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(XOA_DICH_VU_DI_KEM);
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
}
