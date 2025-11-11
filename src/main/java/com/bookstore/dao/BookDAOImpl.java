package com.bookstore.dao;

import com.bookstore.entity.Book;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class BookDAOImpl implements BookDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void saveBook(Book book) {
        sessionFactory.getCurrentSession().save(book);
    }
    
    @Override
    public Book getBookById(Long id) {
        return sessionFactory.getCurrentSession().get(Book.class, id);
    }
    
    @Override
    @SuppressWarnings("unchecked")
    public List<Book> getAllBooks() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Book")
                .list();
    }
    
    @Override
    public void updateBook(Book book) {
        sessionFactory.getCurrentSession().update(book);
    }
    
    @Override
    public void deleteBook(Long id) {
        Book book = getBookById(id);
        if (book != null) {
            sessionFactory.getCurrentSession().delete(book);
        }
    }
}
