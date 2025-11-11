<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book - BookHub</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .links {
            margin-top: 20px;
            text-align: center;
        }
        .links a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Book</h1>
        <form:form action="${pageContext.request.contextPath}/books/save" 
                   method="post" modelAttribute="book">
            <div class="form-group">
                <label for="title">Book Title:</label>
                <form:input path="title" id="title" required="true" 
                           placeholder="Enter book title"/>
            </div>
            
            <div class="form-group">
                <label for="author">Author:</label>
                <form:input path="author" id="author" required="true" 
                           placeholder="Enter author name"/>
            </div>
            
            <div class="form-group">
                <label for="price">Price:</label>
                <form:input path="price" id="price" type="number" 
                           step="0.01" min="0" required="true" 
                           placeholder="Enter price"/>
            </div>
            
            <input type="submit" value="Add Book"/>
        </form:form>
        
        <div class="links">
            <a href="${pageContext.request.contextPath}/books/view">View All Books</a>
        </div>
    </div>
</body>
</html>
