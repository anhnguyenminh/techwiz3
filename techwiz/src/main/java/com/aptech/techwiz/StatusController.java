/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aptech.techwiz;

import com.aptech.techwiz.Controller.RoleJpaController;
import com.aptech.techwiz.Controller.StatusJpaController;
import com.aptech.techwiz.Controller.exceptions.NonexistentEntityException;
import com.aptech.techwiz.entities.Role;
import com.aptech.techwiz.entities.Status;
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
@RequestMapping("/status")
public class StatusController extends BaseController {

    @PostMapping("/add")
    public String add(@WebParam(name = "StatusName") String StatusName) {

        Status status = new Status();
        status.setStatusName(StatusName);
        StatusJpaController statusJpaController = new StatusJpaController(factory);

        statusJpaController.create(status);

        return "redirect:/role_table.html";
    }

    @PostMapping("/update")
    public String update(@WebParam(name = "StatusName") String StatusName, @WebParam(name = "id") String id) {

        StatusJpaController statusJpaController = new StatusJpaController(factory);
        Status status = statusJpaController.findStatus(Integer.parseInt(id));
        status.setStatusName(StatusName);
        try {
            statusJpaController.edit(status);
        } catch (Exception ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/role_table.html";
    }

    @PostMapping("/delete")
    public String delete(@WebParam(name = "id") String id) {

        StatusJpaController statusJpaController = new StatusJpaController(factory);
        try {
            statusJpaController.destroy(Integer.parseInt(id));
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(RoleController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/role_table.html";
    }
}
