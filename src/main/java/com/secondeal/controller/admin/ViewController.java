package com.secondeal.controller.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author:Mr.SSai
 * @Descriprtion:
 * @Date:9:45,2018/5/14
 * @Modified By:
 */
@RestController
@RequestMapping("/")
public class ViewController {

    @GetMapping("/")
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView("/console/index");
        return mv;
    }

    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("/console/pages/index");
        return mv;
    }
}
