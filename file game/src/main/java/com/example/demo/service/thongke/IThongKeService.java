package com.example.demo.service.thongke;

import com.example.demo.model.ThongKe;

import java.util.Date;
import java.util.List;

public interface IThongKeService {
    List<ThongKe> display();
    List<ThongKe> displayByDate(Date selectedDate);

}
