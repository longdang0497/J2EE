package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;

@Entity
@Table(name = "NHACUNGCAP")
public class Provider {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maNCC;

    @Column(name = "TenNCC")
    private String tenNCC;

    @Column(name = "DiaChiNCC")
    private String diaChiNCC;

    @Column(name = "EmailNCC")
    private String emailNCC;

    @Column(name = "SoDTNCC")
    private String soDTNCC;

    public Provider() {}

    public Provider(String tenNCC, String diaChiNCC, String emailNCC, String soDTNCC) {
        this.tenNCC = tenNCC;
        this.diaChiNCC = diaChiNCC;
        this.emailNCC = emailNCC;
        this.soDTNCC = soDTNCC;
    }

    public Integer getMaNCC() {
        return maNCC;
    }

    public void setMaNCC(Integer maNCC) {
        this.maNCC = maNCC;
    }

    public String getTenNCC() {
        return tenNCC;
    }

    public void setTenNCC(String tenNCC) {
        this.tenNCC = tenNCC;
    }

    public String getDiaChiNCC() {
        return diaChiNCC;
    }

    public void setDiaChiNCC(String diaChiNCC) {
        this.diaChiNCC = diaChiNCC;
    }

    public String getEmailNCC() {
        return emailNCC;
    }

    public void setEmailNCC(String emailNCC) {
        this.emailNCC = emailNCC;
    }

    public String getSoDTNCC() {
        return soDTNCC;
    }

    public void setSoDTNCC(String soDTNCC) {
        this.soDTNCC = soDTNCC;
    }
}

