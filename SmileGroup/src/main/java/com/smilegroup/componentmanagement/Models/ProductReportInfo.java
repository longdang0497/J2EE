package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "CHITIETBAOCAOHANGTON")
public class ProductReportInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maCTBC;

    @Column(name = "LuongNhapBĐ")
    private Long luongNhap;

    @Column(name = "LuongBan")
    private Long luongBan;

    @Column(name = "LuongTon")
    private Long luongTon;

    @OneToOne
    @JoinColumn(name = "MaMH", referencedColumnName = "MaMH")
    private Product product;

    @OneToOne
    @JoinColumn(name = "MaBCHT", referencedColumnName = "MaBCHT")
    private ProductReport productReport;


    public ProductReportInfo() {
    }

    public ProductReportInfo(Long luongNhap, Long luongBan, Long luongTon, Product product, ProductReport productReport) {
        this.luongNhap = luongNhap;
        this.luongBan = luongBan;
        this.luongTon = luongTon;
        this.product = product;
        this.productReport = productReport;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaCTBC() {
        return maCTBC;
    }

    public void setMaCTBC(Integer maCTBC) {
        this.maCTBC = maCTBC;
    }

    public Long getLuongNhap() {
        return luongNhap;
    }

    public void setLuongNhap(Long luongNhap) {
        this.luongNhap = luongNhap;
    }

    public Long getLuongBan() {
        return luongBan;
    }

    public void setLuongBan(Long luongBan) {
        this.luongBan = luongBan;
    }

    public Long getLuongTon() {
        return luongTon;
    }

    public void setLuongTon(Long luongTon) {
        this.luongTon = luongTon;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductReport getProductReport() {
        return productReport;
    }

    public void setProductReport(ProductReport productReport) {
        this.productReport = productReport;
    }
}

