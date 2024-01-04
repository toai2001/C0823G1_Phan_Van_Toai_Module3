package com.example.demo.repository.taikhoanrepository;

import com.example.demo.model.TaiKhoan;

import java.util.List;

public interface ITaiKhoanRepository {
    TaiKhoan findById(int idTaiKhoan);

    List<TaiKhoan> findAll();

    Boolean createAccount(TaiKhoan taiKhoan);

    TaiKhoan findByUsername(String taiKhoan);

    TaiKhoan findByUsernameAndPassWord(String taiKhoan, String matKhau);
}
