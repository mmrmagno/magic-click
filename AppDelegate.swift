import Cocoa
import ApplicationServices

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Check if the app has accessibility permissions
        if !AXIsProcessTrusted() {
            showAccessibilityAlert()
        } else {
            setupMainWindow()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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
