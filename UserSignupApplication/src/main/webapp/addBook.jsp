<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
        crossorigin="anonymous" />
    <style>
        body {
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            max-width: 400px;
            padding: 30px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .btn-primary {
            width: 100%;
            font-size: 18px;
            padding: 10px;
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .message, .errorMessage {
            text-align: center;
            font-weight: bold;
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
        }

        .message {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .errorMessage {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h1>Add New Book</h1>
            <form action="/UsersSignupApp/book" method="post">
                <input type="hidden" name="action" value="add">
                <div class="mb-3">
                    <label for="entryID" class="form-label">Entry ID:</label>
                    <input type="number" id="entryID" name="entryID" required class="form-control">
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Title:</label>
                    <input type="text" id="title" name="title" required class="form-control">
                </div>
                <div class="mb-3">
                    <label for="author" class="form-label">Author:</label>
                    <input type="text" id="author" name="author" required class="form-control">
                </div>
                <div class="mb-3">
                    <label for="genre" class="form-label">Genre:</label>
                    <input type="text" id="genre" name="genre" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="publicationDate" class="form-label">Publication Date:</label>
                    <input type="date" id="publicationDate" name="publicationDate" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="isbn" class="form-label">ISBN:</label>
                    <input type="text" id="isbn" name="isbn" class="form-control">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
            
            <% 
                String message = (String) request.getAttribute("message");
                String errorMessage = (String) request.getAttribute("error_mssg");
            %>

            <% if (message != null) { %>
                <div class="message"><%= message %></div>
            <% } else if (errorMessage != null) { %>
                <div class="errorMessage"><%= errorMessage %></div>
            <% } %>
            
            <a href="index.jsp" style="text-align: center; display: block; margin-top: 15px; font-size: 16px;">Go back to the main page</a>
        </div>
    </div>
</body>
</html>
