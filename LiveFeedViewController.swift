import Cocoa

class LiveFeedViewController: NSViewController {
    
    var liveFeedView: LiveFeedView!
    
    override func loadView() {
        view = NSView(frame: NSMakeRect(0, 0, 600, 400))
        
        liveFeedView = LiveFeedView(frame: NSMakeRect(50, 50, 500, 300))
        view.addSubview(liveFeedView)
    }
}
