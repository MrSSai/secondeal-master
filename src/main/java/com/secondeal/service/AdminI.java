package com.secondeal.service;

import com.secondeal.model.Admin;
import org.hibernate.validator.constraints.EAN;

import java.util.List;

public interface AdminI {
    List<Admin> getUser(String name);
}
