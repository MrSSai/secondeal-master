package com.secondeal.service.account;

import com.secondeal.model.account.UserActive;

/**
 * @Author:Mr.SSai
 * @Descriprtion:
 * @Date:15:59,2018/5/14
 * @Modified By:
 */
public interface UserActionI {
    int insert(UserActive userActive);

    int update(String name);

}
