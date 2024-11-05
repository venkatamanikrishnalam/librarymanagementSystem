<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Added viewport for responsiveness -->
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px; /* Added margin for spacing */
        }

        h1 {
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .btn-container {
            margin-top: 20px;
        }

        button {
            margin: 5px; /* Adds spacing between buttons */
        }

        /* Media queries for better responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 1.5rem; /* Smaller heading on smaller screens */
            }

            button {
                width: 100%; /* Full width buttons on smaller screens */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Book Management System</h1>
        <p>Use the options below to add a book or filter books based on criteria.</p>

        <div class="btn-container">
            <form action="addBook.jsp" method="get" style="display: inline;">
                <button type="submit" class="btn btn-success btn-lg">Add a New Book</button>
            </form>
            <form action="addFilter.jsp" method="get" style="display: inline;">
                <button type="submit" class="btn btn-primary btn-lg">Go to Filter Books</button>
            </form>
            <form action="/UsersSignupApp/book" method="post" style="display: inline;">
                <input type="hidden" name="action" value="export">
                <button type="submit" class="btn btn-info btn-lg">Export Book Inventory</button>
            </form>
        </div>
    </div>
</body>
</html>
