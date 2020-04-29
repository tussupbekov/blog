package com.example.blog.controller;

import com.example.blog.model.User;
import com.example.blog.repository.UserRepository;
import com.example.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

@Controller
public class LoginController {

    private UserRepository userRepository;
    private BCryptPasswordEncoder passwordEncoder;
    private UserService userService;

    @Autowired
    public LoginController(
            UserRepository userRepository,
            BCryptPasswordEncoder passwordEncoder,
            UserService userService
    ){
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model){
        this.userService.setSessionData(model);
        model.addAttribute("title", "Login");
        return "auth/login";
    }

    @GetMapping("/register")
    public String getRegistrationPage(Model model) {
        this.userService.setSessionData(model);
        model.addAttribute("title", "Register");
        return "auth/register";
    }

    @PostMapping("/register")
    public ModelAndView register(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String email,
            ModelMap model
    ){
        User user = this.userRepository.findByUsername(username);
        if (Objects.isNull(user)){
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(this.passwordEncoder.encode(password));
            newUser.setEmail(email);
            this.userRepository.save(newUser);
        }
        return new ModelAndView("redirect:/", model);
    }

}
