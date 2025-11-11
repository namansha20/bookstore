<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookHub - Online Bookstore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            max-width: 600px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 48px;
        }
        p {
            color: #666;
            font-size: 18px;
            margin-bottom: 40px;
        }
        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .btn {
            display: inline-block;
            padding: 15px 30px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        .btn-primary {
            background-color: #4CAF50;
        }
        .btn-secondary {
            background-color: #2196F3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 BookHub</h1>
        <p>Welcome to BookHub - Your Online Bookstore Management System</p>
        <div class="buttons">
            <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary">Add Book</a>
            <a href="${pageContext.request.contextPath}/books/view" class="btn btn-secondary">View Books</a>
        </div>
    </div>
</body>
</html>
