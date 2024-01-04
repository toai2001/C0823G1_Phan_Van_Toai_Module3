package com.example.demo.service.thongke;

import com.example.demo.model.ThongKe;
import com.example.demo.repository.thongkerepo.IThongkeRepo;
import com.example.demo.repository.thongkerepo.ThongKeRepo;

import java.util.Date;
import java.util.List;

public class ThongKeService implements IThongKeService {
    private  final IThongkeRepo iThongkeRepo = new ThongKeRepo();
    @Override
    public List<ThongKe> display() {
        return iThongkeRepo.display();
    }

    @Override
    public List<ThongKe> displayByDate(Date selectedDate) {
        return iThongkeRepo.displayByDate(selectedDate);
    }
}
