package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;

@Entity
@Table(name = "KHACHHANG")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maKH;

    @Column(name = "TenKH")
    private String tenKH;

    @Column(name = "DiaChi")
    private String diaChi;

    @Column(name = "Email")
    private String email;

    @Column(name = "SoDT")
    private String soDT;

    public Customer() {}

    public Customer(String tenKH, String diaChi, String email, String soDT) {
        this.tenKH = tenKH;
        this.diaChi = diaChi;
        this.email = email;
        this.soDT = soDT;
    }

    public Integer getMaKH() {
        return maKH;
    }

    public void setMaKH(Integer maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }
}

