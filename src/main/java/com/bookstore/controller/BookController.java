package com.bookstore.controller;

import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    
    @Autowired
    private BookDAO bookDAO;
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveBook(@ModelAttribute("book") Book book) {
        bookDAO.saveBook(book);
        return "redirect:/books/view";
    }
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String viewAllBooks(Model model) {
        List<Book> books = bookDAO.getAllBooks();
        model.addAttribute("books", books);
        return "viewBooks";
    }
}
