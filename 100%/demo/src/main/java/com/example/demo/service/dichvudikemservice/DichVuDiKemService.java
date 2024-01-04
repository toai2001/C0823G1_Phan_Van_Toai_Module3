package com.example.demo.service.dichvudikemservice;

import com.example.demo.model.DichVuDiKem;
import com.example.demo.repository.dichvudikemrepository.DichVuDiKemRepository;
import com.example.demo.repository.dichvudikemrepository.IDichVuDiKemRepository;

import java.util.List;

public class DichVuDiKemService implements IDichVuDiKemService {
    private final IDichVuDiKemRepository dichVuDiKemRepository = new DichVuDiKemRepository();

    @Override
    public List<DichVuDiKem> layDanhSachDichVuDiKem() {
        return dichVuDiKemRepository.layDanhSachDichVuDiKem();
    }

    @Override
    public void themDichVuDiKem(DichVuDiKem dichVuDiKem) {
        dichVuDiKemRepository.themDichVuDiKem(dichVuDiKem);
    }

    @Override
    public void suaDichVuDikem(DichVuDiKem dichVuDiKem) {
        dichVuDiKemRepository.suaDichVuDikem(dichVuDiKem);
    }

    @Override
    public void xoaDichVuDiKem(int id) {
        dichVuDiKemRepository.xoaDichVuDiKem(id);
    }

    @Override
    public List<DichVuDiKem> hienThiDichVuDiKem() {
        return dichVuDiKemRepository.hienThiDichVuDiKem();
    }
}
