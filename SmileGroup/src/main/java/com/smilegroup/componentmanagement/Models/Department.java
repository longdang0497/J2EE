package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "PHONGBAN")
public class Department implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maPhong;

    @Column(name = "TenPhong")
    private String tenPhong;

//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinColumn(name = "maPhong", referencedColumnName = "maPhong")
//    private List<Product> productLists;

    public Department() {}

    public Department(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(Integer maPhong) {
        this.maPhong = maPhong;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }
}

