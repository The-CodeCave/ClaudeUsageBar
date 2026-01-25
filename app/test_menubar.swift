import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        print("App launched!")
        statusItem = NSStatusBar.system.statusItem(withLength: 100)
        print("Status item created: \(statusItem != nil)")

        if let button = statusItem.button {
            button.title = "TEST 🟢"
            print("Button title set!")
        } else {
            print("Button is nil!")
        }
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.setActivationPolicy(.accessory)
print("Starting app...")
app.run()
