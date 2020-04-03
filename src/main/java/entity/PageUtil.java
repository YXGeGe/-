package entity;

import sun.swing.BakedArrayList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PageUtil extends HashMap<String,Object> {
    public static PageUtil data(Integer count,List<?> data){
        PageUtil r = new PageUtil();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }

}
