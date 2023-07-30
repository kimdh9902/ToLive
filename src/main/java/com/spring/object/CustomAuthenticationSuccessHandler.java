package com.spring.object;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
           Authentication authentication) throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        
        if (session != null) {
            
            String value = "custom_value";
            session.setAttribute("custom_attribute", value);

            // 기본 리다이렉션 URL로 전환
            response.sendRedirect("/auth/success");
        }
    }
}

