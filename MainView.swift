import Cocoa

class MainView: NSView {
    
    var touchPoints: [CGPoint] = []
    var selectedRegion: CGRect?
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        let tabView = NSTabView(frame: self.bounds)
        tabView.addTabViewItem(NSTabViewItem(viewController: SettingsViewController()))
        tabView.addTabViewItem(NSTabViewItem(viewController: LiveFeedViewController()))
        addSubview(tabView)
    }
    
    func updateLiveFeed(with event: NSEvent) {
        let location = event.locationInWindow
        touchPoints.append(location)
        setNeedsDisplay(bounds)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.lightGray.setFill()
        bounds.fill()
        
        NSColor.red.setFill()
        for point in touchPoints {
            let rect = CGRect(x: point.x - 5, y: point.y - 5, width: 10, height: 10)
            NSBezierPath(ovalIn: rect).fill()
        }
        
        if let region = selectedRegion {
            NSColor.blue.setStroke()
            NSBezierPath(rect: region).stroke()
        }
    }
}
