package com.example.thi.model;

public class LoaiChiTieu {
    private  int idLoaiChiTieu;
    private String tenLoaiCHiTieu;

    public LoaiChiTieu(int idLoaiChiTieu, String tenLoaiCHiTieu) {
        this.idLoaiChiTieu = idLoaiChiTieu;
        this.tenLoaiCHiTieu = tenLoaiCHiTieu;
    }

    public LoaiChiTieu(int idLoaiChiTieu) {
        this.idLoaiChiTieu = idLoaiChiTieu;
    }

    public LoaiChiTieu(String tenLoaiCHiTieu) {
        this.tenLoaiCHiTieu = tenLoaiCHiTieu;
    }

    public int getIdLoaiChiTieu() {
        return idLoaiChiTieu;
    }

    public void setIdLoaiChiTieu(int idLoaiChiTieu) {
        this.idLoaiChiTieu = idLoaiChiTieu;
    }

    public String getTenLoaiCHiTieu() {
        return tenLoaiCHiTieu;
    }

    public void setTenLoaiCHiTieu(String tenLoaiCHiTieu) {
        this.tenLoaiCHiTieu = tenLoaiCHiTieu;
    }
}
