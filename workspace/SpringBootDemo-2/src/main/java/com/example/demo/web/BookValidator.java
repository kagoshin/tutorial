package com.example.demo.web;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class BookValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        // TODO 自動生成されたメソッド・スタブ
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {
        // TODO 自動生成されたメソッド・スタブ

    }

}
