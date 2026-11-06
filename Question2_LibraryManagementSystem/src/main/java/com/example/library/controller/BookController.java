package com.example.library.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.library.entity.Book;
import com.example.library.service.BookService;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    // 1. Display all available books in a JSP table
    @GetMapping({"/", "/books"})
    public String viewBooksPage(Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return "book-list";
    }

    // 2. Show form to add new book
    @GetMapping("/books/new")
    public String showNewBookForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("actionTitle", "Add New Book");
        return "book-form";
    }

    // 3. Save book (Add new or Update existing)
    @PostMapping("/books/save")
    public String saveBook(@ModelAttribute("book") Book book) {
        bookService.saveBook(book);
        return "redirect:/books";
    }

    // 4. Show form to update book details
    @GetMapping("/books/edit/{id}")
    public String showEditBookForm(@PathVariable("id") Long id, Model model) {
        Book book = bookService.getBookById(id);
        if (book != null) {
            model.addAttribute("book", book);
            model.addAttribute("actionTitle", "Update Book Details");
            return "book-form";
        }
        return "redirect:/books";
    }

    // 5. Delete a book record using Book ID
    @GetMapping("/books/delete/{id}")
    public String deleteBook(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
        return "redirect:/books";
    }

    // 6. Search for a book using Book ID
    @GetMapping("/books/search")
    public String searchBook(@RequestParam(value = "searchId", required = false) Long searchId, Model model) {
        if (searchId == null) {
            return "redirect:/books";
        }
        Book book = bookService.getBookById(searchId);
        List<Book> list = new ArrayList<>();
        if (book != null) {
            list.add(book);
        } else {
            model.addAttribute("message", "No book found with Book ID: " + searchId);
        }
        model.addAttribute("books", list);
        return "book-list";
    }
}
