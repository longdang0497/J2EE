package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "KHO")
public class Store implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maKhu;

    @Column(name = "TenKhu")
    private String tenKhu;

    public Store() {}

    public Store(String tenKhu) {
        this.tenKhu = tenKhu;
    }

    public Integer getMaKhu() {
        return maKhu;
    }

    public void setMaKhu(Integer maKhu) {
        this.maKhu = maKhu;
    }

    public String getTenKhu() {
        return tenKhu;
    }

    public void setTenKhu(String tenKhu) {
        this.tenKhu = tenKhu;
    }
}

