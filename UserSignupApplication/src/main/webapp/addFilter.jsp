<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<%@ page import="com.cestar.model.Book"%>
<%@ page import="java.util.List"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Filter Books</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Viewport for responsiveness -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
    <style>
        /* General Styles */
        body {
            background-color: #e0e7ff;
            color: #333;
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }

        h1 {
            color: #4a4a8a;
            font-size: 2em;
            font-weight: 700;
            margin: 20px 0;
        }

        .table-container {
            width: 100%; /* Full width for responsiveness */
            margin-top: 20px;
        }

        /* Form Styling */
        .container {
            padding: 20px;
            border-radius: 8px;
            background-color: #f9fafb;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            color: #5a5a5a;
            font-weight: 600;
        }

        .form-control {
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #6366f1;
            box-shadow: 0px 0px 4px rgba(99, 102, 241, 0.4);
        }

        /* Button Styling */
        .btn-primary {
            background-color: #4f46e5;
            border-color: #4f46e5;
            font-weight: 600;
            padding: 10px 20px;
            transition: background-color 0.3s, transform 0.1s;
        }

        .btn-primary:hover {
            background-color: #4338ca;
            transform: scale(1.02);
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #6366f1;
            color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        th {
            font-weight: 600;
        }

        tbody tr:nth-child(even) {
            background-color: #f3f4f6;
        }

        tbody tr:hover {
            background-color: #e0e7ff;
        }

        /* Media queries for better responsiveness */
        @media (max-width: 768px) {
            h1 {
                font-size: 1.5rem; /* Smaller heading on smaller screens */
            }

            .form-control {
                margin-bottom: 15px; /* Spacing for small screens */
            }

            .table-container {
                padding: 0 10px; /* Padding for table on smaller screens */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Filter Books</h1>
        <form action="/UsersSignupApp/book" method="post">
            <input type="hidden" name="action" value="filter">
            <div class="row">
                <div class="col-md-4 mb-3">
                    <label for="entryID" class="form-label">Entry ID:</label>
                    <input type="number" id="entryID" name="entryID" class="form-control">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="title" class="form-label">Title:</label>
                    <input type="text" id="title" name="title" class="form-control">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="author" class="form-label">Author:</label>
                    <input type="text" id="author" name="author" class="form-control">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="genre" class="form-label">Genre:</label>
                    <input type="text" id="genre" name="genre" class="form-control">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="publicationDate" class="form-label">Publication Date:</label>
                    <input type="date" id="publicationDate" name="publicationDate" class="form-control">
                </div>
                <div class="col-md-4 mb-3">
                    <label for="isbn" class="form-label">ISBN:</label>
                    <input type="text" id="isbn" name="isbn" class="form-control">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Filter</button>
        </form>
    </div>

    <div class="container table-container">
        <h1>Filtered Books</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Entry ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Publication Date</th>
                    <th>ISBN</th>
                </tr>
            </thead>
            <tbody>
                <%
                @SuppressWarnings("unchecked")
                List<Book> books = (List<Book>) request.getAttribute("books");
                if (books != null) {
                    for (Book book : books) {
                %>
                <tr>
                    <td><%=book.getEntryID()%></td>
                    <td><%=book.getTitle()%></td>
                    <td><%=book.getAuthor()%></td>
                    <td><%=book.getGenre()%></td>
                    <td><%=book.getPublicationDate()%></td>
                    <td><%=book.getIsbn()%></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6">No books found.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>

        <!-- Link to navigate back to index.jsp -->
        <div class="mt-4">
            <a href="index.jsp" class="btn btn-secondary">Go back to Main Page</a>
        </div>
    </div>
</body>
</html>
