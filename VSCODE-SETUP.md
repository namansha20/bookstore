# Visual Studio Code Setup Guide for BookHub

This guide will help you set up and run the BookHub Spring MVC application in Visual Studio Code.

## Prerequisites

Before you begin, ensure you have the following installed:

1. **Visual Studio Code** - Latest version
   - Download from: https://code.visualstudio.com/

2. **JDK 8 or higher**
   - Download from: https://adoptium.net/ (Recommended) or https://www.oracle.com/java/technologies/downloads/
   - Verify installation: `java -version`

3. **Apache Maven 3.6+**
   - Download from: https://maven.apache.org/download.cgi
   - Verify installation: `mvn -version`

4. **MySQL Server 8.0+**
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Must be running before starting the application

5. **Apache Tomcat 9.x** (for deployment)
   - Download from: https://tomcat.apache.org/download-90.cgi
   - Extract to a folder (e.g., `C:\apache-tomcat-9.0.xx` on Windows or `/opt/tomcat9` on Linux/Mac)

## Step 1: Install Required VS Code Extensions

When you open this project in VS Code, you will be prompted to install recommended extensions. Click **"Install All"** to install them automatically.

Alternatively, install these extensions manually:

### Essential Extensions:
1. **Extension Pack for Java** (vscjava.vscode-java-pack)
   - Includes: Language Support, Debugger, Test Runner, Maven Support, Dependency Viewer
2. **Spring Boot Extension Pack** (vmware.vscode-spring-boot)
3. **Tomcat for Java** (adashen.vscode-tomcat)
4. **XML** (redhat.vscode-xml)

### Recommended Extensions:
5. **MySQL** (cweijan.vscode-mysql-client2) - For database management
6. **GitLens** (eamodio.gitlens) - Enhanced Git integration

### How to Install Extensions:
- Press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac)
- Search for each extension by name
- Click **Install**

## Step 2: Configure Java and Maven

### 2.1 Set Java Home

1. Press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac) to open the Command Palette
2. Type "Java: Configure Java Runtime"
3. Set your JDK path

Alternatively, add to your VS Code settings (File > Preferences > Settings):
```json
{
    "java.home": "/path/to/your/jdk",
    "java.configuration.runtimes": [
        {
            "name": "JavaSE-1.8",
            "path": "/path/to/your/jdk"
        }
    ]
}
```

### 2.2 Verify Maven

