# BookHub - Spring MVC Online Bookstore

A complete Spring MVC web application for managing an online bookstore with MySQL database and Hibernate ORM.

## Features

- Add new books with title, author, and price
- View all books in the bookstore
- MySQL database integration using Hibernate ORM
- Spring MVC architecture with clean separation of concerns
- Responsive JSP views with modern styling

## Technology Stack

- **Backend**: Spring MVC 5.3.20, Hibernate 5.6.9
- **Database**: MySQL 8.0
- **Build Tool**: Maven
- **IDE**: Visual Studio Code (with .vscode configuration) or Eclipse IDE for Enterprise Java
- **Server**: Compatible with Tomcat 9.x
- **Java**: JDK 1.8+

## Project Structure

```
bookhub/
├── src/main/java/com/bookstore/
│   ├── entity/
│   │   └── Book.java                 # Book entity with JPA annotations
│   ├── dao/
│   │   ├── BookDAO.java              # DAO interface
│   │   └── BookDAOImpl.java          # Hibernate-based DAO implementation
│   └── controller/
│       └── BookController.java       # Spring MVC controller
├── src/main/webapp/
│   ├── WEB-INF/
│   │   ├── views/
│   │   │   ├── addBook.jsp           # Form to add books
│   │   │   └── viewBooks.jsp         # Display all books
│   │   ├── applicationContext.xml    # Hibernate & Spring configuration
│   │   ├── dispatcher-servlet.xml    # Spring MVC configuration
│   │   └── web.xml                   # Web application deployment descriptor
│   └── index.jsp                     # Landing page
└── src/main/resources/
    └── database.properties            # Database connection properties
```

## Database Setup

1. Install MySQL 8.0 or higher
2. Create a database named `bookstore`:

```sql
CREATE DATABASE bookstore;
```

3. Update database credentials in `src/main/resources/database.properties`:

```properties
jdbc.url=jdbc:mysql://localhost:3306/bookstore?useSSL=false&serverTimezone=UTC
jdbc.username=root
jdbc.password=your_password
```

4. The application uses Hibernate's `hbm2ddl.auto=update`, so the `books` table will be created automatically on first run.

## Build and Deploy

### Using Visual Studio Code:

**Quick Start**: [VSCODE-QUICKSTART.md](VSCODE-QUICKSTART.md) - Get running in 5 minutes  
**Detailed Guide**: [VSCODE-SETUP.md](VSCODE-SETUP.md) - Complete setup and debugging instructions

Quick steps:
1. Open folder in VS Code
2. Install recommended extensions (Java Extension Pack, Tomcat for Java)
3. Configure database in `src/main/resources/database.properties`
4. Build with `Ctrl+Shift+B` or run Maven task
5. Deploy to Tomcat and access at http://localhost:8080/bookhub/

### Using Eclipse IDE:

**See [ECLIPSE-SETUP.md](ECLIPSE-SETUP.md) for detailed Eclipse IDE setup instructions.**

Quick steps:
1. Import project: **File → Import → Existing Maven Projects**
2. Configure Tomcat server in Eclipse
3. Right-click project → **Run As → Run on Server**

### Using Maven Command Line:

1. Clean and build the project:
```bash
mvn clean package
```

2. Deploy the generated WAR file (`target/bookhub.war`) to your Tomcat server's `webapps` directory.

3. Start Tomcat and access the application at:
```
http://localhost:8080/bookhub/
```

## Application URLs

- **Home Page**: `/bookhub/`
- **Add Book**: `/bookhub/books/add`
- **View Books**: `/bookhub/books/view`

## API Endpoints

- `GET /books/add` - Display add book form
- `POST /books/save` - Save a new book
- `GET /books/view` - Display all books

## Configuration Files

### dispatcher-servlet.xml
- Configures Spring MVC components
- Sets up view resolver for JSP pages
- Enables component scanning for controllers

### applicationContext.xml
- Configures Hibernate SessionFactory
- Sets up DataSource with connection pooling
- Enables transaction management
- Configures entity scanning

### web.xml
- Configures DispatcherServlet
- Sets up context loader listener
- Configures character encoding filter

## Development Notes

- The application uses Spring's `@Transactional` annotation for transaction management
- Hibernate is configured to show SQL queries in console (`hibernate.show_sql=true`)
- The database schema is auto-updated based on entity definitions
- Form validation is handled through HTML5 validation and Spring form tags

## Getting Started with Your IDE

This project supports both Visual Studio Code and Eclipse IDE with pre-configured setup files.

### Visual Studio Code (Recommended)

The project includes `.vscode/` directory with configurations for Java, Maven, and Tomcat.

**For detailed VS Code setup instructions, see [VSCODE-SETUP.md](VSCODE-SETUP.md)**

Quick import steps:
1. Open the project folder in VS Code
2. Install recommended extensions when prompted
3. Configure database credentials in `src/main/resources/database.properties`
4. Build with `Ctrl+Shift+B` and deploy to Tomcat

### Eclipse IDE

This project includes Eclipse IDE configuration files (`.project`, `.classpath`, `.settings/`) for easy import and development.

**For detailed Eclipse setup instructions, see [ECLIPSE-SETUP.md](ECLIPSE-SETUP.md)**

Quick import steps:
1. Clone this repository
2. Open Eclipse IDE for Enterprise Java
3. Go to **File → Import → Existing Maven Projects**
4. Select the project directory
5. Configure Tomcat server and run

## License

This project is open source and available for educational purposes.