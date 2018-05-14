package com.secondeal.model.account;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class UserActive {
    private Long id;

    private String account;

    private Date lastLogin;

    private Date createTime;

    private Long count;
}