package com.cestar.controllers;

import com.cestar.dao.UserDao;
import com.cestar.model.Book;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/")
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() throws ServletException {
        userDao = new UserDao(); // Initialize the DAO
        userDao.setupDatabase();

    }

    // Handle POST requests for adding a book
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addBook(request, response);
        } else if ("filter".equals(action)) {
            filterBooks(request, response);
        } else if ("export".equals(action)) {
            exportBooks(request, response);
        }
    }

 // Method to add a new book
    private void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entryID = request.getParameter("entryID");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        String publicationDate = request.getParameter("publicationDate");
        String isbn = request.getParameter("isbn");

        Book newBook = new Book(entryID, title, author, genre, publicationDate, isbn);
        int status = userDao.addBook(newBook); // Call DAO to add the book

        if (status > 0) {
            // Set success message for added book
            request.setAttribute("message", "User saved successfully!");
        } else if (status == -1) {
            // Set error message for already registered username
            request.setAttribute("error_mssg", "Userid or ISBN already registered.");
        } else {
            // Set error message for failure to save
            request.setAttribute("error_mssg", "Try again... user not saved!");
        }
        System.err.println(status);
        // Forward to index.jsp
        request.getRequestDispatcher("addBook.jsp").forward(request, response);
    }


    // Method to filter books
    private void filterBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entryID = request.getParameter("entryID");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String genre = request.getParameter("genre");
        String publicationDate = request.getParameter("publicationDate");
        String isbn = request.getParameter("isbn");
        System.err.println(entryID);

        List<Book> filteredBooks = userDao.filterBooks(entryID, title, author, genre, publicationDate, isbn);
        
        request.setAttribute("books", filteredBooks); // Set filtered books to request attribute
        request.getRequestDispatcher("addFilter.jsp").forward(request, response);

    }
    
    
    private void exportBooks(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String csvData = userDao.exportBooksToCSV();

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=book_inventory.csv");
        
        try (PrintWriter writer = response.getWriter()) {
            writer.write(csvData); // Write the CSV data to the response
        }
    }
}
