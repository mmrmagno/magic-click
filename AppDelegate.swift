import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main application window
        let windowSize = NSMakeRect(0, 0, 600, 400)
        window = NSWindow(contentRect: windowSize,
                          styleMask: [.titled, .closable, .resizable, .miniaturizable],
                          backing: .buffered, defer: false)
        
        window.title = "Magic Mouse Middle Click App"
        window.center() // Ensure the window is centered on the screen
        window.makeKeyAndOrderFront(nil) // Make the window key and frontmost
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up code here
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
