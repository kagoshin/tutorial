package com.example.demo.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long>{

    public List<Book> findBookNameLikeAndTagLike(String bookName, String tag);
}
