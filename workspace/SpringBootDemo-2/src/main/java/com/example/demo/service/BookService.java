package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.example.demo.domain.Book;
import com.example.demo.domain.BookRepository;

public class BookService {

    @Autowired
    private BookRepository bookRepository;

    public List<Book> findAll() {
        return this.bookRepository.findAll();
    }

    public List<Book> findByBookNameLikeAndTagLike(String bookName, String tag) {
        if (StringUtils.isEmpty(bookName) && (StringUtils.isEmpty(tag))) {
            return this.findAll();
        }
        return this.bookRepository.findBookNameLikeAndTagLike("%" + bookName + "%", "%" + tag + "%");
    }
}
