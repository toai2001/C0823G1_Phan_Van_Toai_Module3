package com.example.demo.service.thongke;

import com.example.demo.model.ThongKe;
import com.example.demo.repository.thongkerepository.IThongKeRepository;
import com.example.demo.repository.thongkerepository.ThongKeRepository;

import java.util.Date;
import java.util.List;

public class ThongKeService implements IThongKeService {
    private  final IThongKeRepository iThongkeRepo = new ThongKeRepository();
    @Override
    public List<ThongKe> display() {
        return iThongkeRepo.display();
    }

    @Override
    public List<ThongKe> displayByDate(Date selectedDate) {
        return iThongkeRepo.displayByDate(selectedDate);
    }
}