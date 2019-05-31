package com.smilegroup.componentmanagement.Models;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.objenesis.instantiator.annotations.Typology;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "MATHANG")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maMH;

    @Column(name = "TenMH")
    private String tenMH;

    @Column(name = "HangSX")
    private String hangSX;

    @Column(name = "CauHinh")
    private String cauHinh;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @OneToOne
    @JoinColumn(name = "MaLoai", referencedColumnName = "MaLoai")
    private TypeOfComponent type;

    @OneToOne
    @JoinColumn(name = "MaDV", referencedColumnName = "MaDV")
    private Unit unit;

    @OneToOne
    @JoinColumn(name = "MaKhu", referencedColumnName = "MaKhu")
    private Store store;


    public Product() {
    }

    public Product(String tenMH, String hangSX, String cauHinh, Integer soLuong, TypeOfComponent type, Unit unit, Store store) {
        this.tenMH = tenMH;
        this.hangSX = hangSX;
        this.cauHinh = cauHinh;
        this.soLuong = soLuong;
        this.type = type;
        this.unit = unit;
        this.store = store;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaMH() {
        return maMH;
    }

    public void setMaMH(Integer maMH) {
        this.maMH = maMH;
    }

    public String getTenMH() {
        return tenMH;
    }

    public void setTenMH(String tenMH) {
        this.tenMH = tenMH;
    }

    public String getHangSX() {
        return hangSX;
    }

    public void setHangSX(String hangSX) {
        this.hangSX = hangSX;
    }

    public String getCauHinh() {
        return cauHinh;
    }

    public void setCauHinh(String cauHinh) {
        this.cauHinh = cauHinh;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public TypeOfComponent getType() {
        return type;
    }

    public void setType(TypeOfComponent type) {
        this.type = type;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }
}

