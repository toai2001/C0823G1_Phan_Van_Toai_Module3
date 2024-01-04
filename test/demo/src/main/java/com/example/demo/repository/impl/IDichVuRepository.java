package com.example.demo.repository.impl;

import com.example.demo.model.DichVuDiKem;


import java.util.List;

public interface IDichVuRepository {

  List<DichVuDiKem> getListDichVu();

  void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);
}
