package com.example.demo.model;

import java.util.Date;

public class ThongKe {
    private long tongThoiGianSuDung;
    private long tongTienDichVu;
    private Date ngaySuDung;


    public ThongKe(long tongThoiGianSuDung, long tongTienDichVu, Date ngaySuDung) {
        this.tongThoiGianSuDung = tongThoiGianSuDung;
        this.tongTienDichVu = tongTienDichVu;
        this.ngaySuDung = ngaySuDung;
    }

    public long getTongThoiGianSuDung() {
        return tongThoiGianSuDung;
    }

    public void setTongThoiGianSuDung(long tongThoiGianSuDung) {
        this.tongThoiGianSuDung = tongThoiGianSuDung;
    }

    public long getTongTienDichVu() {
        return tongTienDichVu;
    }

    public void setTongTienDichVu(long tongTienDichVu) {
        this.tongTienDichVu = tongTienDichVu;
    }

    public Date getNgaySuDung() {
        return ngaySuDung;
    }

    public void setNgaySuDung(Date ngaySuDung) {
        this.ngaySuDung = ngaySuDung;
    }
}