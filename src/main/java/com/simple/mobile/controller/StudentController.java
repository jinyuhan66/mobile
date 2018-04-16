package com.simple.mobile.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class StudentController {
    /**
     *
     */
    @GetMapping(value = "/freemarker")
    public String freeMarker(Map<String, Object> map) {
        map.put("name","joy");
        map.put("sex", 1);

        List<Map<String, Object>> friends = new ArrayList<>();
        Map<String, Object> friend = new HashMap<String,Object>();
        friend.put("name", "xbq");
        friend.put("age", 22);
        friends.add(friend);

        map.put("friends", friends);
        return "index";
    }
}
