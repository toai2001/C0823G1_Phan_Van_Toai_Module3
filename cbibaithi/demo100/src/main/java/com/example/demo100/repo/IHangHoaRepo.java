package com.example.demo100.repo;

import com.example.demo100.model.HangHoa;

import java.util.List;

public interface IHangHoaRepo {
    List<HangHoa> display();
    void add(HangHoa hangHoa);
    void remove(int id);
    void update(HangHoa hangHoa);
    HangHoa findById(int checkId);
}
