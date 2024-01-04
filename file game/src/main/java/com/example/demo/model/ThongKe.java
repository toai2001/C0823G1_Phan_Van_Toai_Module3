package com.example.demo.model;

import java.util.Date;

public class ThongKe {
    private int mayTinh;
    private long tongThoiGianSuDung;
    private long tongTienDichVu;

    private Date ngaySuDung;



    public ThongKe(int mayTinh, long tongThoiGianSuDung, long tongTienDichVu) {

        this.mayTinh = mayTinh;
        this.tongThoiGianSuDung = tongThoiGianSuDung;
        this.tongTienDichVu = tongTienDichVu;
    }

    public ThongKe(long tongThoiGianSuDung, long tongTienDichVu) {
        this.tongThoiGianSuDung = tongThoiGianSuDung;
        this.tongTienDichVu = tongTienDichVu;
    }

    public ThongKe(int mayTinh, long tongThoiGianSuDung, long tongTienDichVu, Date ngaySuDung) {
        this.mayTinh = mayTinh;
        this.tongThoiGianSuDung = tongThoiGianSuDung;
        this.tongTienDichVu = tongTienDichVu;
        this.ngaySuDung = ngaySuDung;
    }

    public ThongKe(long tongThoiGianSuDung, long tongTienDichVu, Date ngaySuDung) {
        this.tongThoiGianSuDung = tongThoiGianSuDung;
        this.tongTienDichVu = tongTienDichVu;
        this.ngaySuDung = ngaySuDung;
    }

    public Date getNgaySuDung() {
        return ngaySuDung;
    }

    public void setNgaySuDung(Date ngaySuDung) {
        this.ngaySuDung = ngaySuDung;
    }

    public int getMayTinh() {
        return mayTinh;
    }

    public void setMayTinh(int mayTinh) {
        this.mayTinh = mayTinh;
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
}
