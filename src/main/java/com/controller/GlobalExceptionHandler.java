package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(value = { Exception.class })
    public String handleException(Model model,HttpServletRequest req,Exception ex) {
        ex.printStackTrace();
		req.setAttribute("error", ex.getMessage());
		model.addAttribute("title", "Dattebaayo || Something Went Wrong");
        return "error";
    }
}
