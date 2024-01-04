package com.example.thi.service;

import com.example.thi.model.ChiTieu;

import java.util.List;

public interface IChiTieuService {
    List<ChiTieu> display();

    void add(ChiTieu chiTieu);

    void remove(int id);

}
