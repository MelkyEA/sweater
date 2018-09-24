package com.study.sweaterboot.domain;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by Alexey on 18.09.2018.
 */
public enum Role implements GrantedAuthority {
    USER,ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}

