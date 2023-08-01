package com.spring.object;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.domain.UsersVO;

import lombok.Getter;
import lombok.Setter;

import java.util.Collection;
//<!-- 사용자 고유 ID 가져오기 -->
//<p>User ID: ${SPRING_SECURITY_CONTEXT.authentication.principal.id}</p>
//
//<!-- 사용자 이름 가져오기 -->
//<p>User Name: ${SPRING_SECURITY_CONTEXT.authentication.principal.name}</p>
//<!-- 사용자 VO에서 이름 가져오기 -->
//<p>User Name from UsersVO: ${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.(컬럼명?)}</p>

//세션과 동일한 역할을 할수있다
@Getter
public class CustomUserDetails extends User {
	private static final long serialVersionUID = 1L; // Add this line
	private UsersVO userVO;

    public CustomUserDetails(String username, String password,
                             Collection<? extends GrantedAuthority> authorities,
                             UsersVO userVO) {
        super(username, password, authorities);
        this.userVO = userVO;
    }
}
