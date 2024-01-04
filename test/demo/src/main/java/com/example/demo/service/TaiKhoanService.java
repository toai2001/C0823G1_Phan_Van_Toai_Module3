package com.example.demo.service;

import com.example.demo.model.TaiKhoan;
import com.example.demo.repository.TaikhoanRepo;
import com.example.demo.repository.impl.ITaikhoanRepo;
import com.example.demo.service.impl.ITaiKhoanService;

import java.util.List;

public class TaiKhoanService implements ITaiKhoanService {
private  final ITaikhoanRepo taikhoanRepo = new TaikhoanRepo();

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
        return taikhoanRepo.findByUsernameAndPassWord(taiKhoan,matKhau);
    }
}
