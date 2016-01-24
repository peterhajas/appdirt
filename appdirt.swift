import Cocoa

class WindowDelegate : NSObject, NSWindowDelegate {
    func windowWillClose(notification: NSNotification) {
        NSApplication.sharedApplication().terminate(nil)
    }
}
let windowDelegate = WindowDelegate()
let styleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask
let window = NSWindow(contentRect: CGRectMake(20, 20, 500, 500), styleMask:styleMask, backing:.Buffered, `defer`: false)
window.delegate = windowDelegate
let viewController = NSViewController()
let view = NSView(frame: CGRectMake(0, 0, 500, 500))
view.wantsLayer = true
viewController.view = view
let layer = view.layer!
window.contentViewController = viewController
window.makeKeyAndOrderFront(window)


/* Your script goes here */


/* Call this to start the script */
/* NSApplication.sharedApplication().run() */
