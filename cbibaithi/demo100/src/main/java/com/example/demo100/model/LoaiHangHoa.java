package com.example.demo100.model;

public class LoaiHangHoa {
    private int idLoaiHangHoa;
    private String tenLoaiHangHoa;

    public LoaiHangHoa(int idLoaiHangHoa, String tenLoaiHangHoa) {
        this.idLoaiHangHoa = idLoaiHangHoa;
        this.tenLoaiHangHoa = tenLoaiHangHoa;
    }

    public LoaiHangHoa(String tenLoaiHangHoa) {
        this.tenLoaiHangHoa = tenLoaiHangHoa;
    }

    public LoaiHangHoa(int idLoaiHangHoa) {
        this.idLoaiHangHoa = idLoaiHangHoa;
    }

    public int getIdLoaiHangHoa() {
        return idLoaiHangHoa;
    }

    public void setIdLoaiHangHoa(int idLoaiHangHoa) {
        this.idLoaiHangHoa = idLoaiHangHoa;
    }

    public String getTenLoaiHangHoa() {
        return tenLoaiHangHoa;
    }

    public void setTenLoaiHangHoa(String tenLoaiHangHoa) {
        this.tenLoaiHangHoa = tenLoaiHangHoa;
    }
}
