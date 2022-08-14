/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz;

import com.aptech.techwiz.Controller.RoleJpaController;
import com.aptech.techwiz.Controller.exceptions.NonexistentEntityException;
import com.aptech.techwiz.entities.Role;
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
@RequestMapping("/role")
public class RoleController extends BaseController {

    @PostMapping("/add")
    public String add(@WebParam(name = "name") String name) {

        Role role = new Role();
        role.setName(name);
        RoleJpaController roleJpaController = new RoleJpaController(factory);

        roleJpaController.create(role);

        return "redirect:/role_table.html";
    }

    @PostMapping("/update")
    public String update(@WebParam(name = "name") String name, @WebParam(name = "id") String id) {

        RoleJpaController roleJpaController = new RoleJpaController(factory);
        Role role = roleJpaController.findRole(Integer.parseInt(id));
        role.setName(name);
        try {
            roleJpaController.edit(role);
        } catch (Exception ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/role_table.html";
    }
    @PostMapping("/delete")
    public String delete(@WebParam(name = "id") String id) {

        RoleJpaController roleJpaController = new RoleJpaController(factory);
        try {
            roleJpaController.destroy(Integer.parseInt(id));
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "redirect:/role_table.html";
    }
}
