package com.controllor.book;


import com.google.gson.Gson;
import com.pojo.book.Book;
import com.service.book.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/5/26.
 */
@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("bookchart")
    public ModelAndView book(ModelAndView mv) {
        mv.setViewName("/chart/chart_list");
        return mv;
    }

    @RequestMapping("bookList")
    public void bookList(HttpServletResponse response) {
        List<Map> list = bookService.bookList(new HashMap<String,Object>());
//        mv.addObject("list",list);
//        mv.setViewName("/chart/chart_list");
//        System.out.println(list);
        Gson gson = new Gson();
        String jsonStr = gson.toJson(list);
        try {
            response.getWriter().print(jsonStr);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        return jsonStr;
    }

    @RequestMapping("insert")
    public ModelAndView insert(ModelAndView mv) {
        mv.setViewName("insert");
        return mv;
    }

    @RequestMapping("doinsert")
    public String doinsert(Book book) {
        bookService.insertBook(book);
        return "redirect:/index.jsp";
    }

    @RequestMapping("delete")
    public String delete(Book book) {
        bookService.delete(book);
        return "redirect:/index.jsp";
    }

    @RequestMapping("update")
    public ModelAndView update(Book book,ModelAndView mv) {
        Book book1 = bookService.update(book);
        mv.addObject("book",book1);
        mv.setViewName("update");
        return mv;
    }
    @RequestMapping("updateBook")
    public String updateBook(Book book) {
        bookService.updateBook(book);
        return "redirect:/index.jsp";
    }


}
