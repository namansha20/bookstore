# Quick Start Guide - BookHub Application

This guide will help you get the BookHub Spring MVC application up and running quickly.

## Prerequisites

- **JDK 1.8 or higher** - [Download](https://www.oracle.com/java/technologies/downloads/)
- **Apache Maven 3.6+** - [Download](https://maven.apache.org/download.cgi)
- **MySQL 8.0+** - [Download](https://dev.mysql.com/downloads/mysql/)
- **Apache Tomcat 9.x** - [Download](https://tomcat.apache.org/download-90.cgi)

## Step-by-Step Setup

### 1. Database Setup

Start MySQL and create the database:

```bash
mysql -u root -p
```

Then run the following SQL commands:

```sql
CREATE DATABASE bookstore;
QUIT;
```

Alternatively, you can use the provided SQL script:

```bash
mysql -u root -p < database-setup.sql
```

### 2. Configure Database Connection

Edit `src/main/resources/database.properties` with your MySQL credentials:

```properties
jdbc.url=jdbc:mysql://localhost:3306/bookstore?useSSL=false&serverTimezone=UTC
jdbc.username=YOUR_USERNAME
jdbc.password=YOUR_PASSWORD
```

### 3. Build the Application

From the project root directory:

```bash
mvn clean package
```

This will create `target/bookhub.war`

### 4. Deploy to Tomcat

**Option A: Manual Deployment**
1. Copy `target/bookhub.war` to Tomcat's `webapps` directory
2. Start Tomcat:
   - Windows: `bin\startup.bat`
   - Linux/Mac: `bin/startup.sh`

**Option B: Using Tomcat Maven Plugin**

Add this to your `pom.xml` and configure Tomcat credentials:

```bash
mvn tomcat7:deploy
```

### 5. Access the Application

Open your browser and navigate to:

```
http://localhost:8080/bookhub/
```

## Application URLs

- **Home**: `http://localhost:8080/bookhub/`
- **Add Book**: `http://localhost:8080/bookhub/books/add`
- **View Books**: `http://localhost:8080/bookhub/books/view`

## Troubleshooting

### Common Issues

**Issue**: Cannot connect to database
- **Solution**: Verify MySQL is running and credentials in `database.properties` are correct

**Issue**: Port 8080 already in use
- **Solution**: Either stop the application using port 8080 or change Tomcat's port in `conf/server.xml`

**Issue**: 404 Not Found
- **Solution**: Ensure the WAR is properly deployed and Tomcat has started successfully. Check `logs/catalina.out`

**Issue**: Hibernate SQL errors
- **Solution**: Check that the database exists and user has proper permissions

### Viewing Logs

Tomcat logs are located in the `logs` directory:
- `catalina.out` - Main server log
- `localhost.log` - Application-specific log

Hibernate SQL queries are logged to the console when `hibernate.show_sql=true` is set.

## Development Mode

For development with hot reload:

```bash
mvn tomcat7:run
```

Then access at `http://localhost:8080/`

## Testing the Application

1. Navigate to the home page
2. Click "Add Book"
3. Fill in the form:
   - Title: "Clean Code"
   - Author: "Robert C. Martin"
   - Price: 39.99
4. Click "Add Book"
5. You should be redirected to "View Books" page
6. Verify the book appears in the table

## Database Schema

The application automatically creates the following table:

```sql
CREATE TABLE books (
    book_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL
);
```

## Next Steps

- Customize the JSP views in `src/main/webapp/WEB-INF/views/`
- Add more features like edit and delete functionality
- Implement search and filter capabilities
- Add authentication and authorization
- Deploy to a production server

## Need Help?

Check the main README.md for detailed architecture and configuration information.
