#!/usr/bin/swift
import Cocoa

class WindowDelegate : NSObject, NSWindowDelegate {
    func windowWillClose() {
        NSApplication.shared().terminate(nil)
    }
}
let windowDelegate = WindowDelegate()
let styleMask: NSWindowStyleMask = [NSTitledWindowMask, NSClosableWindowMask, NSMiniaturizableWindowMask, NSResizableWindowMask]
let windowFrame = CGRect(x: 20, y: 20, width: 500, height: 500)
let window = NSWindow(contentRect: windowFrame, styleMask:styleMask, backing:.buffered, defer: false)
window.collectionBehavior = NSWindowCollectionBehavior.fullScreenPrimary
window.delegate = windowDelegate
let viewController = NSViewController()
let viewFrame = CGRect(origin: CGPoint.zero, size: windowFrame.size)
let view = NSView(frame: viewFrame)
view.wantsLayer = true
viewController.view = view
let layer = view.layer!
if #available(macOS 10.10, *) {
    window.contentViewController = viewController
}
window.makeKeyAndOrderFront(window)

func run() {
    NSApplication.shared().run()
}

// Your script goes here

// Call this to start the script
// run()
