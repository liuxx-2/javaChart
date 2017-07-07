package com.pojo.book;

import java.io.Serializable;

/**
 * Created by lenovo on 2017/5/15.
 */
public class Book implements Serializable {

   private Integer id;
    private String name;
    private String start_time;
    private String usernum;
    private String regeditdate;

    public String getUsernum() {
        return usernum;
    }

    public void setUsernum(String usernum) {
        this.usernum = usernum;
    }

    public String getRegeditdate() {
        return regeditdate;
    }

    public void setRegeditdate(String regeditdate) {
        this.regeditdate = regeditdate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }
}
