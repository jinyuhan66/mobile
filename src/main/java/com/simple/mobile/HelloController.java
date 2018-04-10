package com.simple.mobile;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/hello")
public class HelloController {

    @GetMapping(value = "/say")
    public String toSay(){
        return "hello world";
    }
}
