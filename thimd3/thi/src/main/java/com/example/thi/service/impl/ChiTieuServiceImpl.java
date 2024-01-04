package com.example.thi.service.impl;

import com.example.thi.model.ChiTieu;
import com.example.thi.repo.IChiTieuRepo;
import com.example.thi.repo.impl.ChiTieuRepoImpl;
import com.example.thi.service.IChiTieuService;

import java.util.List;

public class ChiTieuServiceImpl implements IChiTieuService {
    private IChiTieuRepo iChiTieuRepo = new ChiTieuRepoImpl();

    @Override
    public List<ChiTieu> display() {
        return iChiTieuRepo.display();
    }

    @Override
    public void add(ChiTieu chiTieu) {
        iChiTieuRepo.add(chiTieu);
    }

    @Override
    public void remove(int id) {
        iChiTieuRepo.remove(id);
    }
}
