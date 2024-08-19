import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main application window
        let screenSize = NSScreen.main?.frame ?? NSMakeRect(0, 0, 800, 600)
        let windowSize = NSMakeRect(screenSize.width / 4, screenSize.height / 4, 600, 400)
        
        window = NSWindow(contentRect: windowSize,
                          styleMask: [.titled, .closable, .resizable, .miniaturizable],
                          backing: .buffered, defer: false)
        
        window.title = "Magic Mouse Middle Click App"
        window.makeKeyAndOrderFront(nil)
        
        // Set the content view to an empty view initially or your main view
        window.contentView = MainView(frame: window.contentRect(forFrameRect: windowSize))
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
