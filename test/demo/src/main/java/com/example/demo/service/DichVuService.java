package com.example.demo.service;



import com.example.demo.model.DichVuDiKem;
import com.example.demo.repository.DichVuRepository;
import com.example.demo.repository.impl.IDichVuRepository;
import com.example.demo.service.impl.IDichVuService;

import java.util.List;

public class DichVuService implements IDichVuService {
  private final IDichVuRepository iDichVuRepository = new DichVuRepository();

  @Override
  public List<DichVuDiKem> getListDichVu() {
    return iDichVuRepository.getListDichVu();
  }

  @Override
  public void addUsingDetail(int idDichVuDiKem, int idSuDung, int quantity) {
    iDichVuRepository.addUsingDetail(idDichVuDiKem,idSuDung,quantity);
  }
}
