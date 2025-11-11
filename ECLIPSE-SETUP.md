# Eclipse IDE Setup Guide for BookHub

This guide will help you import and run the BookHub Spring MVC application in Eclipse IDE with Apache Tomcat.

## Prerequisites

1. **Eclipse IDE for Enterprise Java and Web Developers** (2020-06 or later)
   - Download from: https://www.eclipse.org/downloads/packages/
   - Make sure you have the "Eclipse IDE for Enterprise Java and Web Developers" package which includes:
     - Maven integration (m2e)
     - Web Tools Platform (WTP)
     - Server adapters for Tomcat

2. **JDK 8 or higher**
   - Verify: `java -version`
   - Eclipse > Window > Preferences > Java > Installed JREs

3. **Apache Tomcat 9.x**
   - Download from: https://tomcat.apache.org/download-90.cgi
   - Extract to a folder (e.g., `C:\apache-tomcat-9.0.xx` or `/opt/tomcat9`)

4. **MySQL Server 8.0+**
   - Download from: https://dev.mysql.com/downloads/mysql/
   - Must be running before starting the application

## Step 1: Database Setup

1. Start MySQL server
2. Create the database:
   ```sql
   CREATE DATABASE bookstore;
   ```
3. Update credentials in `src/main/resources/database.properties`:
   ```properties
   jdbc.url=jdbc:mysql://localhost:3306/bookstore?useSSL=false&serverTimezone=UTC
   jdbc.username=root
   jdbc.password=your_password_here
   ```

## Step 2: Import Project into Eclipse

### Option A: Import as Existing Maven Project (Recommended)

1. Open Eclipse IDE
2. Go to **File → Import...**
3. Select **Maven → Existing Maven Projects**
4. Click **Next**
5. Click **Browse** and navigate to the cloned `bookstore` directory
6. Ensure `pom.xml` is checked
7. Click **Finish**

Eclipse will automatically:
- Download all Maven dependencies
- Configure the project structure
- Set up Java build path
- Configure web facets

### Option B: Import as General Project

1. Open Eclipse IDE
2. Go to **File → Import...**
3. Select **General → Existing Projects into Workspace**
4. Click **Next**
5. Click **Browse** and navigate to the cloned `bookstore` directory
6. Ensure the project is checked
7. Click **Finish**

## Step 3: Configure Apache Tomcat in Eclipse

### Add Tomcat Server

1. Go to **Window → Preferences**
2. Navigate to **Server → Runtime Environments**
3. Click **Add...**
4. Select **Apache → Apache Tomcat v9.0**
5. Click **Next**
6. Browse to your Tomcat installation directory
7. Select JRE (Java 8 or higher)
8. Click **Finish** and then **Apply and Close**

### Create Server Instance

1. Open the **Servers** view:
   - **Window → Show View → Servers**
   - If not visible: **Window → Show View → Other... → Server → Servers**

2. In the Servers view, click **"No servers are available. Click this link to create a new server..."**
   - Or right-click in the Servers view and select **New → Server**

3. Select **Apache → Tomcat v9.0 Server**
4. Click **Next**
5. Add **bookhub** project to the right side (Configured)
6. Click **Finish**

## Step 4: Build the Project

### Maven Build

1. Right-click on the project `bookhub`
2. Select **Run As → Maven build...**
3. In Goals, enter: `clean install`
4. Click **Run**

This will:
- Clean previous builds
- Download dependencies
- Compile the code
- Create the WAR file

Watch the Console view for build progress. You should see **BUILD SUCCESS**.

### Verify Dependencies

1. Right-click on the project
2. Select **Maven → Update Project...**
3. Check **Force Update of Snapshots/Releases**
4. Click **OK**

## Step 5: Deploy and Run on Tomcat

### Method 1: Using Server View (Recommended)

1. Right-click on **Tomcat v9.0 Server at localhost** in the Servers view
2. Select **Add and Remove...**
3. Add **bookhub** to the right side if not already there
4. Click **Finish**
5. Right-click on the server again
6. Select **Start**

### Method 2: Run on Server

1. Right-click on the project `bookhub`
2. Select **Run As → Run on Server**
3. Choose **Tomcat v9.0 Server at localhost**
4. Click **Finish**

### Monitor Startup

Watch the Console view for:
- Hibernate initialization messages
- Spring context loading
- "Server startup in [xxxx] ms"

## Step 6: Access the Application

Once the server starts successfully, open your browser:

- **Home Page**: http://localhost:8080/bookhub/
- **Add Book**: http://localhost:8080/bookhub/books/add
- **View Books**: http://localhost:8080/bookhub/books/view

## Step 7: Test the Application

1. Navigate to http://localhost:8080/bookhub/
2. Click **"Add Book"**
3. Fill in the form:
   - Title: Clean Code
   - Author: Robert C. Martin
   - Price: 39.99
