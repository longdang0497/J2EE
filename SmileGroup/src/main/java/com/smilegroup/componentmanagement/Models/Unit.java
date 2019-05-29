package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "DONVITINH")
public class Unit implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maDV;

    @Column(name = "TenDV")
    private String tenDV;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "maDV", referencedColumnName = "maDV")
    private List<Product> productLists;

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

    public List<Product> getProductLists() {
        return productLists;
    }

    public void setProductLists(List<Product> productLists) {
        this.productLists = productLists;
    }
}

