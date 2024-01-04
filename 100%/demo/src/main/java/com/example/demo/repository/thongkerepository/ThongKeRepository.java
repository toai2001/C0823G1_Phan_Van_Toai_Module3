package com.example.demo.repository.thongkerepository;

import com.example.demo.model.ThongKe;
import com.example.demo.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ThongKeRepository implements IThongKeRepository {
    private static String SELECT = "SELECT \n" +
            "               DATE(bd.thoi_gian_bat_dau) AS ngay_su_dung, \n" +
            "              SUM(TIMESTAMPDIFF(SECOND, bd.thoi_gian_bat_dau, bd.thoi_gian_ket_thuc)) AS tong_thoi_gian_su_dung, \n" +
            "               SUM(dvd.gia_dich_vu_di_kem * sdt.so_luong) AS tong_tien_dich_vu \n" +
            "\t\tFROM \n" +
            "               su_dung_chi_tiet sdt \n" +
            "            right JOIN \n" +
            "                dich_vu_di_kem dvd ON sdt.id_dich_vu_di_kem = dvd.id_dich_vu_di_kem \n" +
            "\t\tright JOIN \n" +
            "                bang_su_dung bd ON sdt.id_bang_su_dung = bd.id_bang_su_dung \n" +
            "            GROUP BY \n" +
            "                ngay_su_dung;";


    private static String SELECT_BY_DATE = "          SELECT \n" +
            "    DATE(bd.thoi_gian_bat_dau) AS ngay_su_dung, \n" +
            "    SUM(TIMESTAMPDIFF(SECOND, bd.thoi_gian_bat_dau, bd.thoi_gian_ket_thuc)) AS tong_thoi_gian_su_dung, \n" +
            "    SUM(dvd.gia_dich_vu_di_kem * COALESCE(sdt.so_luong, 0)) AS tong_tien_dich_vu \n" +
            "FROM \n" +
            "    bang_su_dung bd\n" +
            "LEFT JOIN \n" +
            "    su_dung_chi_tiet sdt ON bd.id_bang_su_dung = sdt.id_bang_su_dung \n" +
            "LEFT JOIN \n" +
            "    dich_vu_di_kem dvd ON sdt.id_dich_vu_di_kem = dvd.id_dich_vu_di_kem\n" +
            "WHERE \n" +
            "    bd.thoi_gian_bat_dau IS NOT NULL \n" +
            "    AND bd.thoi_gian_ket_thuc IS NOT NULL\n" +
            "    AND DATE(bd.thoi_gian_bat_dau) = ? -- Thay đổi ngày cần kiểm tra\n" +
            "GROUP BY \n" +
            "    ngay_su_dung;";


    @Override
    public List<ThongKe> display() {
        Connection connection = BaseRepository.getConnection();
        List<ThongKe> thongKes = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Date ngay_su_dung = resultSet.getDate("ngay_su_dung");
                Long tong_thoi_gian = resultSet.getLong("tong_thoi_gian_su_dung");
                Long tong_tien_dich_vu = resultSet.getLong("tong_tien_dich_vu");
                thongKes.add(new ThongKe(tong_tien_dich_vu, tong_thoi_gian, ngay_su_dung));
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
                long tongThoiGianSuDung = resultSet.getLong("tong_thoi_gian_su_dung");
                long tongTienDichVu = resultSet.getLong("tong_tien_dich_vu");

                ThongKe thongKe = new ThongKe(tongTienDichVu, tongThoiGianSuDung, ngaySuDung);
                thongKes.add(thongKe);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return thongKes;
    }
}