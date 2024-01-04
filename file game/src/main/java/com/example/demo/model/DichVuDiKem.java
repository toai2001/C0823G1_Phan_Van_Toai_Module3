package com.example.demo.model;

public class DichVuDiKem {
    private int maDichVuDiKem;
    private String tenDichVuDiKem;
    private double giaDichVuDiKem;
    private LoaiDichVu maLoaiDichVu;
    private int idLoaiDichVu;
    private String tenLoaiDichVu;

    public DichVuDiKem(String tenDichVuDiKem, double giaDichVuDiKem, int idLoaiDichVu) {
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.idLoaiDichVu = idLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, String tenLoaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, int idLoaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.idLoaiDichVu = idLoaiDichVu;
    }

    public int getIdLoaiDichVu() {
        return idLoaiDichVu;
    }

    public void setIdLoaiDichVu(int idLoaiDichVu) {
        this.idLoaiDichVu = idLoaiDichVu;
    }

    public String getTenLoaiDichVu() {
        return tenLoaiDichVu;
    }

    public void setTenLoaiDichVu(String tenLoaiDichVu) {
        this.tenLoaiDichVu = tenLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem, LoaiDichVu maLoaiDichVu) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.maLoaiDichVu = maLoaiDichVu;
    }

    public DichVuDiKem(int maDichVuDiKem, String tenDichVuDiKem, double giaDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
    }

    public DichVuDiKem() {
    }

    public DichVuDiKem(int maDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
    }

    public DichVuDiKem(String tenDichVuDiKem, double giaDichVuDiKem, LoaiDichVu maLoaiDichVu) {
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
        this.maLoaiDichVu = maLoaiDichVu;
    }

    public DichVuDiKem(String tenDichVuDiKem, double giaDichVuDiKem) {
        this.tenDichVuDiKem = tenDichVuDiKem;
        this.giaDichVuDiKem = giaDichVuDiKem;
    }

    public int getMaDichVuDiKem() {
        return maDichVuDiKem;
    }

    public void setMaDichVuDiKem(int maDichVuDiKem) {
        this.maDichVuDiKem = maDichVuDiKem;
    }

    public String getTenDichVuDiKem() {
        return tenDichVuDiKem;
    }

    public void setTenDichVuDiKem(String tenDichVuDiKem) {
        this.tenDichVuDiKem = tenDichVuDiKem;
    }

    public double getGiaDichVuDiKem() {
        return giaDichVuDiKem;
    }

    public void setGiaDichVuDiKem(double giaDichVuDiKem) {
        this.giaDichVuDiKem = giaDichVuDiKem;
    }

    public LoaiDichVu getMaLoaiDichVu() {
        return maLoaiDichVu;
    }

    public void setMaLoaiDichVu(LoaiDichVu maLoaiDichVu) {
        this.maLoaiDichVu = maLoaiDichVu;
    }
}
