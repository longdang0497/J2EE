package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "CHITIETHOADON")
public class BillInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maCTHD;

    @Column(name = "DonGianBan")
    private int donGia;

    @Column(name = "SoLuong")
    private int soLuong;

    @Column(name = "TienThanhToan")
    private int tienThanhToan;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaHD", referencedColumnName = "MaHD")
    private Bill bill;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaMH", referencedColumnName = "MaMH")
    private Product product;

    public BillInfo() {
    }

    public BillInfo(int donGia, int soLuong, int tienThanhToan, Bill bill, Product product) {
        this.donGia = donGia;
        this.soLuong = soLuong;
        this.tienThanhToan = tienThanhToan;
        this.bill = bill;
        this.product = product;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaCTHD() {
        return maCTHD;
    }

    public void setMaCTHD(Integer maCTHD) {
        this.maCTHD = maCTHD;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getTienThanhToan() {
        return tienThanhToan;
    }

    public void setTienThanhToan(int tienThanhToan) {
        this.tienThanhToan = tienThanhToan;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

