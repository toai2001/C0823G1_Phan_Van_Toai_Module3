package com.example.duan.service.impl;

import com.example.duan.model.DichVuDiKem;
import com.example.duan.model.LoaiDichVu;
import java.util.List;

public interface IDichVuService {

  List<DichVuDiKem> getListDichVu();

  void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity);
}
