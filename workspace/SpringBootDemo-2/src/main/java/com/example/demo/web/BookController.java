package com.example.demo.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.domain.Book;
import com.example.demo.service.BookService;
import com.example.demo.web.form.BookForm;

@Controller
public class BookController {

    private static Logger logger  = LoggerFactory.getLogger(BookController.class);

    @Autowired
    BookValidator bookValidator;

    @InitBinder
    public void validatorBinder(WebDataBinder binder) {
        binder.addValidators(bookValidator);
    }

    @Autowired
    BookService bookservice;

    @RequestMapping(value = "/book", method = RequestMethod.GET)
    public String index(Model model) {
        List<Book> list = this.bookservice.findAll();
        model.addAttribute("bookList", list);
        model.addAttribute("bookForm", new BookForm());
        return "book";
    }

    @RequestMapping(value = "/book", method = RequestMethod.POST)
    public String search(@ModelAttribute BookForm bookForm, BindingResult result, Model model) {
        List<Book> list = this.bookservice.findByBookNameLikeAndTagLike(bookForm.getBookName(),  bookForm.getTag());
        model.addAttribute("bookList", list);
        return "book";
    }
}
