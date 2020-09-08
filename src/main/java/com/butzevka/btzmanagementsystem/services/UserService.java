package com.butzevka.btzmanagementsystem.services;

import com.butzevka.btzmanagementsystem.model.User;

import java.util.List;

public interface UserService {

    User findUserByUsername(String username);

    User findUserById(Long id);

    List<User> findAllUsers();

    void saveUser(User user);
}
