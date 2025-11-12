# VS Code Configuration

This directory contains Visual Studio Code configuration files for the BookHub project.

## Files

- **settings.json**: Project-specific settings for Java, Maven, formatting, and file associations
- **extensions.json**: Recommended VS Code extensions for Java/Spring development
- **launch.json**: Debug configurations for running and debugging the application
- **tasks.json**: Build and deployment tasks for Maven and Tomcat

## Quick Setup

1. Open this project folder in VS Code
2. When prompted, install the recommended extensions
3. Press `Ctrl+Shift+B` to build the project
4. Deploy the generated WAR file to Tomcat

For detailed setup instructions, see [VSCODE-SETUP.md](../VSCODE-SETUP.md) in the project root.

## Extension Requirements

The following extensions are required:
- Extension Pack for Java
- Spring Boot Extension Pack
- Tomcat for Java
- XML Language Support

## Debugging

To debug the application:
1. Configure Tomcat for remote debugging (JPDA mode)
2. Press F5 and select "Remote Debug Tomcat"
3. Set breakpoints in your code
4. Interact with the application to trigger breakpoints

For more details, see the debugging section in [VSCODE-SETUP.md](../VSCODE-SETUP.md).
