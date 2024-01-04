package com.example.thi.model;

import java.util.Date;

public class ChiTieu {
    private int idChiTieu;
    private String tenChiTieu;
    private Date ngayChi;
    private Long soTienChi;
    private String moTaThem;
    private LoaiChiTieu loaiChiTieu;

    public ChiTieu(int idChiTieu, String tenChiTieu, Date ngayChi, Long soTienChi, String moTaThem, LoaiChiTieu loaiChiTieu) {
        this.idChiTieu = idChiTieu;
        this.tenChiTieu = tenChiTieu;
        this.ngayChi = ngayChi;
        this.soTienChi = soTienChi;
        this.moTaThem = moTaThem;
        this.loaiChiTieu = loaiChiTieu;
    }

    public ChiTieu(String tenChiTieu, Date ngayChi, Long soTienChi, String moTaThem, LoaiChiTieu loaiChiTieu) {
        this.tenChiTieu = tenChiTieu;
        this.ngayChi = ngayChi;
        this.soTienChi = soTienChi;
        this.moTaThem = moTaThem;
        this.loaiChiTieu = loaiChiTieu;
    }

    public int getIdChiTieu() {
        return idChiTieu;
    }

    public void setIdChiTieu(int idChiTieu) {
        this.idChiTieu = idChiTieu;
    }

    public String getTenChiTieu() {
        return tenChiTieu;
    }

    public void setTenChiTieu(String tenChiTieu) {
        this.tenChiTieu = tenChiTieu;
    }

    public Date getNgayChi() {
        return ngayChi;
    }

    public void setNgayChi(Date ngayChi) {
        this.ngayChi = ngayChi;
    }

    public Long getSoTienChi() {
        return soTienChi;
    }

    public void setSoTienChi(Long soTienChi) {
        this.soTienChi = soTienChi;
    }

    public String getMoTaThem() {
        return moTaThem;
    }

    public void setMoTaThem(String moTaThem) {
        this.moTaThem = moTaThem;
    }

    public LoaiChiTieu getLoaiChiTieu() {
        return loaiChiTieu;
    }

    public void setLoaiChiTieu(LoaiChiTieu loaiChiTieu) {
        this.loaiChiTieu = loaiChiTieu;
    }
}
