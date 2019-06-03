package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "BAOCAOHANGTON")
public class ProductReport implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maBCHT;

    @Column(name = "Thang")
    private Integer thang;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLap")
    private Date ngayLap;

    @Column(name = "TongNhap")
    private Long tongNhap;

    @Column(name = "TongBan")
    private Long tongBan;

    @Column(name = "TongTon")
    private Long tongTon;

    @OneToOne
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private Employee employee;

//    @OneToOne
//    @JoinColumn(name = "MaKH", referencedColumnName = "MaKH")
//    private Customer customer;


    public ProductReport() {
    }

    public ProductReport(Integer thang, Date ngayLap, Long tongNhap, Long tongBan, Long tongTon, Employee employee) {
        this.thang = thang;
        this.ngayLap = ngayLap;
        this.tongNhap = tongNhap;
        this.tongBan = tongBan;
        this.tongTon = tongTon;
        this.employee = employee;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaBCHT() {
        return maBCHT;
    }

    public void setMaBCHT(Integer maBCHT) {
        this.maBCHT = maBCHT;
    }

    public Integer getThang() {
        return thang;
    }

    public void setThang(Integer thang) {
        this.thang = thang;
    }

    public Date getNgayLap() {
        return ngayLap;
    }

    public void setNgayLap(Date ngayLap) {
        this.ngayLap = ngayLap;
    }

    public Long getTongNhap() {
        return tongNhap;
    }

    public void setTongNhap(Long tongNhap) {
        this.tongNhap = tongNhap;
    }

    public Long getTongBan() {
        return tongBan;
    }

    public void setTongBan(Long tongBan) {
        this.tongBan = tongBan;
    }

    public Long getTongTon() {
        return tongTon;
    }

    public void setTongTon(Long tongTon) {
        this.tongTon = tongTon;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}

