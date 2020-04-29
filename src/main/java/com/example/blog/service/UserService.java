package com.example.blog.service;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Collection;
import java.util.List;

@Service
public class UserService {

    public void setSessionData(Model model){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        boolean isAuthenticated = !(SecurityContextHolder.getContext().getAuthentication()
                instanceof AnonymousAuthenticationToken);
        SecurityContextHolder.getContext().getAuthentication();
        boolean isAdmin = false;
        for (GrantedAuthority authority:
             SecurityContextHolder.getContext().getAuthentication().getAuthorities()) {
            if (authority.getAuthority().equals("ROLE_ADMIN"))
                isAdmin = true;
        }
        model.addAttribute("isAuthenticated", isAuthenticated);
        model.addAttribute("username", username);
        model.addAttribute("isAdmin", isAdmin);
    }

}