Open the integrated terminal in VS Code:
- Press `` Ctrl+` `` (backtick) or `View > Terminal`
- Run: `mvn -version`

If Maven is not found, add it to your system PATH or configure it in VS Code settings:
```json
{
    "maven.executable.path": "/path/to/maven/bin/mvn"
}
```

## Step 3: Database Setup

### 3.1 Start MySQL Server

Make sure MySQL is running on your system.

### 3.2 Create Database

Open a terminal and run:
```bash
mysql -u root -p
```

Then execute:
```sql
CREATE DATABASE bookstore;
QUIT;
```

Alternatively, use the provided SQL script:
```bash
mysql -u root -p < database-setup.sql
```

### 3.3 Configure Database Connection

Edit `src/main/resources/database.properties` with your MySQL credentials:

```properties
jdbc.url=jdbc:mysql://localhost:3306/bookstore?useSSL=false&serverTimezone=UTC
jdbc.username=root
jdbc.password=your_mysql_password
```

**Important**: Replace `your_mysql_password` with your actual MySQL password.

## Step 4: Open Project in VS Code

1. Launch Visual Studio Code
2. Go to **File → Open Folder** (or `Ctrl+K Ctrl+O`)
3. Navigate to and select the `bookstore` project directory
4. Click **Select Folder**

VS Code will automatically:
- Detect the Maven project
- Download dependencies
- Build the project
- Index the source code

**Note**: The first time may take a few minutes as Maven downloads all dependencies.

## Step 5: Build the Project

### Using VS Code Tasks (Recommended):

1. Press `Ctrl+Shift+B` (Windows/Linux) or `Cmd+Shift+B` (Mac) to run the default build task
2. Or press `Ctrl+Shift+P` and select "Tasks: Run Build Task"

### Using Maven View:

1. Open the Maven view from the sidebar (or press `Ctrl+Shift+P` and type "Maven: Explore")
2. Expand the **bookhub** project
3. Expand **Lifecycle**
4. Click on **package** to build the project

### Using Terminal:

Open the integrated terminal and run:
```bash
mvn clean package
```

This creates the WAR file at: `target/bookhub.war`

## Step 6: Configure Tomcat Server

### Method 1: Using Tomcat Extension (Recommended)

1. Press `Ctrl+Shift+P` and type "Tomcat: Add Tomcat Server"
2. Select your Tomcat installation directory
3. The server will appear in the **Tomcat Servers** view (usually in the Explorer sidebar)

### Method 2: Manual Configuration

Set the `CATALINA_HOME` environment variable:

**Windows:**
```cmd
set CATALINA_HOME=C:\path\to\apache-tomcat-9.0.xx
```

**Linux/Mac:**
```bash
export CATALINA_HOME=/path/to/apache-tomcat-9.0.xx
```

## Step 7: Deploy and Run

### Option A: Using Tomcat Extension (Easiest)

1. In the Explorer sidebar, find the **Tomcat Servers** view
2. Right-click on your Tomcat server
3. Select **"Start Tomcat Server"**
4. Right-click on `target/bookhub.war` in the file explorer
5. Select **"Run on Tomcat Server"**

### Option B: Manual Deployment

1. Build the project (Step 5)
2. Copy `target/bookhub.war` to `{CATALINA_HOME}/webapps/`
3. Start Tomcat:
   - **Windows**: Run `{CATALINA_HOME}\bin\startup.bat`
   - **Linux/Mac**: Run `{CATALINA_HOME}/bin/startup.sh`

### Option C: Using Maven Task

1. Press `Ctrl+Shift+P`
2. Type "Tasks: Run Task"
3. Select "deploy-to-tomcat" (requires CATALINA_HOME to be set)

## Step 8: Access the Application

Once Tomcat starts successfully, open your web browser and navigate to:

- **Home Page**: http://localhost:8080/bookhub/
- **Add Book**: http://localhost:8080/bookhub/books/add
- **View Books**: http://localhost:8080/bookhub/books/view

## Step 9: Test the Application

1. Open http://localhost:8080/bookhub/ in your browser
2. Click **"Add Book"**
3. Fill in the form:
   - **Title**: Clean Code
   - **Author**: Robert C. Martin
   - **Price**: 39.99
4. Click **"Add Book"**
5. You should be redirected to the **"View Books"** page
6. Verify the book appears in the table

## Debugging in VS Code

### Debug with Tomcat

1. **Configure Tomcat for Remote Debugging**:
   
   Edit Tomcat's startup script to enable debug mode:
   
   **Windows** (`{CATALINA_HOME}\bin\catalina.bat`):
   Add at the beginning:
   ```bat
   set JPDA_ADDRESS=8000
   set JPDA_TRANSPORT=dt_socket
   ```
   Start with: `catalina.bat jpda start`
   
   **Linux/Mac** (`{CATALINA_HOME}/bin/catalina.sh`):
   Start with: `./catalina.sh jpda start`

2. **Attach VS Code Debugger**:
   - Press `F5` or go to **Run > Start Debugging**
   - Select **"Remote Debug Tomcat"** configuration
   - Set breakpoints by clicking in the left margin of your code

### Set Breakpoints

1. Open any Java file (e.g., `BookController.java`)
2. Click in the left margin next to the line number to set a breakpoint (red dot appears)
3. Trigger the code path by interacting with the application
4. VS Code will pause execution at the breakpoint

### Debug Controls

When paused at a breakpoint:
- **F5**: Continue
- **F10**: Step Over
- **F11**: Step Into
- **Shift+F11**: Step Out
- **Ctrl+Shift+F5**: Restart
- **Shift+F5**: Stop

## Project Structure in VS Code

```
bookstore/
├── .vscode/                              # VS Code configuration
│   ├── settings.json                     # Project settings
│   ├── launch.json                       # Debug configurations
│   ├── tasks.json                        # Build tasks
│   └── extensions.json                   # Recommended extensions
├── src/
│   ├── main/
│   │   ├── java/com/bookstore/
│   │   │   ├── controller/               # Spring MVC controllers
│   │   │   │   └── BookController.java
│   │   │   ├── dao/                      # Data Access Objects
│   │   │   │   ├── BookDAO.java
│   │   │   │   └── BookDAOImpl.java
│   │   │   └── entity/                   # JPA entities
│   │   │       └── Book.java
│   │   ├── resources/
│   │   │   └── database.properties       # Database configuration
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/                # JSP views
│   │       │   │   ├── addBook.jsp
│   │       │   │   └── viewBooks.jsp
│   │       │   ├── applicationContext.xml
│   │       │   ├── dispatcher-servlet.xml
│   │       │   └── web.xml
│   │       └── index.jsp
├── target/                               # Compiled output
│   └── bookhub.war                       # Deployable WAR file
├── pom.xml                               # Maven configuration
└── README.md                             # Project documentation
```

## Useful VS Code Features

### IntelliSense & Auto-completion
- Type a few characters and press `Ctrl+Space` to see suggestions
- Works for Java code, Spring annotations, and XML configuration

### Quick Navigation
- **Go to Definition**: `F12` or `Ctrl+Click`
- **Go to Symbol**: `Ctrl+Shift+O` - Navigate within a file
- **Go to File**: `Ctrl+P` - Quick file search
- **Find All References**: `Shift+F12`

### Refactoring
- **Rename Symbol**: `F2`
- **Extract Method**: Select code, right-click, choose "Refactor"
- **Organize Imports**: `Shift+Alt+O`

### Code Formatting
- **Format Document**: `Shift+Alt+F`
- **Format Selection**: Select code, then `Ctrl+K Ctrl+F`

### Integrated Terminal
- **Open Terminal**: `` Ctrl+` `` (backtick)
- Run Maven commands directly
- Multiple terminals: Click the `+` icon

