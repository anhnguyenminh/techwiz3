/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz.models;

import com.aptech.techwiz.entities.Comment;
import java.util.Date;

/**
 *
 * @author inter
 */
public class comment {

    private Integer id;

    private Date commentDate;

    private String note;

    private user userId;

    public comment() {
    }

    public comment(Comment c) {
        this.id = c.getId();
        this.commentDate = c.getCommentDate();
        this.note = c.getNote();
        this.userId = new user(c.getUserId());
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public user getUserId() {
        return userId;
    }

    public void setUserId(user userId) {
        this.userId = userId;
    }
 

}
