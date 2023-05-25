package com.robvega.dojooverflow.repository;

import com.robvega.dojooverflow.model.Question;
import org.springframework.data.repository.CrudRepository;

public interface QuestionRepository extends CrudRepository<Question, Long> {
}
