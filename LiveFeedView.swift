import Cocoa

class LiveFeedView: NSView {
    
    var touchPoints: [CGPoint] = []
    
    func update(with points: [CGPoint]) {
        touchPoints = points
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
    }
}
