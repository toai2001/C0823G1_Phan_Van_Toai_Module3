package com.example.demo.service.loaidichvuservice;

import com.example.demo.model.LoaiDichVu;
import com.example.demo.repository.loaidichvurepository.ILoaiDichVuRepository;
import com.example.demo.repository.loaidichvurepository.LoaiDichVuRepository;

import java.util.List;

public class LoaiDichVuService implements ILoaiDichVuService {
    private final ILoaiDichVuRepository loaiDichVuRepository = new LoaiDichVuRepository();

    @Override
    public List<LoaiDichVu> layDanhSachLoaiDichVu() {
        return loaiDichVuRepository.layDanhSachLoaiDichVu();
    }

    @Override
    public void themLoaiDichVu(LoaiDichVu loaiDichVu) {
        loaiDichVuRepository.themLoaiDichVu(loaiDichVu);
    }

    @Override
    public void suaLoaiDichVu(LoaiDichVu loaiDichVu) {
        loaiDichVuRepository.suaLoaiDichVu(loaiDichVu);
    }

    @Override
    public void xoaLoaiDichVu(int id) {
         loaiDichVuRepository.xoaLoaiDichVu(id);
    }

    @Override
    public LoaiDichVu layThongTinLDV(int id) {
        return loaiDichVuRepository.layThongTinLDV(id);
    }
}
