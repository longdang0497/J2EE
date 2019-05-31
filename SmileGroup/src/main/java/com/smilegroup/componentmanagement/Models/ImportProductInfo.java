package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "CHITIETPHIEUNHAP")
public class ImportProductInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maCTPN;

    @Column(name = "DonGia")
    private Long donGia;

    @Column(name = "DonGiaBan")
    private Long donGiaBan;

    @Column(name = "SoLuong")
    private Long soLuong;

    @Column(name = "TongTien")
    private Long tongTien;

    @Column(name = "GhiChu")
    private String ghiChu;

    @OneToOne
    @JoinColumn(name = "MaPN", referencedColumnName = "MaPN")
    private ImportProduct importProduct;

    @OneToOne
    @JoinColumn(name = "MaMH", referencedColumnName = "MaMH")
    private Product product;

    public ImportProductInfo() {
    }

    public ImportProductInfo(Long donGia, Long donGiaBan, Long soLuong, Long tongTien, String ghiChu, ImportProduct importProduct, Product product) {
        this.donGia = donGia;
        this.donGiaBan = donGiaBan;
        this.soLuong = soLuong;
        this.tongTien = tongTien;
        this.ghiChu = ghiChu;
        this.importProduct = importProduct;
        this.product = product;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaCTPN() {
        return maCTPN;
    }

    public void setMaCTPN(Integer maCTPN) {
        this.maCTPN = maCTPN;
    }

    public Long getDonGia() {
        return donGia;
    }

    public void setDonGia(Long donGia) {
        this.donGia = donGia;
    }

    public Long getDonGiaBan() {
        return donGiaBan;
    }

    public void setDonGiaBan(Long donGiaBan) {
        this.donGiaBan = donGiaBan;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }

    public Long getTongTien() {
        return tongTien;
    }

    public void setTongTien(Long tongTien) {
        this.tongTien = tongTien;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public ImportProduct getImportProduct() {
        return importProduct;
    }

    public void setImportProduct(ImportProduct importProduct) {
        this.importProduct = importProduct;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

