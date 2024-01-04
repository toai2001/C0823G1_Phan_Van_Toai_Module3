package com.example.demo.service.taikhoanservice;

import com.example.demo.model.TaiKhoan;

import java.util.List;

public interface ITaiKhoanService {
    TaiKhoan findById(int idTaiKhoan);

    List<TaiKhoan> findAll();

    Boolean createAccount(TaiKhoan taiKhoan);

    TaiKhoan findByUsername(String taiKhoan);

    TaiKhoan findByUsernameAndPassWord(String taiKhoan, String matKhau);
}
