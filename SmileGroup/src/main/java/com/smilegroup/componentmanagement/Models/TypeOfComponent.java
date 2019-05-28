package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;

@Entity
@Table(name = "LOAIMATHANG")
public class TypeOfComponent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maLoai;

    @Column(name = "TenLoai")
    private String tenLoai;

    public TypeOfComponent() {}

    public TypeOfComponent(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public Integer getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(Integer maLoai) {
        this.maLoai = maLoai;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }
}

