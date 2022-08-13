/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz.models;

import com.aptech.techwiz.entities.Orders;
import java.util.Date;

/**
 *
 * @author inter
 */
public class orders {

    private Integer id;

    private String address;

    private String phone;

    private String name;

    private Date orderDate;

    private user userId;

    private Integer statusId;

    public orders() {

    }

    public orders(Orders o) {
        this.id = o.getId();
        this.address = o.getAddress();
        this.phone = o.getPhone();
        this.name = o.getName();
        this.orderDate = o.getOrderDate();
        this.userId = new user(o.getUserId());
        this.statusId = o.getStatusId().getId();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public user getUserId() {
        return userId;
    }

    public void setUserId(user userId) {
        this.userId = userId;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

}
