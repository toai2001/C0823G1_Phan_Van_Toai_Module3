package com.example.demo.service.dichvuservice;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.SuDungChiTiet;

import java.util.List;

public interface IDichVuService {

    List<DichVuDiKem> getListDichVu();

    void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);

    List<SuDungChiTiet> getListUsed(int idSuDung);
}
