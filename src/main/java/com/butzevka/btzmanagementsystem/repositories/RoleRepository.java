package com.butzevka.btzmanagementsystem.repositories;

import com.butzevka.btzmanagementsystem.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);
    List<Role> findAll();

}