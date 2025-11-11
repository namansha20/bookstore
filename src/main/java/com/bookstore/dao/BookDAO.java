package com.bookstore.dao;

import com.bookstore.entity.Book;
import java.util.List;

public interface BookDAO {
    void saveBook(Book book);
    Book getBookById(Long id);
    List<Book> getAllBooks();
    void updateBook(Book book);
    void deleteBook(Long id);
}
