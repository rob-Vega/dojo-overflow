package com.robvega.dojooverflow.controller;

import com.robvega.dojooverflow.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {

    MainService mainService;

    public MainController(MainService mainService) {
        this.mainService = mainService;
    }

    @GetMapping("/")
    public String redirect() {
        return "redirect:/questions";
    }

    // Question
    @GetMapping("/questions")
    public String getQuestions(Model model) {
        model.addAttribute("questionsList", mainService.findAllQuestions());
        return "questions.jsp";
    }

    @GetMapping("/questions/new")
    public String createQuestion() {
        return "newQuestion.jsp";
    }

    @PostMapping("/questions/new")
    public String createQuestion(
            @RequestParam(name = "question", required = false) String question,
            @RequestParam(name = "tags", required = false) String tags,
            RedirectAttributes redirectAttributes
    ) {

        // TO FIX
        if (question.length() < 1) {
            redirectAttributes.addFlashAttribute("questionError", "questionError");
            if (question.length() < 1) {
                redirectAttributes.addFlashAttribute("tagsError", "tagsError");
            }
            return "redirect:/questions/new";
        }
        mainService.createQuestion(question, tags);

        return "redirect:/questions";
    }

    @GetMapping("/questions/{id}")
    public String getQuestion(@PathVariable("id") Long id, Model model) {
        model.addAttribute("question", mainService.findQuestionById(id));
        return "question.jsp";
    }

    @PostMapping("/questions/{id}")
    public String submitAnswer(
            @PathVariable("id") Long id,
            @RequestParam("answer") String answer
    ) {
        mainService.createAnswer(id, answer);
        return "redirect:/questions/" + id;
    }
}
