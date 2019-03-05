/*
 * Copyright. (c) 2008-2017. Carl Technology Studio
 */

package com.carl.auth.sso.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class SsoConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(SsoConfigApplication.class, args);
    }
}
