package com.butzevka.btzmanagementsystem.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {

    private final com.butzevka.btzmanagementsystem.model.User user;

    public CurrentUser(String username, String password, Collection<? extends GrantedAuthority> authorities,
                       com.butzevka.btzmanagementsystem.model.User user) {
        super(username, password, authorities);
        this.user = user;
    }
    public com.butzevka.btzmanagementsystem.model.User getUser() {
        return user;
    }
}
