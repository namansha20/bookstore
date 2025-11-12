# 🚀 How to Run BookHub in Visual Studio Code

**Quick guide to get BookHub running in VS Code in under 10 minutes!**

---

## ✅ Prerequisites (Install First)

Make sure you have these installed:

| Software | Version | Check Command | Download Link |
|----------|---------|---------------|---------------|
| JDK | 8+ | `java -version` | https://adoptium.net/ |
| Maven | 3.6+ | `mvn -version` | https://maven.apache.org/download.cgi |
| MySQL | 8.0+ | `mysql --version` | https://dev.mysql.com/downloads/mysql/ |
| Tomcat | 9.x | Check folder exists | https://tomcat.apache.org/download-90.cgi |
| VS Code | Latest | Open VS Code | https://code.visualstudio.com/ |

---

## 📋 Step-by-Step Instructions

### **STEP 1: Setup MySQL Database**

Open terminal/command prompt and run:

```bash
mysql -u root -p
```

Then create the database:

```sql
CREATE DATABASE bookstore;
QUIT;
```

### **STEP 2: Configure Database Connection**

1. Navigate to: `src/main/resources/database.properties`
2. Update these lines with your MySQL credentials:

```properties
jdbc.username=root
jdbc.password=YOUR_MYSQL_PASSWORD
```

### **STEP 3: Open Project in VS Code**

**Option A - From Terminal:**
```bash
cd /path/to/bookstore
code .
```

**Option B - From VS Code:**
1. Open VS Code
2. Click: **File → Open Folder**
3. Select the `bookstore` folder
4. Click **Select Folder**

### **STEP 4: Install Extensions**

VS Code will show a notification:

> "This workspace has extension recommendations"

**→ Click "Install All"** (This installs 12 extensions)

**Essential extensions being installed:**
- ✅ Extension Pack for Java
- ✅ Spring Boot Extension Pack
- ✅ Tomcat for Java
- ✅ XML Language Support
- ✅ MySQL Client (optional)
- ✅ GitLens (optional)

**Wait for all extensions to finish installing** (check bottom right for progress)

### **STEP 5: Build the Project**

**Method A - Using Keyboard Shortcut (Easiest):**
- Press: **`Ctrl+Shift+B`** (Windows/Linux) or **`Cmd+Shift+B`** (Mac)

**Method B - Using Maven View:**
1. Click the **Maven** icon in the left sidebar
2. Expand: **bookhub → Lifecycle**
3. Click: **package**

**Method C - Using Terminal:**
1. Press: **`Ctrl+\``** (backtick) to open terminal
2. Run:
```bash
mvn clean package
```

**✅ Success indicator:** You should see "BUILD SUCCESS" in the output
**📦 Output file:** `target/bookhub.war` (about 24MB)

### **STEP 6: Deploy to Tomcat**

#### **Option A - Using Tomcat Extension (Recommended)**

1. **Add Tomcat Server (First Time Only):**
   - Press: `Ctrl+Shift+P`
   - Type: **"Tomcat: Add Tomcat Server"**
   - Browse to your Tomcat installation folder
   - Click **Select Folder**

2. **Start Tomcat:**
   - Look for **"Tomcat Servers"** in the Explorer sidebar
   - Right-click your Tomcat server
   - Click: **"Start Tomcat Server"**

3. **Deploy Application:**
   - In the Explorer, navigate to: `target/bookhub.war`
   - Right-click on `bookhub.war`
   - Select: **"Run on Tomcat Server"**

#### **Option B - Manual Deployment**

1. **Copy WAR file:**
   ```bash
   # Windows (adjust path to your Tomcat)
   copy target\bookhub.war C:\apache-tomcat-9.0.xx\webapps\
   
   # Linux/Mac
   cp target/bookhub.war $CATALINA_HOME/webapps/
   ```

2. **Start Tomcat:**
   ```bash
   # Windows
   C:\apache-tomcat-9.0.xx\bin\startup.bat
   
   # Linux/Mac
   $CATALINA_HOME/bin/startup.sh
   ```

### **STEP 7: Access the Application**

