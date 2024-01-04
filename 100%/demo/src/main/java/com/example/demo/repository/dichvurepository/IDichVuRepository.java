package com.example.demo.repository.dichvurepository;


import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.SuDungChiTiet;

import java.util.List;

public interface IDichVuRepository {

    List<DichVuDiKem> getListDichVu();

    void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);

    List<SuDungChiTiet> getListUsed(int idSuDung);
}