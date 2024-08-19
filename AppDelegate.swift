import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the main window and set up the views
        let contentView = MainView(frame: NSMakeRect(0, 0, 600, 400))
        window = NSWindow(contentRect: NSMakeRect(0, 0, 600, 400),
                          styleMask: [.titled, .closable, .resizable],
                          backing: .buffered, defer: false)
        window.contentView = contentView
        window.makeKeyAndOrderFront(nil)
        
        NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved, .leftMouseDown, .rightMouseDown]) { event in
            contentView.updateLiveFeed(with: event)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
