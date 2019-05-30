package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "HOADON")
public class Bill implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maHD;

    @Column(name = "MaSoThue")
    private String maSoThue;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLap")
    private Date ngayLap;

    @Column(name = "TongTien")
    private int tongTien;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private Employee employee;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MaKH", referencedColumnName = "MaKH")
    private Customer customer;

    public Bill() {
    }

    public Bill(String maSoThue, Date ngayLap, int tongTien, Employee employee, Customer customer) {
        this.maSoThue = maSoThue;
        this.ngayLap = ngayLap;
        this.tongTien = tongTien;
        this.employee = employee;
        this.customer = customer;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaHD() {
        return maHD;
    }

    public void setMaHD(Integer maHD) {
        this.maHD = maHD;
    }

    public String getMaSoThue() {
        return maSoThue;
    }

    public void setMaSoThue(String maSoThue) {
        this.maSoThue = maSoThue;
    }

    public Date getNgayLap() {
        return ngayLap;
    }

    public void setNgayLap(Date ngayLap) {
        this.ngayLap = ngayLap;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}

