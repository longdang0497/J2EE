package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;

@Entity
@Table(name = "DONVITINH")
public class Unit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maDV;

    @Column(name = "TenDV")
    private String tenDV;

    public Unit() {}

    public Unit(String tenDV) {
        this.tenDV = tenDV;
    }

    public Integer getMaDV() {
        return maDV;
    }

    public void setMaDV(Integer maDV) {
        this.maDV = maDV;
    }

    public String getTenDV() {
        return tenDV;
    }

    public void setTenDV(String tenDV) {
        this.tenDV = tenDV;
    }
}

