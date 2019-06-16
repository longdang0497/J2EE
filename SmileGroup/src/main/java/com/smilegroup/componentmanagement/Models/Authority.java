package com.smilegroup.componentmanagement.Models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "PHANQUYEN")
public class Authority implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maPQ;

    @Column(name = "TenPQ")
    private String tenPQ;

    @OneToMany
    @JoinColumn(name = "maPQ", referencedColumnName = "maPQ")
    private List<LogIn> logInLists;

    public Authority() {}

    public Authority(String tenPQ) {
        this.tenPQ = tenPQ;
    }

    public Integer getMaPQ() {
        return maPQ;
    }

    public void setMaPQ(Integer maPQ) {
        this.maPQ = maPQ;
    }

    public String getTenPQ() {
        return tenPQ;
    }

    public void setTenPQ(String tenPQ) {
        this.tenPQ = tenPQ;
    }

    public List<LogIn> getLogInLists() {
        return logInLists;
    }

    public void setLogInLists(List<LogIn> logInLists) {
        this.logInLists = logInLists;
    }
}

