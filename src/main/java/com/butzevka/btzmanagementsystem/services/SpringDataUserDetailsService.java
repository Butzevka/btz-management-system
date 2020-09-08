package com.butzevka.btzmanagementsystem.services;

import com.butzevka.btzmanagementsystem.model.CurrentUser;
import com.butzevka.btzmanagementsystem.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

public class SpringDataUserDetailsService implements UserDetailsService {

    private UserService userService;

    @Autowired
    public void setUserRepository(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        Set<GrantedAuthority> grantedAuthoritySet = new HashSet<>();
        user.getRoles().forEach(role ->
                grantedAuthoritySet.add(new SimpleGrantedAuthority(role.getName())));
        return new CurrentUser(user.getUsername(),user.getPassword(), grantedAuthoritySet, user);
    }
}

