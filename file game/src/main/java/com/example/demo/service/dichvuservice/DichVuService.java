package com.example.demo.service.dichvuservice;


import com.example.demo.model.DichVuDiKem;
import com.example.demo.model.SuDungChiTiet;
import com.example.demo.repository.dichvurepository.DichVuRepository;
import com.example.demo.repository.dichvurepository.IDichVuRepository;

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

    @Override
    public List<SuDungChiTiet> getListUsed(int idSuDung) {
        return iDichVuRepository.getListUsed(idSuDung);
    }
}