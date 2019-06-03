package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "PHIEUNHAPHANG")
public class ImportProduct implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maPN;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLapPhieu")
    private Date ngayLapPhieu;

    @Column(name = "TongTienPN")
    private Long tongTienPN;

    @OneToOne
    @JoinColumn(name = "MaNV", referencedColumnName = "MaNV")
    private Employee employee;

    @OneToOne
    @JoinColumn(name = "MaDDH", referencedColumnName = "MaDDH")
    private Order order;

    public ImportProduct() {
    }

    public ImportProduct(Date ngayLapPhieu, Long tongTienPN, Employee employee, Order order) {
        this.ngayLapPhieu = ngayLapPhieu;
        this.tongTienPN = tongTienPN;
        this.employee = employee;
        this.order = order;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaPN() {
        return maPN;
    }

    public void setMaPN(Integer maPN) {
        this.maPN = maPN;
    }

    public Date getNgayLapPhieu() {
        return ngayLapPhieu;
    }

    public void setNgayLapPhieu(Date ngayLapPhieu) {
        this.ngayLapPhieu = ngayLapPhieu;
    }

    public Long getTongTienPN() {
        return tongTienPN;
    }

    public void setTongTienPN(Long tongTienPN) {
        this.tongTienPN = tongTienPN;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}

