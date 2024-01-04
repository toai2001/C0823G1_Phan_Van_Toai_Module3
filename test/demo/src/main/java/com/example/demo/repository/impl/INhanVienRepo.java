package com.example.demo.repository.impl;

import com.example.demo.model.NhanVien;

import java.util.List;

public interface INhanVienRepo {
    List<NhanVien> display();

    void add(NhanVien nhanVien);

    void remove(int id);

    void update(NhanVien nhanVien);

    NhanVien findById(int checkId);
}
