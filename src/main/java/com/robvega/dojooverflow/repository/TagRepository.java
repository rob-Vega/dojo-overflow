package com.robvega.dojooverflow.repository;

import com.robvega.dojooverflow.model.Tag;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface TagRepository extends CrudRepository<Tag, Long> {
    Optional<Tag> findBySubject(String subject);
}
