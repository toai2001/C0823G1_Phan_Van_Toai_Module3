package com.example.demo.repository.nhanvienrepository;


import com.example.demo.model.NhanVien;

import java.util.List;

public interface INhanVienRepository {
    List<NhanVien> display();

    void add(NhanVien nhanVien);

    void remove(int id);

    void update(NhanVien nhanVien);

    NhanVien findById(int checkId);
}
