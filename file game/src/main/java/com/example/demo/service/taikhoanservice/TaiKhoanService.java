package com.example.demo.service.taikhoanservice;

import com.example.demo.model.TaiKhoan;
import com.example.demo.repository.taikhoanrepository.ITaiKhoanRepository;
import com.example.demo.repository.taikhoanrepository.TaiKhoanRepository;

import java.util.List;

public class TaiKhoanService implements ITaiKhoanService {
    private final ITaiKhoanRepository taikhoanRepo = new TaiKhoanRepository();

    @Override
    public TaiKhoan findById(int idTaiKhoan) {
        return taikhoanRepo.findById(idTaiKhoan);
    }

    @Override
    public List<TaiKhoan> findAll() {
        return taikhoanRepo.findAll();
    }

    @Override
    public Boolean createAccount(TaiKhoan taiKhoan) {
        return taikhoanRepo.createAccount(taiKhoan);
    }

    @Override
    public TaiKhoan findByUsername(String taiKhoan) {
        return taikhoanRepo.findByUsername(taiKhoan);
    }

    @Override
    public TaiKhoan findByUsernameAndPassWord(String taiKhoan, String matKhau) {
        return taikhoanRepo.findByUsernameAndPassWord(taiKhoan, matKhau);
    }
}

