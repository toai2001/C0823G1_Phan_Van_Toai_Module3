package com.example.demo.service.nhanvienservice;

import com.example.demo.model.NhanVien;
import com.example.demo.repository.nhanvienrepository.INhanVienRepository;
import com.example.demo.repository.nhanvienrepository.NhanVienRepository;

import java.util.List;

public class NhanVienService implements INhanVienService {
    private INhanVienRepository iNhanVienRepo = new NhanVienRepository();

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

