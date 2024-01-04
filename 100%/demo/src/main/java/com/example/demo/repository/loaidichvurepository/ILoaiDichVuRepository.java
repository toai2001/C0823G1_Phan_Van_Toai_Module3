package com.example.demo.repository.loaidichvurepository;

import com.example.demo.model.LoaiDichVu;

import java.util.List;

public interface ILoaiDichVuRepository {
    List<LoaiDichVu> layDanhSachLoaiDichVu();

    void themLoaiDichVu(LoaiDichVu loaiDichVu);

    void suaLoaiDichVu(LoaiDichVu loaiDichVu);

    void xoaLoaiDichVu(int id);
    LoaiDichVu layThongTinLDV(int id);

}
