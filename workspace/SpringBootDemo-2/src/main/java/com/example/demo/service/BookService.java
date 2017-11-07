package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.example.demo.domain.Book;
import com.example.demo.domain.BookRepository;

@Service
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

    public Book findOne(Long bookId) {
        return this.bookRepository.findOne(bookId.longValue());
    }

    @Transactional
    public Book save(Book book) {
        return this.bookRepository.save(book);
    }

    @Transactional
    public void delete(Book book) {
        this.bookRepository.delete(book);
    }

}
