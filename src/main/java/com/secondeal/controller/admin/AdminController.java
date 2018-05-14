package com.secondeal.controller.admin;

import com.secondeal.controller.BaseController;
import com.secondeal.model.Admin;
import com.secondeal.service.AdminI;
import com.secondeal.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/sys")
public class AdminController extends BaseController {
    @Autowired
    AdminI adminI;

    @PostMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> parameters = this.getParam();
        Map<String, Object> m = new HashMap<>();
        Map<String, Object> m1 = new HashMap<>();
        String name = StringUtil.parseString(parameters.get("username"));
        String passwd = StringUtil.parseString(parameters.get("password"));
        m.put("username", name);
        List<Admin> list = adminI.getUser(name);
        if (list.size() != 0) {
            String password = list.get(0).getPassword();
            try {
                if (Md5SaltTool.validPassword(passwd, password)) {
                    //                        将用户活动表自加一
                    // 返回登录token
                    String token = JavaWebToken.createJavaWebToken(m);
                    mv.addObject("token", token);
                    mv.setViewName("/console/pages/index");
                    return mv;
                }
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        mv.setViewName("/console/pages/index");
        return mv;
    }
}
