package com.example.demo.model;

public class LoaiDichVu {
    private int maLoaiDichVu;
    private String tenLoaiDichVu;

    public LoaiDichVu(int maLoaiDichVu) {
        this.maLoaiDichVu = maLoaiDichVu;
    }

    public LoaiDichVu(int maLoaiDichVu, String tenLoaiDichVu) {
        this.maLoaiDichVu = maLoaiDichVu;
        this.tenLoaiDichVu = tenLoaiDichVu;
    }
    public LoaiDichVu (String tenLoaiDichVu){
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public int getMaLoaiDichVu() {
        return maLoaiDichVu;
    }

    public void setMaLoaiDichVu(int maLoaiDichVu) {
        this.maLoaiDichVu = maLoaiDichVu;
    }

    public String getTenLoaiDichVu() {
        return tenLoaiDichVu;
    }

    public void setTenLoaiDichVu(String tenLoaiDichVu) {
        this.tenLoaiDichVu = tenLoaiDichVu;
    }
}
