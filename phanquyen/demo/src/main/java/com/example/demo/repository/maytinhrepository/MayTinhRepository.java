package com.example.demo.repository.maytinhrepository;

import com.example.demo.model.BangSuDung;
import com.example.demo.model.MayTinh;
import com.example.demo.model.NhanVien;
import com.example.demo.repository.BaseRepository;

import java.sql.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class MayTinhRepository implements IMayTinhRepository {
    private final String START_TIME = "INSERT INTO bang_su_dung (thoi_gian_bat_dau, ma_may_tinh, id_nhan_vien) VALUES(?,?,?)";
    private final String SET_STATUS_ON = "update may_tinh set status = ? where ma_may_tinh = ?;";
    private final String SET_STATUS_OFF = "update may_tinh set status = ? where ma_may_tinh = ?;";
    private final String SELECT_ID_SU_DUNG = "SELECT bang_su_dung.id_bang_su_dung\n"
            + "FROM bang_su_dung\n"
            + "WHERE bang_su_dung.ma_may_tinh = ? \n"
            + "ORDER BY bang_su_dung.thoi_gian_bat_dau DESC\n"
            + "LIMIT 1;";
    private final String END_TIME = "update bang_su_dung set thoi_gian_ket_thuc = ? where ma_may_tinh = ? and id_bang_su_dung = ?;";
    private final String SELECT_ALL_COMPUTER = "select mt.ma_may_tinh,mt.ten_may_tinh,mt.ram, mt.chip,mt.hang,mt.is_delete from may_tinh mt";

    //  private final String SELECT_ALL_COMPUTER_USING = "select mt.ma_may_tinh,mt.ten_may_tinh,mt.ram, mt.chip,mt.hang,mt.is_delete from may_tinh mt"
//      + "  where mt.status = 1;";
    private final String SELECT_ALL_COMPUTER_USING = "SELECT mt.ten_may_tinh,mt.ma_may_tinh,bsd.*\n"
            + " FROM bang_su_dung bsd \n"
            + " join may_tinh mt on bsd.ma_may_tinh = mt.ma_may_tinh\n"
            + " where  bsd.thoi_gian_ket_thuc is  null;";
    private final String SELECT_COMPUTER_NOT_RENTAL = "select mt.ma_may_tinh,mt.ten_may_tinh,mt.ram, mt.chip,mt.hang,mt.is_delete from may_tinh mt"
            + "  where mt.status = 0;";


    private final String SELECT_COMPUTER = "select*\n"
            + "from may_tinh mt\n"
            + "where   ma_may_tinh = ? And is_delete = ?;";


    private final String SELECT_HISTORY_RENTAL = "SELECT bsd.*\n"
            + " FROM bang_su_dung bsd \n"
            + " join may_tinh mt on bsd.ma_may_tinh = mt.ma_may_tinh\n"
            + " where mt.ma_may_tinh = ? and bsd.thoi_gian_ket_thuc is not null ;";

    private final String SELECT_BILL = "SELECT SUM(tong_tien) AS total_tong_tien\n"
            + "FROM (\n"
            + "    SELECT sdct.id_bang_su_dung, SUM(dvdk.gia_dich_vu_di_kem * sdct.so_luong) AS `tong_tien`\n"
            + "    FROM su_dung_chi_tiet sdct\n"
            + "    JOIN dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem = sdct.id_dich_vu_di_kem\n"
            + "    WHERE sdct.id_bang_su_dung = ?\n"
            + "    GROUP BY sdct.id_dich_vu_di_kem\n"
            + ") AS subquery;";
    private final String SET_STATUS_PAYMENT = "update bang_su_dung\n"
            + "set status = 1 \n"
            + "where id_bang_su_dung = ?";


    @Override
    public MayTinh getComputer(int id) {
        MayTinh mayTinh = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COMPUTER);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, 0);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idMayTinh = resultSet.getInt("ma_may_tinh");
                String tenMayTinh = resultSet.getString("ten_may_tinh");
                String ram = resultSet.getString("ram");
                String chip = resultSet.getString("chip");
                String hang = resultSet.getString("hang");
                boolean is_delete = resultSet.getBoolean("is_delete");
                mayTinh = new MayTinh(idMayTinh, tenMayTinh, ram, chip, hang, is_delete);
            }
            // SET_STATUS = "update may_tinh set status = ? where ma_may_tinh = ?;";


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return mayTinh;
    }

    @Override
    public void endTimeComputer(BangSuDung bangSuDung) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(END_TIME);
            int idMay = bangSuDung.getMaMayTinh().getIdMayTinh();
            preparedStatement.setObject(1, bangSuDung.getGioKetThuc());
            preparedStatement.setInt(2, idMay);
            preparedStatement.setInt(3, bangSuDung.getIdBangSuDung());
            preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement(SET_STATUS_OFF);
            preparedStatement.setInt(1, 0);
            preparedStatement.setInt(2, idMay);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int startTimeComputer(BangSuDung bangSuDung) {
        Connection connection = BaseRepository.getConnection();
        int id_bang_su_dung = 0;
        try {
            //INSERT INTO bang_su_dung (thoi_gian_bat_dau, ma_may_tinh, id_nhan_vien)
            // VALUES(?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(START_TIME);
            preparedStatement.setObject(1, bangSuDung.getGioBatDau());
            int idMay = bangSuDung.getMaMayTinh().getIdMayTinh();
            int idNhanVien = bangSuDung.getMaNhanVien().getIdNhanVien();
            preparedStatement.setInt(2, idMay);
            preparedStatement.setInt(3, idNhanVien);
            preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement(SELECT_ID_SU_DUNG);
            preparedStatement.setInt(1, idMay);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                id_bang_su_dung = resultSet.getInt("id_bang_su_dung");
            }
            //SET_STATUS = "update may_tinh set status = ? where ma_may_tinh = ?;";
            preparedStatement = connection.prepareStatement(SET_STATUS_ON);
            preparedStatement.setInt(1, 1);
            preparedStatement.setInt(2, idMay);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_bang_su_dung;
    }

    @Override
    public List<MayTinh> getListMayTinh() {
        List<MayTinh> mayTinhList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_COMPUTER);
            while (resultSet.next()) {
                int idMayTinh = resultSet.getInt("ma_may_tinh");
                String tenMayTinh = resultSet.getString("ten_may_tinh");
                String ramMayTinh = resultSet.getString("ram");
                String chip = resultSet.getString("chip");
                String hang = resultSet.getString("hang");
                Boolean isDelete = resultSet.getBoolean("is_delete");
                mayTinhList.add(new MayTinh(idMayTinh, tenMayTinh, ramMayTinh, chip, hang, isDelete));
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
        return mayTinhList;
    }

    @Override
    public List<BangSuDung> getListAreRental() {

        List<BangSuDung> mayTinhList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_COMPUTER_USING);
            while (resultSet.next()) {

                String tenMayTinh = resultSet.getString("ten_may_tinh");
                Timestamp timestampStart = resultSet.getTimestamp("thoi_gian_bat_dau");
                LocalDateTime thoi_gian_bat_dau = timestampStart.toLocalDateTime();
                int idNhanVien = resultSet.getInt("id_nhan_vien");
                int idMayTinh = resultSet.getInt("ma_may_tinh");

                MayTinh mayTinh = new MayTinh(idMayTinh, tenMayTinh);
                NhanVien nhanVien = new NhanVien(idNhanVien);
                BangSuDung bangSuDung = new BangSuDung(thoi_gian_bat_dau, mayTinh, nhanVien);
                mayTinhList.add(bangSuDung);
//        mayTinhList.add(new MayTinh(idMayTinh, tenMayTinh, ramMayTinh, chip, hang, isDelete));
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

        return mayTinhList;
    }

    @Override
    public List<MayTinh> listNotRental() {
        List<MayTinh> mayTinhList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_COMPUTER_NOT_RENTAL);
            while (resultSet.next()) {
                int idMayTinh = resultSet.getInt("ma_may_tinh");
                String tenMayTinh = resultSet.getString("ten_may_tinh");
                String ramMayTinh = resultSet.getString("ram");
                String chip = resultSet.getString("chip");
                String hang = resultSet.getString("hang");
                Boolean isDelete = resultSet.getBoolean("is_delete");
                mayTinhList.add(new MayTinh(idMayTinh, tenMayTinh, ramMayTinh, chip, hang, isDelete));
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
        return mayTinhList;
    }

    @Override
    public int getIdSuDung(int idMay) {
        Connection connection = BaseRepository.getConnection();
        int id_bang_su_dung = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID_SU_DUNG);
            preparedStatement.setInt(1, idMay);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                id_bang_su_dung = resultSet.getInt("id_bang_su_dung");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id_bang_su_dung;
    }

    @Override
    public List<BangSuDung> historyRental(int idMay) {
        Connection connection = BaseRepository.getConnection();
        BangSuDung bangSuDung;
        List<BangSuDung> historyRental = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HISTORY_RENTAL);
            PreparedStatement statement = null;
            preparedStatement.setInt(1, idMay);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_bang_su_dung = resultSet.getInt("id_bang_su_dung");
                double total_tien = 0;
                Timestamp timestampStart = resultSet.getTimestamp("thoi_gian_bat_dau");
                LocalDateTime thoi_gian_bat_dau = timestampStart.toLocalDateTime();
                Timestamp timestampEnd = resultSet.getTimestamp("thoi_gian_ket_thuc");
                LocalDateTime thoi_gian_ket_thuc = timestampEnd.toLocalDateTime();
                boolean status = resultSet.getBoolean("status");
                statement = connection.prepareStatement(SELECT_BILL);
                statement.setInt(1, id_bang_su_dung);
                ResultSet resultSet1 = statement.executeQuery();

                while (resultSet1.next()) {
                    total_tien = resultSet1.getDouble("total_tong_tien");
                }

                int idNhanVienNhanVien = resultSet.getInt("id_nhan_vien");
                NhanVien nhanVien = new NhanVien(idNhanVienNhanVien);
                MayTinh mayTinh = new MayTinh(idMay);

                Duration duration = Duration.between(thoi_gian_bat_dau, thoi_gian_ket_thuc);

                long seconds = duration.getSeconds();

                total_tien = total_tien + (10000.0 / 3600.0) * seconds;

                bangSuDung = new BangSuDung(id_bang_su_dung, thoi_gian_bat_dau, thoi_gian_ket_thuc, mayTinh, nhanVien, total_tien, seconds, status);
                historyRental.add(bangSuDung);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return historyRental;
    }

    @Override
    public void setConfirmationPayment(int idSuDung) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SET_STATUS_PAYMENT);
            preparedStatement.setInt(1, idSuDung);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}