package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "DONDATHANG")
public class Order implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maDDH;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLap")
    private Date ngayLap;

    @OneToOne
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private Employee employee;

    @OneToOne
    @JoinColumn(name = "MaNCC", referencedColumnName = "MaNCC")
    private Provider provider;

    public Order() {
    }

    public Order(Date ngayLap, Employee employee, Provider provider) {
        this.ngayLap = ngayLap;
        this.employee = employee;
        this.provider = provider;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaDDH() {
        return maDDH;
    }

    public void setMaDDH(Integer maDDH) {
        this.maDDH = maDDH;
    }

    public Date getNgayLap() {
        return ngayLap;
    }

    public void setNgayLap(Date ngayLap) {
        this.ngayLap = ngayLap;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }
}

