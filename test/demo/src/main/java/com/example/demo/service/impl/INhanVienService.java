package com.example.demo.service.impl;

import com.example.demo.model.NhanVien;

import java.util.List;

public interface INhanVienService {
    List<NhanVien> display();

    void add(NhanVien nhanVien);

    void remove(int id);

    void update(NhanVien nhanVien);

    NhanVien findById(int checkId);
}
