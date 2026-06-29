package com.finsmart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class FinSmartApplication {

    public static void main(String[] args) {
        SpringApplication.run(FinSmartApplication.class, args);
        System.out.print("Backend started");
    }
}
