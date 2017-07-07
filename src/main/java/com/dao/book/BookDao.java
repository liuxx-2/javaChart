package com.dao.book;

import com.pojo.book.Book;

import java.util.List;
import java.util.Map;

/**
 * Created by Lxx on 2017/5/15.
 */
public interface BookDao {
    void insert(Book book);

    void insertBook(Book book);

    Long count(String name);

    List<Map> bookList();

    void delete(Book book);

    Book update(Book book);

    void updateBook(Book book);

}
