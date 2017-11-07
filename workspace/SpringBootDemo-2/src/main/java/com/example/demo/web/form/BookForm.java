package com.example.demo.web.form;

import java.io.Serializable;

import com.example.demo.domain.Book;

public class BookForm implements Serializable {

    private static final long serialVersionUID = 1L;

    public BookForm() {
    }

    public BookForm(Book book) {
        this.setBookId(book.getBookId());
        this.setBookName(book.getBookName());
        this.setDescription(book.getDescription());
        this.setLink(book.getLink());
        this.setImg(book.getImg());
        this.setTag(book.getTag());
    }

    private Long bookId;
    private String bookName;
    private String link;
    private String img;
    private String description;
    private String tag;

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTag() {
        return tag;
    }
}
