package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "CHITIETDONDATHANG")
public class OrderInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maCTDDH;

    @Column(name = "SoLuong")
    private Long soLuong;

    @OneToOne
    @JoinColumn(name = "MaDDH", referencedColumnName = "MaDDH")
    private Order order;

    @OneToOne
    @JoinColumn(name = "MaMH", referencedColumnName = "MaMH")
    private Product product;

    public OrderInfo() {
    }

    public OrderInfo(Long soLuong, Order order, Product product) {
        this.soLuong = soLuong;
        this.order = order;
        this.product = product;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaCTDDH() {
        return maCTDDH;
    }

    public void setMaCTDDH(Integer maCTDDH) {
        this.maCTDDH = maCTDDH;
    }

    public Long getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Long soLuong) {
        this.soLuong = soLuong;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

