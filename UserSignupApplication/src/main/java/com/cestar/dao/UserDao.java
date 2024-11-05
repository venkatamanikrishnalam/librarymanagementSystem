package com.cestar.dao;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cestar.model.Book;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;


/**
 * The UserDao class provides methods to interact with the user database.
 * It handles the setup of the database connection and user-related operations 
 * such as creating a new user and validating user login.
 */
public class UserDao {

    /**
     * Sets up a connection to the database.
     *
     * @return a Connection object to the database, or null if the connection fails
     */
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/book_inventory";
    private static final String USER = "root";
    private static final String PASSWORD = "Venky@123";
	

    /**
     * Establishes a database connection.
     * @return Connection object representing the database connection
     */
    public Connection setupConnection() {
        Connection con = null;

        String user = "root";
        String pwd = "Venky@123";
        String url = "jdbc:mysql://localhost:3306/book_inventory?useSSL=false";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pwd);
            System.out.println("Connection Established ");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }


    /**
     * Initializes the database by executing the setup script.
     */
    public void setupDatabase() {
        Connection connection = setupConnection();
        String scriptPath = "C:/Users/manik/Desktop/Java/Myprojects/UserLoginAndSignupApplication/src/setup_inventory.sql";
        
        try (BufferedReader reader = new BufferedReader(new FileReader(scriptPath));
             Statement statement = connection.createStatement()) {
             
            StringBuilder sqlBuilder = new StringBuilder();
            String line;
            
            while ((line = reader.readLine()) != null) {
                sqlBuilder.append(line).append("\n");
            }
            
            String[] sqlCommands = sqlBuilder.toString().split(";");
            for (String command : sqlCommands) {
                if (!command.trim().isEmpty()) {
                    statement.execute(command.trim());
                }
            }
            
            System.out.println("Database setup completed successfully.");
            
        } catch (IOException e) {
            System.out.println("Error reading the SQL file: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }


    public int addBook(Book book) {
    	int status = 0;
    	 Connection con = setupConnection();
        String query = "INSERT INTO Inventory (entry_id ,title, author, genre, publication_date, isbn) VALUES (?,?, ?, ?, ?, ?)";
        try {
             PreparedStatement stmt = con.prepareStatement(query) ;
            stmt.setString(1, book.getEntryID());
            stmt.setString(2, book.getTitle());
            stmt.setString(3, book.getAuthor());
            stmt.setString(4, book.getGenre());
            stmt.setString(5, book.getPublicationDate());
            stmt.setString(6, book.getIsbn());
         
        status = stmt.executeUpdate();
    } catch (MySQLIntegrityConstraintViolationException e) {
        // Username already exists
        return -1;
    } catch (SQLException e) {
        // Handle SQL exceptions
        return 0;
    }
    return status;
    }
    
    


    public List<com.cestar.model.Book> filterBooks(String entryID, String title, String author, String genre, String publicationDate, String isbn) {
        List<com.cestar.model.Book> books = new ArrayList<>();
        Connection con = setupConnection();

        // Create the SQL query with dynamic filters
        StringBuilder query = new StringBuilder("SELECT * FROM Inventory WHERE 1=1");

        // Append conditions based on which parameters are not null or empty
        if (entryID != null && !entryID.isEmpty()) {
            query.append(" AND entry_id LIKE ?");
        }
        if (title != null && !title.isEmpty()) {
            query.append(" AND title LIKE ?");
        }
        if (author != null && !author.isEmpty()) {
            query.append(" AND author LIKE ?");
        }
        if (genre != null && !genre.isEmpty()) {
            query.append(" AND genre LIKE ?");
        }
        if (publicationDate != null && !publicationDate.isEmpty()) {
            query.append(" AND publication_date LIKE ?");
        }
        if (isbn != null && !isbn.isEmpty()) {
            query.append(" AND isbn LIKE ?");
        }

        System.err.println("SQL Query: " + query.toString());

        try {
            PreparedStatement stmt = con.prepareStatement(query.toString());
            int parameterIndex = 1;

            // Set parameters based on which ones were included in the query
            if (entryID != null && !entryID.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + entryID + "%");
            }
            if (title != null && !title.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + title + "%");
            }
            if (author != null && !author.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + author + "%");
            }
            if (genre != null && !genre.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + genre + "%");
            }
            if (publicationDate != null && !publicationDate.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + publicationDate + "%");
            }
            if (isbn != null && !isbn.isEmpty()) {
                stmt.setString(parameterIndex++, "%" + isbn + "%");
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                books.add(new com.cestar.model.Book(
                    rs.getString("entry_id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getString("genre"),
                    rs.getString("publication_date"),
                    rs.getString("isbn")
                ));
            }
            System.err.println("Filtered Books: " + books);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close(); 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return books;
    }

    
    public String exportBooksToCSV() {
        StringBuilder csvData = new StringBuilder();
        csvData.append("Entry ID,Title,Author,Genre,Publication Date,ISBN\n"); // CSV header

        String query = "SELECT * FROM Inventory";
        
        try (Connection con = setupConnection(); 
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                String entryID = rs.getString("entry_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String genre = rs.getString("genre");
                String publicationDate = rs.getString("publication_date");
                String isbn = rs.getString("isbn");
                
                // Append book data to CSV
                csvData.append(String.format("%s,%s,%s,%s,%s,%s\n", entryID, title, author, genre, publicationDate, isbn));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return csvData.toString();
    }


   
}
