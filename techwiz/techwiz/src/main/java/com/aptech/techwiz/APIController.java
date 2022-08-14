package com.aptech.techwiz;

import com.aptech.techwiz.entities.Cartinfo;
import com.aptech.techwiz.entities.Category;
import com.aptech.techwiz.entities.Comment;
import com.aptech.techwiz.entities.Contact;
import com.aptech.techwiz.entities.Orderdetail;
import com.aptech.techwiz.entities.Orders;
import com.aptech.techwiz.entities.Product;
import com.aptech.techwiz.entities.Role;
import com.aptech.techwiz.entities.Status;
import com.aptech.techwiz.entities.User;
import com.aptech.techwiz.models.category;
import com.aptech.techwiz.models.comment;
import com.aptech.techwiz.models.orderdetail;
import com.aptech.techwiz.models.orders;
import com.aptech.techwiz.models.product;
import com.aptech.techwiz.models.role;
import com.aptech.techwiz.models.status;
import com.aptech.techwiz.models.user;
import controller.BaseController;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/API")
public class APIController extends BaseController {

    @GetMapping("/User")
    public List<user> User() {
        Query q = manager.createNamedQuery("User.findAll", User.class);
        List<User> dataList = q.getResultList();
        List<user> userList = new ArrayList<>();
        for (User u : dataList) {
            userList.add(new user(u));
        }
        return userList;
    }

    @GetMapping("/Status")
    public List<status> Status() {
        Query q = manager.createNamedQuery("Status.findAll", Status.class);
        List<Status> dataList = q.getResultList();
        List<status> statusList = new ArrayList<>();
        for (Status s : dataList) {
            statusList.add(new status(s));
        }
        return statusList;
    }

    @GetMapping("/Role")
    public List<role> Role() {
        Query q = manager.createNamedQuery("Role.findAll", Role.class);
        List<Role> dataList = q.getResultList();
        List<role> roleList = new ArrayList<>();
        for (Role r : dataList) {
            roleList.add(new role(r));
        }
        return roleList;
    }

    @GetMapping("/Product")
    public List<product> Product() {
        Query q = manager.createNamedQuery("Product.findAll", Product.class);
        List<Product> dataList = q.getResultList();
        List<product> productList = new ArrayList<>();
        for (Product u : dataList) {
            productList.add(new product(u));
        }
        return productList;
    }

    @GetMapping("/Orders")
    public List<orders> Order1() {
        Query q = manager.createNamedQuery("Orders.findAll", Orders.class);
        List<Orders> dataList = q.getResultList();
        List<orders> ordersList = new ArrayList<>();
        for (Orders u : dataList) {
            ordersList.add(new orders(u));
        }
        return ordersList;
    }

    @GetMapping("/Orderdetail")
    public List<orderdetail> Orderdetail() {
        Query q = manager.createNamedQuery("Orderdetail.findAll", Orderdetail.class);
        List<Orderdetail> dataList = q.getResultList();
        List<orderdetail> orderdetailList = new ArrayList<>();
        for (Orderdetail u : dataList) {
            orderdetailList.add(new orderdetail(u));
        }
        return orderdetailList;
    }

    @GetMapping("/Contact")
    public List<Contact> Contact() {
        Query q = manager.createNamedQuery("Contact.findAll", Contact.class);
        List<Contact> dataList = q.getResultList();
        return dataList;
    }

    @GetMapping("/Comment")
    public List<comment> Comment() {
        Query q = manager.createNamedQuery("Comment.findAll", Comment.class);
        List<Comment> dataList = q.getResultList();
        List<comment> commentList = new ArrayList<>();
        for (Comment u : dataList) {
            commentList.add(new comment(u));
        }
        return commentList;
    }

    @GetMapping("/Category")
    public List<category> Category() {
        Query q = manager.createNamedQuery("Category.findAll", Category.class);
        List<Category> dataList = q.getResultList();
        List<category> categoryList = new ArrayList<>();
        for (Category u : dataList) {
            categoryList.add(new category(u));
        }
        return categoryList;
    }

    @GetMapping("/Cartinfo")
    public List<Cartinfo> Cartinfo() {
        Query q = manager.createNamedQuery("Cartinfo.findAll", Cartinfo.class);
        List<Cartinfo> dataList = q.getResultList();
        return dataList;
    }
}
