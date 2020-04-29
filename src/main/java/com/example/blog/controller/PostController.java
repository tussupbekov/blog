package com.example.blog.controller;

import com.example.blog.model.Comment;
import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.repository.CommentRepository;
import com.example.blog.repository.PostRepository;
import com.example.blog.repository.UserRepository;
import com.example.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
public class PostController {

    private PostRepository postRepository;
    private UserService userService;
    private UserRepository userRepository;
    private CommentRepository commentRepository;

    @Autowired
    public PostController(
            PostRepository postRepository,
            UserService userService,
            UserRepository userRepository,
            CommentRepository commentRepository
    ){
        this.postRepository = postRepository;
        this.userService = userService;
        this.userRepository = userRepository;
        this.commentRepository = commentRepository;
    }

    @GetMapping("/")
    public String index(Model model){
        this.userService.setSessionData(model);
        List<Post> posts = this.postRepository.findAll();
        model.addAttribute("posts", posts);
        model.addAttribute("title", "Welcome to FrontendTricks, the most awesome blog on frontend dev");
        return "index";
    }

    @GetMapping("/post/{id}")
    public String getPost(Model model, @PathVariable Long id){
        this.userService.setSessionData(model);
        Post post = this.postRepository.getOne(id);
        model.addAttribute("post", post);
        model.addAttribute("title", post.getTitle());
        return "post/get_post";
    }

    @GetMapping("add_post")
    public String getAddPostPage(Model model){
        this.userService.setSessionData(model);
        model.addAttribute("title", "Add post");
        return "post/add_post";
    }

    @GetMapping("edit_post/{id}")
    public String getEditPostPage(@PathVariable Long id, Model model){
        this.userService.setSessionData(model);
        Post post = this.postRepository.getOne(id);
        model.addAttribute("post", post);
        model.addAttribute("title", "Edit post");
        return "post/edit_post";
    }

    @GetMapping("topic/{name}")
    public String getPostsByTopic(@PathVariable String name, Model model){
        this.userService.setSessionData(model);
        List<Post> posts = this.postRepository.getByTopic(name);
        model.addAttribute("posts", posts);
        model.addAttribute("title", name);
        return "index";
    }

    @PostMapping("/add_post")
    public ModelAndView addPost(
            @RequestParam String title,
            @RequestParam String topic,
            @RequestParam String text,
            ModelMap model
    ){
        Post post = new Post();
        post.setTitle(title);
        post.setTopic(topic);
        post.setText(text);
        this.postRepository.save(post);
        return new ModelAndView("redirect:/", model);
    }

    @PostMapping("/edit_post")
    public ModelAndView editPost(
            @RequestParam Long id,
            @RequestParam String title,
            @RequestParam String topic,
            @RequestParam String text,
            ModelMap model
    ){
        Post post = this.postRepository.getOne(id);
        post.setTitle(title);
        post.setTopic(topic);
        post.setText(text);
        this.postRepository.save(post);
        return new ModelAndView("redirect:/", model);
    }

    @PostMapping("/post_comment")
    public ModelAndView postComment(
            @RequestParam("post_id") Long postId,
            @RequestParam String text,
            ModelMap model
    ){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = this.userRepository.findByUsername(username);
        Comment comment = new Comment();
        comment.setText(text);
        Post post = this.postRepository.getOne(postId);
        comment.setPost(post);
        comment.setUser(user);
        this.commentRepository.save(comment);
        return new ModelAndView("redirect:/post/" + postId, model);
    }

}
