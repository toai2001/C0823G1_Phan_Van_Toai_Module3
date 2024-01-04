package com.example.demo.repository.thongkerepo;

import com.example.demo.model.NhanVien;
import com.example.demo.model.ThongKe;

import java.util.Date;
import java.util.List;

public interface IThongkeRepo {
    List<ThongKe> display();
    List<ThongKe> displayByDate(Date selectedDate);


}
