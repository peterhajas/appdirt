#!/usr/bin/swift
import Cocoa; class WindowDelegate : NSObject, NSWindowDelegate { func windowWillClose() { NSApplication.shared().terminate(nil) } }; let windowDelegate = WindowDelegate(); let styleMask: NSWindowStyleMask = [NSTitledWindowMask, NSClosableWindowMask, NSMiniaturizableWindowMask, NSResizableWindowMask]; let windowFrame = CGRect(x: 20, y: 20, width: 500, height: 500); let window = NSWindow(contentRect: windowFrame, styleMask:styleMask, backing:.buffered, defer: false); window.collectionBehavior = NSWindowCollectionBehavior.fullScreenPrimary; window.delegate = windowDelegate; let viewController = NSViewController(); let viewFrame = CGRect(origin: CGPoint.zero, size: windowFrame.size); let view = NSView(frame: viewFrame); view.wantsLayer = true; viewController.view = view; let layer = view.layer!; if #available(macOS 10.10, *) { window.contentViewController = viewController }; window.makeKeyAndOrderFront(window); func run() { NSApplication.shared().run() }; 

import WebKit

window.title = "Wikipedia"

let webView = WebView(frame: view.frame)
webView.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
view.addSubview(webView)
let url = "http://en.wikipedia.org/wiki/Main_Page"
webView.mainFrame.load(URLRequest(url: URL(string:url)!))  

window.setFrame(windowFrame, display: true)

run()
