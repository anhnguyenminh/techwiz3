/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz.models;

import com.aptech.techwiz.entities.Category;

/**
 *
 * @author inter
 */
public class category {

    private Integer id;

    private String name;

    public category() {
    }

    public category(Category c) {
        this.id = c.getId();
        this.name = c.getName();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
