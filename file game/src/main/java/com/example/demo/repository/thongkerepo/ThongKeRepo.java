package com.example.demo.repository.thongkerepo;

import com.example.demo.model.ThongKe;
import com.example.demo.repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ThongKeRepo implements IThongkeRepo {
    private static String SELECT = "SELECT " +
            "    DATE(bd.thoi_gian_bat_dau) AS ngay_su_dung, " +
            "    bd.ma_may_tinh, " +
            "    SUM(TIMESTAMPDIFF(SECOND, bd.thoi_gian_bat_dau, bd.thoi_gian_ket_thuc)) AS tong_thoi_gian_su_dung, " +
            "    SUM(dvd.gia_dich_vu_di_kem * sdt.so_luong) AS tong_tien_dich_vu " +
            "FROM " +
            "    su_dung_chi_tiet sdt " +
            "RIGHT JOIN " +
            "    dich_vu_di_kem dvd ON sdt.id_dich_vu_di_kem = dvd.id_dich_vu_di_kem " +
            "RIGHT JOIN " +
            "    bang_su_dung bd ON sdt.id_bang_su_dung = bd.id_bang_su_dung " +
//            "  WHERE\n" +
//            "    DATE(bd.thoi_gian_bat_dau) = ?"
//            +
            "GROUP BY " +
            "    ngay_su_dung, bd.ma_may_tinh;";


    private static String SELECT_BY_DATE = "SELECT " +
            "    DATE(bd.thoi_gian_bat_dau) AS ngay_su_dung, " +
            "    bd.ma_may_tinh, " +
            "    SUM(TIMESTAMPDIFF(SECOND, bd.thoi_gian_bat_dau, bd.thoi_gian_ket_thuc)) AS tong_thoi_gian_su_dung, " +
            "    SUM(dvd.gia_dich_vu_di_kem * sdt.so_luong) AS tong_tien_dich_vu " +
            "FROM " +
            "    su_dung_chi_tiet sdt " +
            "RIGHT JOIN " +
            "    dich_vu_di_kem dvd ON sdt.id_dich_vu_di_kem = dvd.id_dich_vu_di_kem " +
            "RIGHT JOIN " +
            "    bang_su_dung bd ON sdt.id_bang_su_dung = bd.id_bang_su_dung " +
            "  WHERE\n" +
            "    DATE(bd.thoi_gian_bat_dau) = ?"
            +
            "GROUP BY " +
            "    ngay_su_dung, bd.ma_may_tinh;";


    @Override
    public List<ThongKe> display() {
        Connection connection = BaseRepository.getConnection();
        List<ThongKe> thongKes = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Date ngay_su_dung = resultSet.getDate("ngay_su_dung");
                int id = resultSet.getInt("ma_may_tinh");
                Long tong_thoi_gian = resultSet.getLong("tong_thoi_gian_su_dung");
                Long tong_tien_dich_vu = resultSet.getLong("tong_tien_dich_vu");

                thongKes.add(new ThongKe(id, tong_tien_dich_vu, tong_thoi_gian, ngay_su_dung));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return thongKes;
    }

    @Override
    public List<ThongKe> displayByDate(Date selectedDate) {
        Connection connection = BaseRepository.getConnection();
        List<ThongKe> thongKes = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_DATE);
            preparedStatement.setDate(1, new java.sql.Date(selectedDate.getTime()));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Date ngaySuDung = resultSet.getDate("ngay_su_dung");
                int maMayTinh = resultSet.getInt("ma_may_tinh");
                long tongThoiGianSuDung = resultSet.getLong("tong_thoi_gian_su_dung");
                long tongTienDichVu = resultSet.getLong("tong_tien_dich_vu");

                ThongKe thongKe = new ThongKe(maMayTinh, tongTienDichVu, tongThoiGianSuDung, ngaySuDung);
                thongKes.add(thongKe);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return thongKes;
    }
}
