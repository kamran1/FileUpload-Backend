package com.kamran;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Kamran on 9/7/2019.
 */


@RestController
public class Controller {

    @GetMapping(value = "upload")
    public String uploadFile(){

        return "File Upload SuccessFully";
    }
}


