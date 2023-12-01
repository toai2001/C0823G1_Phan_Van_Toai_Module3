package com.example.bai1;

public class Student {
    private  int id;
    private   String name ;
    private String gender;
    private Double point;

    public Student() {
    }

    public Student(int id, String name, String gender, Double point) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.point = point;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }
}
