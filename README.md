**Magic Mouse Middle Click App**
================================

This macOS application adds middle-click functionality to the Apple Magic Mouse. It allows you to define custom regions on the mouse for middle-click actions and provides a live feed of touch input.

**Features**

-   **Customizable Click Regions:** Select areas on your Magic Mouse for middle-click actions.
-   **Live Feed:** View real-time touch input from your Magic Mouse.
-   **Native macOS Look:** Seamless integration with macOS interface design.

**Requirements**

-   macOS Catalina (10.15) or later
-   Xcode 12.x or macOS Command Line Tools

**Installation**

There are two installation options:

**Option 1: Using Xcode**

1.  Download and install Xcode 12.x from the Apple Developer site.
2.  Clone or download the project.
3.  Open the `.xcodeproj` file in Xcode.
4.  Click **Run** (`Cmd + R`) to build and run the app.

**Option 2: Using Command Line Tools**

1.  Install Command Line Tools via `xcode-select --install`.
2.  Clone or download the project.
3.  Navigate to the project directory in Terminal.
4.  Compile and run the app:

```bash
swiftc -o MagicMouseApp *.swift
./MagicMouseApp

```

Use code [with caution.](/faq#coding)

**Usage**

-   **Settings Tab:** Define custom regions on your Magic Mouse by clicking and dragging. These regions will trigger middle-click actions.
-   **Live Feed Tab:** See real-time feedback of touch input on your Magic Mouse.
-   **Save Settings:** After configuring, click "Save Settings" to store your preferences.

**Troubleshooting**

-   **Accessibility Permissions:** If the app doesn't capture mouse events, go to System Preferences > Security & Privacy > Privacy > Accessibility and allow the app access.

**License**

This project is open-source and available under the MIT License. Feel free to modify and distribute as per the license terms.

**Contributing**

Contributions are welcome! Open a pull request or issue to suggest improvements or report bugs.

This version uses Markdown formatting for headings, lists, and code blocks. It should render correctly when viewed on platforms like GitHub.
