package com.example.duan.repository;

import com.example.duan.model.DichVuDiKem;
import com.example.duan.model.LoaiDichVu;
import com.example.duan.repository.impl.IDichVuRepository;
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
}
