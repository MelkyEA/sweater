package com.study.sweaterboot.repository;

import com.study.sweaterboot.domain.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Alexey on 18.09.2018.
 */
public interface MessgaeRepository extends CrudRepository<Message, Integer> {
    List<Message> findByTag(String tag);

}
