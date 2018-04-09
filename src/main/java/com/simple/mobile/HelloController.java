package com.simple.mobile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {
    @Autowired
    private GirlProperties girlProperties;

    @RequestMapping(value = "/say/{id}",method = RequestMethod.GET)
    public String toSay(@PathVariable("id") Integer id){
//        return girlProperties.getCupSize();
        return "id = "+id;
    }
}
