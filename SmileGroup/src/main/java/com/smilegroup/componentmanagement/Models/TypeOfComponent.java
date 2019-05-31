package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "LOAIMATHANG")
public class TypeOfComponent implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maLoai;

    @Column(name = "TenLoai")
    private String tenLoai;

    @OneToMany
    @JoinColumn(name = "maLoai", referencedColumnName = "maLoai")
    private List<Product> productLists;

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

    public List<Product> getProductLists() {
        return productLists;
    }

    public void setProductLists(List<Product> productLists) {
        this.productLists = productLists;
    }
}

