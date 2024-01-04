package com.example.demo100.service.impl;

import com.example.demo100.model.LoaiHangHoa;
import com.example.demo100.repo.ILoaiHangHoa;
import com.example.demo100.repo.impl.LoaiHangHoaRepo;
import com.example.demo100.service.ILoaiHangHoaService;

import java.util.List;

public class LoaiHangHoaService implements ILoaiHangHoaService {
    private ILoaiHangHoa  iLoaiHangHoa = new LoaiHangHoaRepo();

    @Override
    public List<LoaiHangHoa> hienThiLoaiHangHoa() {
        return iLoaiHangHoa.hienThiLoaiHangHoa();
    }
}
