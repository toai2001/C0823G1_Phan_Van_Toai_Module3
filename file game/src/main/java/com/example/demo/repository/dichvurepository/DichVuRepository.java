package com.example.demo.repository.dichvurepository;


import com.example.demo.model.BangSuDung;
import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.LoaiDichVu;
import com.example.demo.model.SuDungChiTiet;
import com.example.demo.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DichVuRepository implements IDichVuRepository {
    private final String SELECT_ALL_DICH_VU = "select*\n"
            + "from dich_vu_di_kem;";
    private final String SET_USING_DETAL = "INSERT INTO su_dung_chi_tiet (id_dich_vu_di_kem, id_bang_su_dung, so_luong) VALUES(?,?,?)";
    private final String GET_LIST_USED = "select  sdct.id_bang_su_dung,sdct.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem , sum(sdct.so_luong) as so_luong , dvdk.gia_dich_vu_di_kem \n"
            + "from su_dung_chi_tiet sdct\n"
            + " join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = sdct.id_dich_vu_di_kem\n"
            + "where sdct.id_bang_su_dung = ? "
            + "group by sdct.id_dich_vu_di_kem;";
    @Override
    public List<DichVuDiKem> getListDichVu() {
        Connection connection = BaseRepository.getConnection();
        List<DichVuDiKem> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DICH_VU);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idDichVu = resultSet.getInt("id_dich_vu_di_kem");
                String nameDichVu = resultSet.getString("ten_dich_vu_di_kem");
                double price = resultSet.getDouble("gia_dich_vu_di_kem");
                LoaiDichVu loaiDichVu = new LoaiDichVu(resultSet.getInt("id_loai_dich_vu"));
                DichVuDiKem dichVuDiKem = new DichVuDiKem(idDichVu,nameDichVu,price,loaiDichVu);
                list.add(dichVuDiKem);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity) {
        Connection connection = BaseRepository.getConnection();
        // SET_USING_DETAL = "INSERT INTO su_dung_chi_tiet (id_dich_vu_di_kem, id_bang_su_dung, so_luong)
        // VALUES(?,?,?)";
        System.out.println(idDichVuDiKem);
        System.out.println(idSuDung  + " " + quantity);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SET_USING_DETAL);
            preparedStatement.setInt(1,idDichVuDiKem);
            preparedStatement.setInt(2,idSuDung);
            preparedStatement.setInt(3,quantity);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public List<SuDungChiTiet> getListUsed(int idSuDung) {
        Connection connection = BaseRepository.getConnection();
        System.out.println("hello get repo");
        List<SuDungChiTiet> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST_USED);
            preparedStatement.setInt(1,idSuDung);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){

                String nameDichVuDiKem = resultSet.getString("ten_dich_vu_di_kem");
                double giaDichVuDiKem = resultSet.getDouble("gia_dich_vu_di_kem");
                int soLuong = resultSet.getInt("so_luong");
                int idDichVuDiKem = resultSet.getInt("id_dich_vu_di_kem");

                BangSuDung bangSuDung = new BangSuDung(idSuDung);
                DichVuDiKem dichVuDiKem = new DichVuDiKem(idDichVuDiKem,nameDichVuDiKem,giaDichVuDiKem);

                SuDungChiTiet suDungChiTiet = new SuDungChiTiet(dichVuDiKem,bangSuDung,soLuong);
                list.add(suDungChiTiet);


            }



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
