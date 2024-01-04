package com.example.demo.service.impl;

import com.example.demo.model.DichVuDiKem;

import java.util.List;

public interface IDichVuService {

  List<DichVuDiKem> getListDichVu();

  void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);
}
