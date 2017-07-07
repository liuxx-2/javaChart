package com.service.book;

import com.pojo.book.Book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lxx on 2017/6/6.
 */
public interface BookService {

    List<Map> bookList(HashMap<String,Object> stringObjectHashMap);

    void insertBook(Book book);

    Long count(String name);

    void delete(Book book);


    Book update(Book book);

    void updateBook(Book book);
}
