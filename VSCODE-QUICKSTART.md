# Quick Start: Running BookHub in VS Code

This is a quick reference guide. For detailed instructions, see [VSCODE-SETUP.md](VSCODE-SETUP.md).

## Prerequisites Checklist

Before starting, ensure you have:
- [ ] **JDK 8+** installed (`java -version`)
- [ ] **Maven 3.6+** installed (`mvn -version`)
- [ ] **MySQL 8.0+** installed and running
- [ ] **Apache Tomcat 9.x** downloaded and extracted
- [ ] **VS Code** latest version

## 5-Minute Setup

### 1. Install Extensions (First Time Only)

Open VS Code and install these extensions:
- Extension Pack for Java (vscjava.vscode-java-pack)
- Spring Boot Extension Pack (vmware.vscode-spring-boot)
- Tomcat for Java (adashen.vscode-tomcat)

**Quick way**: When you open the project, VS Code will prompt you to install recommended extensions - just click "Install All".

### 2. Setup Database (One Time)

```bash
# Login to MySQL
mysql -u root -p

# Create database
CREATE DATABASE bookstore;
QUIT;
```

Edit `src/main/resources/database.properties`:
```properties
jdbc.username=root
jdbc.password=YOUR_PASSWORD
```

### 3. Open in VS Code

```bash
cd /path/to/bookstore
code .
```

Or: **File → Open Folder** and select the bookstore directory.

### 4. Build the Project

Press `Ctrl+Shift+B` (Windows/Linux) or `Cmd+Shift+B` (Mac)

This runs `mvn clean package` and creates `target/bookhub.war`

### 5. Deploy to Tomcat

**Option A - Using Tomcat Extension:**
1. Click the Tomcat icon in the sidebar
2. Add your Tomcat server (first time only)
3. Right-click on `target/bookhub.war`
4. Select "Run on Tomcat Server"

**Option B - Manual Deployment:**
```bash
# Copy WAR to Tomcat
cp target/bookhub.war $CATALINA_HOME/webapps/

# Start Tomcat
# Windows:
%CATALINA_HOME%\bin\startup.bat

# Linux/Mac:
$CATALINA_HOME/bin/startup.sh
```

### 6. Access the Application

Open your browser:
- Home: http://localhost:8080/bookhub/
- Add Book: http://localhost:8080/bookhub/books/add
- View Books: http://localhost:8080/bookhub/books/view

## Common Tasks

### Build Project
- Press `Ctrl+Shift+B`
- Or: Terminal → `mvn clean package`

### Clean Build
- Press `Ctrl+Shift+P`
- Type: "Tasks: Run Task"
- Select: "maven-clean"

### Debug Mode
1. Start Tomcat with debug enabled:
   ```bash
   # Linux/Mac
   $CATALINA_HOME/bin/catalina.sh jpda start
   
   # Windows
   %CATALINA_HOME%\bin\catalina.bat jpda start
   ```
2. In VS Code, press `F5`
3. Select "Remote Debug Tomcat"
4. Set breakpoints by clicking in the left margin

### View Maven Dependencies
- Open the Maven view from the sidebar (or `Ctrl+Shift+P` → "Maven: Explore")
- Expand "bookhub" → "Dependencies"

### Format Code
- Format entire file: `Shift+Alt+F`
- Format selection: Select code, then `Ctrl+K Ctrl+F`

## Project Structure

```
bookstore/
├── .vscode/              ← VS Code config (you just added this!)
├── src/main/
│   ├── java/             ← Java source code
│   ├── resources/        ← database.properties
│   └── webapp/           ← JSP files, WEB-INF
├── target/               ← Built files (bookhub.war)
└── pom.xml               ← Maven configuration
```

## Troubleshooting

### "Java extension not working"
- Press `Ctrl+Shift+P`
- Type: "Java: Clean Java Language Server Workspace"
- Select "Reload and delete"

### "Cannot find Maven"
- Check: `mvn -version` in terminal
- If not found, add Maven to your PATH

### "Database connection failed"
- Check MySQL is running: `mysql -u root -p`
- Verify credentials in `database.properties`

### "Port 8080 in use"
- Stop other applications using port 8080
- Or change Tomcat port in `conf/server.xml`

### Build fails
```bash
# Clean everything and rebuild
mvn clean install -U
```

## Next Steps

1. **Test the app**: Add a book and view it in the database
2. **Explore code**: Use `Ctrl+P` to quick-search files
3. **Make changes**: Edit JSP files (auto-reload) or Java files (need redeploy)
4. **Learn more**: Read [VSCODE-SETUP.md](VSCODE-SETUP.md) for advanced features

## Key Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Build | `Ctrl+Shift+B` |
| Command Palette | `Ctrl+Shift+P` |
| Quick Open File | `Ctrl+P` |
| Terminal | `` Ctrl+` `` |
| Debug | `F5` |
| Go to Definition | `F12` |
| Format Document | `Shift+Alt+F` |
| Find | `Ctrl+F` |

## Help & Documentation

- **Detailed Setup**: [VSCODE-SETUP.md](VSCODE-SETUP.md)
- **Project Info**: [README.md](README.md)
- **Quick Start**: [QUICKSTART.md](QUICKSTART.md)
- **Eclipse Setup**: [ECLIPSE-SETUP.md](ECLIPSE-SETUP.md)

---

**Need detailed help?** See [VSCODE-SETUP.md](VSCODE-SETUP.md) for comprehensive instructions, debugging tips, and advanced features.
