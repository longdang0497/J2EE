package com.smilegroup.componentmanagement.Models;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.objenesis.instantiator.annotations.Typology;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "NHANVIEN")
public class Employee implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maNV;

    @Column(name = "TenNV")
    private String tenNV;

    @Column(name = "Phai")
    private String phai;

    @OneToOne
    @JoinColumn(name = "MaPhong", referencedColumnName = "MaPhong")
    private Department department;

    public Employee() {
    }

    public Employee(String tenNV, String phai, Department department) {
        this.tenNV = tenNV;
        this.phai = phai;
        this.department = department;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaNV() {
        return maNV;
    }

    public void setMaNV(Integer maNV) {
        this.maNV = maNV;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public String getPhai() {
        return phai;
    }

    public void setPhai(String phai) {
        this.phai = phai;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}

