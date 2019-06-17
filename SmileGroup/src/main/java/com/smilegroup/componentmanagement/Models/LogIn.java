package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "DANGNHAP")
public class LogIn implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maDN;

    @Column(name = "TenHienThi")
    private String tenHT;

    @Column(name = "Username")
    private String username;

    @Column(name = "Password")
    private String password;

    @OneToOne
    @JoinColumn(name = "maPQ", referencedColumnName = "maPQ")
    private Authority authority;

    @OneToOne
    @JoinColumn(name = "maNV", referencedColumnName = "maNV")
    private Employee employee;

    public LogIn() {
    }

    public LogIn(String tenHT, String username, String password, Authority authority, Employee employee) {
        this.tenHT = tenHT;
        this.username = username;
        this.password = password;
        this.authority = authority;
        this.employee = employee;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getMaDN() {
        return maDN;
    }

    public void setMaDN(Integer maDN) {
        this.maDN = maDN;
    }

    public String getTenHT() {
        return tenHT;
    }

    public void setTenHT(String tenHT) {
        this.tenHT = tenHT;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Authority getAuthority() {
        return authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}

