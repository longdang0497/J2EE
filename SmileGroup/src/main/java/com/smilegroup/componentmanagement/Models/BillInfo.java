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

    @Column(name = "DonGiaBan")
    private Long donGia;

    @Column(name = "SoLuong")
    private Long soLuong;

    @Column(name = "TienThanhToan")
    private Long tienThanhToan;

    @OneToOne
    @JoinColumn(name = "MaHD", referencedColumnName = "MaHD")
    private Bill bill;

    @OneToOne
    @JoinColumn(name = "MaMH", referencedColumnName = "MaMH")
    private Product product;

    public BillInfo() {
    }

    public BillInfo(Long donGia, Long soLuong, Long tienThanhToan, Bill bill, Product product) {
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

    public Long getDonGia() {
        return donGia;
    }

    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }

    public Long getTienThanhToan() {
        return tienThanhToan;
    }

    public void setTienThanhToan(Long tienThanhToan) {
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

