package com.example.demo.repository.dichvudikemrepository;

import com.example.demo.model.DichVuDiKem;

import java.util.List;

public interface IDichVuDiKemRepository {
    List<DichVuDiKem> layDanhSachDichVuDiKem();

    void themDichVuDiKem(DichVuDiKem dichVuDiKem);

    void suaDichVuDikem(DichVuDiKem dichVuDiKem);

    void xoaDichVuDiKem(int id);

    List<DichVuDiKem> hienThiDichVuDiKem();
}
