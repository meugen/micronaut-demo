package com.example.controllers;

import com.example.responses.HelloResponse;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller(value="/api")
public class RestController {

    @Get(value="hello", produces={MediaType.APPLICATION_JSON})
    public HelloResponse hello() {
        return new HelloResponse("Hello, world!");
    }
}
