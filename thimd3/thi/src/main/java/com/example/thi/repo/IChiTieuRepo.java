package com.example.thi.repo;

import com.example.thi.model.ChiTieu;

import java.util.List;

public interface IChiTieuRepo {
    List<ChiTieu> display();

    void add(ChiTieu chiTieu);

    void remove(int id);


}
