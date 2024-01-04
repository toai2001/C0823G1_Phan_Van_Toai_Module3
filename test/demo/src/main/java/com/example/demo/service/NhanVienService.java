package com.example.demo.service;

import com.example.demo.model.NhanVien;
import com.example.demo.repository.NhanVienRepo;
import com.example.demo.repository.impl.INhanVienRepo;
import com.example.demo.service.impl.INhanVienService;

import java.util.List;

public class NhanVienService implements INhanVienService {
    private INhanVienRepo iNhanVienRepo = new NhanVienRepo();

    @Override
    public List<NhanVien> display() {
        return iNhanVienRepo.display();
    }

    @Override
    public void add(NhanVien nhanVien) {
        iNhanVienRepo.add(nhanVien);
    }

    @Override
    public void remove(int id) {
        iNhanVienRepo.remove(id);
    }

    @Override
    public void update(NhanVien nhanVien) {
        iNhanVienRepo.update(nhanVien);
    }

    @Override
    public NhanVien findById(int checkId) {
        return iNhanVienRepo.findById(checkId);
    }
}
