package com.example.demo.repository.thongkerepository;

import com.example.demo.model.ThongKe;

import java.util.Date;
import java.util.List;

public interface IThongKeRepository {
    List<ThongKe> display();
    List<ThongKe> displayByDate(Date selectedDate);


}