### Maven Explorer
- View all Maven goals and phases
- Run lifecycle phases with one click
- View and manage dependencies

### Git Integration
- **Source Control View**: `Ctrl+Shift+G`
- **Stage Changes**: Click `+` icon
- **Commit**: Enter message and press `Ctrl+Enter`
- **View Diff**: Click on modified file

## Development Workflow

### Typical Development Cycle:

1. **Edit Code**: Make changes to Java, JSP, or configuration files
2. **Save**: `Ctrl+S` (auto-formatting on save is enabled)
3. **Build**: `Ctrl+Shift+B` or auto-build (if enabled)
4. **Deploy**: Copy WAR to Tomcat or use Tomcat extension
5. **Restart Tomcat**: If needed (JSP changes don't require restart)
6. **Test**: Verify changes in the browser
7. **Debug**: If issues occur, use the debugger

### Hot Reload / Live Reload

For JSP files:
- Changes are reflected immediately without server restart
- Just refresh your browser

For Java files:
- In debug mode, some changes can be hot-swapped
- For major changes, redeploy the application

## Troubleshooting

### Issue: Extensions not installing

**Solution:**
1. Check your internet connection
2. Manually install from the Extensions Marketplace
3. Restart VS Code

### Issue: Java project not recognized

**Solution:**
1. Press `Ctrl+Shift+P`
2. Type "Java: Clean Java Language Server Workspace"
3. Select "Reload and delete"
4. Restart VS Code

### Issue: Maven dependencies not downloading

**Solution:**
1. Check your internet connection
2. Open terminal and run: `mvn clean install -U`
3. Check Maven settings: `~/.m2/settings.xml`
4. Try deleting `~/.m2/repository` and rebuild

### Issue: Cannot connect to database

**Solution:**
1. Verify MySQL is running: `mysql -u root -p`
2. Check database exists: `SHOW DATABASES;`
3. Verify credentials in `database.properties`
4. Check MySQL is listening on port 3306

### Issue: Tomcat port 8080 already in use

**Solution:**
1. Find and stop the application using port 8080
2. Or change Tomcat's port in `{CATALINA_HOME}/conf/server.xml`:
   ```xml
   <Connector port="8081" protocol="HTTP/1.1" .../>
   ```
3. Access at: http://localhost:8081/bookhub/

### Issue: 404 Not Found after deployment

**Solution:**
1. Verify WAR is in `{CATALINA_HOME}/webapps/`
2. Check Tomcat logs: `{CATALINA_HOME}/logs/catalina.out`
3. Ensure Tomcat fully started (check logs)
4. Try accessing: http://localhost:8080/bookhub/ (with trailing slash)

### Issue: Build failures

**Solution:**
1. Clean the project: `mvn clean`
2. Update Maven project: `Ctrl+Shift+P` → "Maven: Update Project"
3. Check Java version compatibility
4. Review error messages in the Problems view (`Ctrl+Shift+M`)

### Issue: Hibernate/Database errors

**Solution:**
1. Check Console/Terminal output for specific errors
2. Verify database connection settings
3. Check Hibernate logs for SQL errors
4. Ensure table permissions are correct

## MySQL Client Extension (Optional)

If you installed the MySQL extension:

1. Click the **Database** icon in the sidebar
2. Click **"+ Add Connection"**
3. Enter your MySQL credentials:
   - **Host**: localhost
   - **Port**: 3306
   - **Username**: root
   - **Password**: your_password
4. Select the **bookstore** database
5. You can now:
   - Browse tables
   - Run SQL queries
   - View data directly in VS Code

## Keyboard Shortcuts Reference

| Action | Windows/Linux | Mac |
|--------|--------------|-----|
| Command Palette | `Ctrl+Shift+P` | `Cmd+Shift+P` |
| Quick Open File | `Ctrl+P` | `Cmd+P` |
| Open Terminal | `` Ctrl+` `` | `` Cmd+` `` |
| Build Task | `Ctrl+Shift+B` | `Cmd+Shift+B` |
| Run Task | `Ctrl+Shift+P` → Tasks: Run Task | `Cmd+Shift+P` → Tasks: Run Task |
| Start Debugging | `F5` | `F5` |
| Toggle Breakpoint | `F9` | `F9` |
| Format Document | `Shift+Alt+F` | `Shift+Option+F` |
| Save All | `Ctrl+K S` | `Cmd+K S` |
| Find | `Ctrl+F` | `Cmd+F` |
| Replace | `Ctrl+H` | `Cmd+H` |
| Go to Definition | `F12` | `F12` |

## Additional Resources

- **VS Code Java Documentation**: https://code.visualstudio.com/docs/java/java-tutorial
- **Spring Boot in VS Code**: https://code.visualstudio.com/docs/java/java-spring-boot
- **Maven in VS Code**: https://code.visualstudio.com/docs/java/java-build
- **Debugging Java**: https://code.visualstudio.com/docs/java/java-debugging
- **Tomcat Documentation**: https://tomcat.apache.org/tomcat-9.0-doc/
- **Spring MVC Reference**: https://docs.spring.io/spring-framework/docs/current/reference/html/web.html
- **Hibernate Documentation**: https://hibernate.org/orm/documentation/

## Next Steps

Once you have the application running:

1. **Explore the Code**:
   - Use `Ctrl+P` to quickly jump to files
   - Use `F12` to navigate to definitions
   - Use `Shift+F12` to find all references

2. **Customize the Application**:
   - Modify JSP views in `src/main/webapp/WEB-INF/views/`
   - Update styling and layout
   - Add new features (edit, delete books)

3. **Extend Functionality**:
   - Implement search functionality
   - Add pagination for book list
   - Create user authentication
   - Add book categories

4. **Learn More**:
   - Read the `IMPLEMENTATION.md` for technical details
   - Check `README.md` for project architecture
   - Explore Spring MVC and Hibernate documentation

## Comparison: Eclipse vs VS Code

| Feature | Eclipse | VS Code |
|---------|---------|---------|
| Setup Complexity | More complex, requires WTP | Simpler, extension-based |
| Memory Usage | Higher | Lower |
| Startup Time | Slower | Faster |
| UI/UX | Traditional IDE | Modern, customizable |
| Extensions | Rich plugin ecosystem | Rapidly growing ecosystem |
| Built-in Server | Yes (WTP) | Via extensions |
| Performance | Good for large projects | Excellent, lightweight |
| Learning Curve | Steeper | Gentler |

Both are excellent choices - choose based on your preference and workflow!

## Getting Help

If you encounter issues:

1. Check this guide's Troubleshooting section
2. Review VS Code's Java documentation
3. Check the project's README.md and QUICKSTART.md
4. Search Stack Overflow for specific error messages
5. Check Tomcat logs for deployment issues

## Feedback

This setup guide is designed to make running BookHub in VS Code as smooth as possible. If you find any issues or have suggestions for improvement, please open an issue on the project repository.

Happy Coding! 🚀
