package com.spring.object;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

import java.util.Collection;
//<!-- 사용자 고유 ID 가져오기 -->
//<p>User ID: ${SPRING_SECURITY_CONTEXT.authentication.principal.id}</p>
//
//<!-- 사용자 이름 가져오기 -->
//<p>User Name: ${SPRING_SECURITY_CONTEXT.authentication.principal.name}</p>
//세션과 동일한 역할을 할수있다
@Getter
public class CustomUserDetails extends User {
    private int id;
    private String name;
    private String authority;

    public CustomUserDetails(String username, String password,
                             Collection<? extends GrantedAuthority> authorities,
                             int id, String name, String authority) {
        super(username, password, authorities);
        this.id = id;
        this.name = name;
        this.authority = authority;
    }
}
