import Cocoa

class MouseRegionView: NSView {
    
    var selectedRegion: CGRect?
    var startPoint: CGPoint?
    
    override func mouseDown(with event: NSEvent) {
        startPoint = event.locationInWindow
    }
    
    override func mouseDragged(with event: NSEvent) {
        guard let startPoint = startPoint else { return }
        let currentPoint = event.locationInWindow
        selectedRegion = CGRect(x: min(startPoint.x, currentPoint.x),
                                y: min(startPoint.y, currentPoint.y),
                                width: abs(currentPoint.x - startPoint.x),
                                height: abs(currentPoint.y - startPoint.y))
        setNeedsDisplay(bounds)
    }
    
    override func mouseUp(with event: NSEvent) {
        // Finalize the region
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.lightGray.setFill()
        bounds.fill()
        
        if let region = selectedRegion {
            NSColor.blue.setStroke()
            NSBezierPath(rect: region).stroke()
        }
    }
}
