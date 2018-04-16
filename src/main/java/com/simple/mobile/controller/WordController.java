package com.simple.mobile.controller;

import com.google.gson.Gson;
import com.simple.mobile.entity.Word;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/word")
public class WordController {

    @RequestMapping(value = "/getword")
    public String getWord(){
        Word hello = new Word();
        hello.setWord("hello");
        hello.setExplain("你好");
        hello.setSentence("hello world");

        Gson gson = new Gson();
        String h = gson.toJson(hello);

        return h;
    }
}
