import Cocoa

class SettingsViewController: NSViewController {
    
    var mouseRegionView: MouseRegionView!
    
    override func loadView() {
        view = NSView(frame: NSMakeRect(0, 0, 600, 400))
        
        mouseRegionView = MouseRegionView(frame: NSMakeRect(50, 50, 500, 300))
        view.addSubview(mouseRegionView)
        
        let saveButton = NSButton(title: "Save Settings", target: self, action: #selector(saveSettings))
        saveButton.frame = NSMakeRect(250, 10, 100, 30)
        view.addSubview(saveButton)
    }
    
    @objc func saveSettings() {
        // Save the selected region and other settings
        let region = mouseRegionView.selectedRegion
        UserDefaults.standard.set(NSStringFromRect(region ?? NSRect.zero), forKey: "mouseRegion")
    }
}