Open your web browser and go to:

🌐 **Main URL:** http://localhost:8080/bookhub/

**Other URLs:**
- Add Book: http://localhost:8080/bookhub/books/add
- View Books: http://localhost:8080/bookhub/books/view

---

## 🎯 Test the Application

1. Open: http://localhost:8080/bookhub/
2. Click: **"Add Book"**
3. Fill in the form:
   - **Title:** Clean Code
   - **Author:** Robert C. Martin
   - **Price:** 39.99
4. Click: **"Add Book"** button
5. You'll be redirected to **"View Books"** page
6. ✅ Your book should appear in the table!

---

## 🐛 Common Issues & Solutions

### ❌ **"Java extension is loading..."** (taking too long)
**Solution:** 
- Wait 2-3 minutes for first-time setup
- Check Java version: `java -version`
- Press `Ctrl+Shift+P` → "Java: Clean Java Language Server Workspace"

### ❌ **"mvn: command not found"**
**Solution:**
- Add Maven to your system PATH
- Or configure in VS Code settings: `maven.executable.path`

### ❌ **"Cannot connect to database"**
**Solution:**
1. Check MySQL is running: `mysql -u root -p`
2. Verify database exists: `SHOW DATABASES;`
3. Check credentials in `database.properties`

### ❌ **"Port 8080 is already in use"**
**Solution:**
- Stop other applications using port 8080
- Or change Tomcat port in `$CATALINA_HOME/conf/server.xml`:
  ```xml
  <Connector port="8081" protocol="HTTP/1.1" .../>
  ```
  Then access: http://localhost:8081/bookhub/

### ❌ **"404 Not Found" after deployment**
**Solution:**
1. Check Tomcat started successfully (no errors in logs)
2. Wait 30 seconds for deployment
3. Check WAR file is in `webapps/` folder
4. Try with trailing slash: http://localhost:8080/bookhub/

### ❌ **Build fails with errors**
**Solution:**
```bash
# Clean everything and rebuild
mvn clean install -U
```

---

## 📝 Daily Development Workflow

Once everything is set up, your typical workflow is:

1. **Open VS Code** → Open bookstore folder
2. **Edit code** → Make changes to Java/JSP files
3. **Build** → Press `Ctrl+Shift+B`
4. **Deploy** → Right-click WAR → "Run on Tomcat"
5. **Test** → Refresh browser
6. **Debug** → Set breakpoints, press F5

---

## ⌨️ Useful Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Build project | `Ctrl+Shift+B` |
| Open file quickly | `Ctrl+P` |
| Command palette | `Ctrl+Shift+P` |
| Open terminal | `` Ctrl+` `` |
| Go to definition | `F12` |
| Format code | `Shift+Alt+F` |
| Find in files | `Ctrl+Shift+F` |
| Toggle sidebar | `Ctrl+B` |

---

## 📚 Need More Help?

- **Quick setup:** Read `VSCODE-QUICKSTART.md`
- **Detailed guide:** Read `VSCODE-SETUP.md`
- **Troubleshooting:** Check the Troubleshooting section in `VSCODE-SETUP.md`
- **Project overview:** Read `README.md`

---

## 🎉 You're All Set!

Your BookHub application should now be running in VS Code! 

**Enjoy developing with:**
- ✅ IntelliSense & Auto-completion
- ✅ Visual Debugging
- ✅ One-click builds
- ✅ Maven integration
- ✅ Tomcat management

**Happy coding!** 🚀

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────┐
│  QUICK REFERENCE - BookHub in VS Code              │
├─────────────────────────────────────────────────────┤
│  📂 Open:      code .                               │
│  🔧 Build:     Ctrl+Shift+B                         │
│  🚀 Deploy:    Right-click WAR → Run on Tomcat      │
│  🌐 Access:    http://localhost:8080/bookhub/       │
│  🐛 Debug:     F5 (after remote debug config)       │
│  📝 Terminal:  Ctrl+`                               │
│  🔍 Find:      Ctrl+P (files) / Ctrl+Shift+F        │
└─────────────────────────────────────────────────────┘
```
