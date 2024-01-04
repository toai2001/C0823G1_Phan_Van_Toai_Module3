package com.example.thi.service.impl;

import com.example.thi.model.LoaiChiTieu;
import com.example.thi.repo.ILoaiChiTieuRepo;
import com.example.thi.repo.impl.LoaiChiTieuRepoImpl;
import com.example.thi.service.ILoaiChiTieuService;

import java.util.List;

public class LoaiChiTieuImpl implements ILoaiChiTieuService {
    private ILoaiChiTieuRepo iLoaiChiTieuRepo = new LoaiChiTieuRepoImpl();

    @Override
    public List<LoaiChiTieu> hienThiLoaiChiTieu() {
        return iLoaiChiTieuRepo.hienThiLoaiChiTieu();
    }
}
