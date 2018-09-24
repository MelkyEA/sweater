package com.study.sweaterboot.repository;

import com.study.sweaterboot.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Alexey on 18.09.2018.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

     User findByActivationCode(String code);


}
