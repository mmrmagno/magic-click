import Cocoa
import ApplicationServices

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Debugging print to check if the app is launching properly
        print("Application Did Finish Launching")
        
        // Check if the app has accessibility permissions
        if !AXIsProcessTrusted() {
            print("Accessibility permissions not granted. Showing alert.")
            showAccessibilityAlert()
        } else {
            print("Accessibility permissions granted. Setting up the main window.")
            setupMainWindow()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        print("Application Will Terminate")
    }

    // Function to set up the main application window
    func setupMainWindow() {
        let windowSize = NSMakeRect(0, 0, 600, 400)
        
        window = NSWindow(contentRect: windowSize,
                          styleMask: [.titled, .closable, .resizable, .miniaturizable],
                          backing: .buffered, defer: false)
        
        window.title = "Magic Mouse Middle Click App"
        window.center() // Ensure the window is centered on the screen
        window.makeKeyAndOrderFront(nil) // Make the window key and frontmost

        // Debugging print to check if the window was created
        print("Main window should now be visible.")
    }

    // Function to show an alert dialog if accessibility permissions are missing
    func showAccessibilityAlert() {
        let alert = NSAlert()
        alert.messageText = "Accessibility Permissions Required"
        alert.informativeText = "This app requires accessibility permissions to function correctly. Please enable these permissions in System Preferences > Security & Privacy > Privacy > Accessibility."
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        
        alert.runModal()

        // Open the System Preferences app to the Privacy > Accessibility section
        let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
        NSWorkspace.shared.open(url)
        
        // Quit the app to allow the user to adjust permissions
        NSApplication.shared.terminate(self)
    }
}
