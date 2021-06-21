package com.hardware.store.controllers;

import com.hardware.store.services.ProductService;
import com.hardware.store.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Controller
public class MainController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String mainPage(Model model, HttpServletRequest request,
                           HttpServletResponse response) {


        if(Objects.nonNull(request.getParameter("find_text")) && !request.getParameter("find_text").isBlank()){
            if(Objects.nonNull(request.getParameter("byname")))
            {
                model.addAttribute("products", productService.findAllByName(request.getParameter("find_text")));
            }
            else{
                model.addAttribute("products", productService.findAllByCompanyName(request.getParameter("find_text")));
            }
        }
        else{
            if(Objects.nonNull(request.getParameter("bycompany")))
            {
                System.out.println(request.getParameter("bycompany"));
                model.addAttribute("products", productService.findAllByCompanyName(request.getParameter("bycompany")));
            }
            else {
                model.addAttribute("products", productService.findAll());
            }
        }

        model.addAttribute("companies", userService.findAllCompaniesNames());

        return "index";
    }

}