4. Click **"Add Book"**
5. You should be redirected to the **"View Books"** page
6. Verify the book appears in the table

## Troubleshooting

### Issue: Project has build errors

**Solution:**
1. Right-click project → **Maven → Update Project**
2. Check **Force Update of Snapshots/Releases**
3. Clean project: **Project → Clean...**
4. Rebuild: **Project → Build Project**

### Issue: "Project facet Java version 1.8 is not supported"

**Solution:**
1. Right-click project → **Properties**
2. Go to **Project Facets**
3. Change Java version to match your installed JDK
4. Apply and close

### Issue: Cannot connect to database

**Solution:**
1. Verify MySQL is running
2. Check credentials in `src/main/resources/database.properties`
3. Test connection: `mysql -u root -p`
4. Ensure database exists: `SHOW DATABASES;`

### Issue: 404 Not Found

**Solution:**
1. Verify server started successfully (check Console)
2. Check server status in Servers view (should be "Started, Synchronized")
3. Try accessing: http://localhost:8080/bookhub/ (with trailing slash)
4. Clean Tomcat work directory:
   - Servers view → right-click server → **Clean...**
   - Servers view → right-click server → **Clean Tomcat Work Directory...**

### Issue: Port 8080 already in use

**Solution:**
1. Stop other applications using port 8080
2. Or change Tomcat port:
   - Double-click on server in Servers view
   - Change HTTP/1.1 port from 8080 to another (e.g., 8081)
   - Save and restart server
   - Access at: http://localhost:8081/bookhub/

### Issue: Changes not reflected

**Solution:**
1. Clean and rebuild: **Project → Clean...**
2. Restart server in Debug mode for hot-swap
3. Or republish: Right-click server → **Clean...** → **Publish**

### Issue: Hibernate/Database errors

**Solution:**
1. Check Console for specific error messages
2. Verify MySQL is running: `mysql -u root -p`
3. Check database exists: `USE bookstore;`
4. Verify table was created: `SHOW TABLES;`
5. Check Hibernate logs in Console for SQL errors

## Eclipse Project Structure

```
bookhub/
├── .settings/                          # Eclipse workspace settings
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/bookstore/
│   │   │       ├── entity/             # JPA entities
│   │   │       ├── dao/                # Data access layer
│   │   │       └── controller/         # Spring MVC controllers
│   │   ├── resources/
│   │   │   └── database.properties     # DB configuration
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/              # JSP views
│   │       │   ├── applicationContext.xml
│   │       │   ├── dispatcher-servlet.xml
│   │       │   └── web.xml
│   │       └── index.jsp
│   └── test/                           # Test sources (if any)
├── target/                             # Compiled output
│   └── bookhub.war                     # Deployable WAR
├── .classpath                          # Eclipse classpath
├── .project                            # Eclipse project
└── pom.xml                             # Maven configuration
```

## Useful Eclipse Shortcuts

- **Ctrl+Shift+R** - Open Resource (quick file search)
- **Ctrl+Shift+T** - Open Type (search Java classes)
- **Ctrl+Space** - Content Assist (auto-complete)
- **Ctrl+Shift+O** - Organize Imports
- **Ctrl+Shift+F** - Format code
- **Alt+Shift+R** - Rename
- **F3** - Go to declaration
- **Ctrl+/** - Comment/uncomment line

## Debug Mode

To run in debug mode for step-by-step debugging:

1. Right-click server → **Debug**
2. Set breakpoints by double-clicking in the left margin of the editor
3. When breakpoint hits, use:
   - **F5** - Step into
   - **F6** - Step over
   - **F7** - Step return
   - **F8** - Resume

## Hot Swap / Auto-Reload

For automatic reloading of changes without server restart:

1. Run server in **Debug** mode
2. Make changes to Java files
3. Save (**Ctrl+S**)
4. Eclipse will automatically reload changed classes (Java hot swap)

Note: JSP changes are automatically reflected without restart.

## Server Configuration

To view/edit server configuration:
1. Double-click on **Tomcat v9.0 Server at localhost** in Servers view
2. Configure:
   - Server Locations
   - Timeouts
   - Port numbers
   - Publishing options

## Additional Resources

- Eclipse Documentation: https://help.eclipse.org/
- Tomcat Documentation: https://tomcat.apache.org/tomcat-9.0-doc/
- Spring MVC Reference: https://docs.spring.io/spring-framework/docs/current/reference/html/web.html
- Hibernate Documentation: https://hibernate.org/orm/documentation/

## Next Steps

Once you have the application running:
- Explore the code structure
- Modify JSP views for custom styling
- Add new features (edit, delete books)
- Implement search functionality
- Add user authentication

For more details, see:
- `README.md` - Project overview and architecture
- `QUICKSTART.md` - Command-line setup guide
- `IMPLEMENTATION.md` - Technical implementation details
