/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz.models;

import com.aptech.techwiz.entities.Orderdetail;

/**
 *
 * @author inter
 */
public class orderdetail {

    private Integer id;

    private Double price;

    private Integer num;

    private orders orderId;

    private product productId;

    public orderdetail() {
    }

    public orderdetail(Orderdetail o) {
        this.id = o.getId();
        this.price = o.getPrice();
        this.num = o.getNum();
        this.orderId = new orders(o.getOrderId());
        this.productId = new product(o.getProductId());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public orders getOrderId() {
        return orderId;
    }

    public void setOrderId(orders orderId) {
        this.orderId = orderId;
    }

    public product getProductId() {
        return productId;
    }

    public void setProductId(product productId) {
        this.productId = productId;
    }

}
