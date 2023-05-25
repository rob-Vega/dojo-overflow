package com.robvega.dojooverflow.service;

import com.robvega.dojooverflow.model.Answer;
import com.robvega.dojooverflow.model.Question;
import com.robvega.dojooverflow.model.Tag;
import com.robvega.dojooverflow.repository.AnswerRepository;
import com.robvega.dojooverflow.repository.QuestionRepository;
import com.robvega.dojooverflow.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MainService {

    private final QuestionRepository questionRepository;
    private final TagRepository tagRepository;
    private final AnswerRepository answerRepository;

    @Autowired
    public MainService(QuestionRepository questionRepository,
                       TagRepository tagRepository,
                       AnswerRepository answerRepository) {
        this.questionRepository = questionRepository;
        this.tagRepository = tagRepository;
        this.answerRepository = answerRepository;
    }

    public Iterable<Question> findAllQuestions() {
        return questionRepository.findAll();
    }

    public Question findQuestionById(Long id) {
        Optional<Question> optionalQuestion = questionRepository.findById(id);
        if (optionalQuestion.isPresent()) {
            return optionalQuestion.get();
        }
        return null;
    }

    public void createQuestion(String newQuestion, String newTags) {
        Question question = new Question();
        question.setQuestion(newQuestion);

        String[] subjects = newTags.split(",");
        for (String subject : subjects) {
            String trimmedSubject = subject.trim();
            Optional<Tag> optionalTag = tagRepository.findBySubject(trimmedSubject);

            if (optionalTag.isPresent()) {
                question.addTag(optionalTag.get());
            } else {
                Tag tag = new Tag();
                tag.setSubject(trimmedSubject);
                tagRepository.save(tag);
                question.addTag(tag);
            }
        }
        questionRepository.save(question);
    }

    public void createAnswer(Long id, String newAnswer) {
        Optional<Question> optionalQuestion = questionRepository.findById(id);
        if (optionalQuestion.isPresent()) {
            Question question = optionalQuestion.get();
            Answer answer = new Answer();
            answer.setAnswer(newAnswer);
            answer.setQuestion(question);
            answerRepository.save(answer);
        }
    }
}
