package com.spring.object;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;
import com.spring.service.UsersService;

import lombok.Setter;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	@Setter (onMethod_ = @Autowired)
	private UsersService service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersVO user = service.findById(username);
		if(user == null) {
			throw new UsernameNotFoundException(username + "not found");
		}

		return new CustomUserDetails(user.getId(), user.getPw(), findUserAuthorities(username), user);
	}
	
	public List<GrantedAuthority> findUserAuthorities(String username){
		GradeVO grade = service.getAccountAuthorities(username);
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(grade.getAuthority());
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(authority);
		
		return authorities;
	}
}
