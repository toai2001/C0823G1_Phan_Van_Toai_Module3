package com.example.demo100.service.impl;

import com.example.demo100.model.HangHoa;
import com.example.demo100.repo.IHangHoaRepo;
import com.example.demo100.repo.impl.HangHoarepo;
import com.example.demo100.service.IHangHoaService;

import java.util.List;

public class HangHoaService implements IHangHoaService {
    private IHangHoaRepo iHangHoaRepo = new HangHoarepo();

    @Override
    public List<HangHoa> display() {
        return iHangHoaRepo.display();
    }

    @Override
    public void add(HangHoa hangHoa) {
        iHangHoaRepo.add(hangHoa);
    }

    @Override
    public void remove(int id) {
        iHangHoaRepo.remove(id);
    }

    @Override
    public void update(HangHoa hangHoa) {
        iHangHoaRepo.update(hangHoa);

    }

    @Override
    public HangHoa findById(int checkId) {
        return iHangHoaRepo.findById(checkId);
    }
}
