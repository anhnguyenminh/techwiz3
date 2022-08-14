/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz;

import com.aptech.techwiz.Controller.CategoryJpaController;
import com.aptech.techwiz.Controller.exceptions.NonexistentEntityException;
import com.aptech.techwiz.entities.Category;
import controller.BaseController;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author inter
 */
@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController {

    @PostMapping("/add")
    public String add(@WebParam(name = "name") String name) {

        Category category = new Category();
        category.setName(name);
        CategoryJpaController categoryJpaController = new CategoryJpaController(factory);

        categoryJpaController.create(category);

        return "redirect:../admin/category_table.html";
    }

    @PostMapping("/update")
    public String update(@WebParam(name = "name") String name, @WebParam(name = "id") String id) {

        CategoryJpaController categoryJpaController = new CategoryJpaController(factory);
        Category category = categoryJpaController.findCategory(Integer.parseInt(id));
        category.setName(name);
        try {
            categoryJpaController.edit(category);
        } catch (Exception ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:../admin/category_table.html";
    }
    @PostMapping("/delete")
    public String delete(@WebParam(name = "id") String id) {

        CategoryJpaController categoryJpaController = new CategoryJpaController(factory);
        try {
            categoryJpaController.destroy(Integer.parseInt(id));
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "redirect:../admin/category_table.html";
    }
}
