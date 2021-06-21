package com.hardware.store.controllers;

import com.hardware.store.entities.Product;
import com.hardware.store.entities.User;
import com.hardware.store.services.ProductService;
import com.hardware.store.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/")
    public String mainAdminPage(Principal principal, Model model) {
        User currentUser = userService.findByUsername(principal.getName());
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("prodForm", new Product());
        return "mainadminpage";
    }

    @RequestMapping("/add")
    public String addProduct(Principal principal, @ModelAttribute("prodForm") @Valid Product prodForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "mainadminpage";
        }

        User currentUser = userService.findByUsername(principal.getName());
        prodForm.setUser(currentUser);
        if (!productService.saveProduct(prodForm)){
            model.addAttribute("nameError", "Продукт с таким именем уже существует у вас");
            return "mainadminpage";
        }

        return "redirect:/admin/";
    }

    @RequestMapping("/delete/{productId}")
    public String deleteProduct(@PathVariable Long productId) {

        productService.deleteProduct(productId);

        return "redirect:/admin/";
    }
}
