package com.example.demo100.model;

import java.util.Date;

public class HangHoa {
    private int idHangHoa;
    private String maHangHoa;
    private String tenHangHoa;
    private String donViHangHoa;
    private LoaiHangHoa loaiHangHoa;
    private Date ngayThuHoach;

    public HangHoa(int idHangHoa, String maHangHoa, String tenHangHoa, String donViHangHoa, LoaiHangHoa loaiHangHoa, Date ngayThuHoach) {
        this.idHangHoa = idHangHoa;
        this.maHangHoa = maHangHoa;
        this.tenHangHoa = tenHangHoa;
        this.donViHangHoa = donViHangHoa;
        this.loaiHangHoa = loaiHangHoa;
        this.ngayThuHoach = ngayThuHoach;
    }

    public HangHoa(String maHangHoa, String tenHangHoa, String donViHangHoa, LoaiHangHoa loaiHangHoa, Date ngayThuHoach) {
        this.maHangHoa = maHangHoa;
        this.tenHangHoa = tenHangHoa;
        this.donViHangHoa = donViHangHoa;
        this.loaiHangHoa = loaiHangHoa;
        this.ngayThuHoach = ngayThuHoach;
    }

    public int getIdHangHoa() {
        return idHangHoa;
    }

    public void setIdHangHoa(int idHangHoa) {
        this.idHangHoa = idHangHoa;
    }

    public String getMaHangHoa() {
        return maHangHoa;
    }

    public void setMaHangHoa(String maHangHoa) {
        this.maHangHoa = maHangHoa;
    }

    public String getTenHangHoa() {
        return tenHangHoa;
    }

    public void setTenHangHoa(String tenHangHoa) {
        this.tenHangHoa = tenHangHoa;
    }

    public String getDonViHangHoa() {
        return donViHangHoa;
    }

    public void setDonViHangHoa(String donViHangHoa) {
        this.donViHangHoa = donViHangHoa;
    }

    public LoaiHangHoa getLoaiHangHoa() {
        return loaiHangHoa;
    }

    public void setLoaiHangHoa(LoaiHangHoa loaiHangHoa) {
        this.loaiHangHoa = loaiHangHoa;
    }

    public Date getNgayThuHoach() {
        return ngayThuHoach;
    }

    public void setNgayThuHoach(Date ngayThuHoach) {
        this.ngayThuHoach = ngayThuHoach;
    }
}
