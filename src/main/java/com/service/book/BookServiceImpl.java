package com.service.book;

import com.common.util.DateUtil;
import com.dao.book.BookDao;
import com.pojo.book.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


/**
 * Created by Lxx on 2017/6/6.
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Map> bookList(HashMap<String,Object> stringObjectHashMap) {
        Date date = new Date();
        String s = DateUtil.formatDateToString(date, "yyyy-MM");
        stringObjectHashMap.put("user_date", s);
//      List<Map> list = chartDao.selectUserCountChart(stringObjectHashMap);
        List<Map> list = bookDao.bookList();
        List<Map> list1 = new ArrayList<Map>();
        //在这里处理结果
        if (null != list && 0 < list.size()) {
            //获取当前月总天数
            int days = DateUtil.getCurrentMonthLastDay(date);
            for (int i = 1; i <= days; i++) {

                //获取到当前月份
                String mm = DateUtil.formatDateToString(date, "MM");

                //格式化日期
                String istr = i + "";
                if (i < 10) {
                    istr = "0" + istr;
                }
                istr = mm + "-" + istr;

                //实例化一个map对象
                Map<String, Object> map1 = new HashMap<String, Object>();
                map1.put("regeditdate", istr);
                map1.put("usernum", 0);

                for (int j = 0; j < list.size(); j++) {
                    //获取当先循环元素（Map对象）
                    Map map = list.get(j);
                    Object o = map.get("regeditdate");
                    if (null != o) {
                        String s1 = o.toString();
                        if (istr.equals(s1)) {
                            map1 = map;
                            break;
                        }
                    }
                }

                //把map1放进空list中
                list1.add(map1);
            }
        }
        return list;
    }

    @Override
    public void insertBook(Book book) {
        bookDao.insertBook(book);
    }

    @Override
    public Long count(String name) {
        return bookDao.count(name);
    }

    @Override
    public void delete(Book book) {
        bookDao.delete(book);
    }

    @Override
    public Book update(Book book) {
        return bookDao.update(book);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }
}
