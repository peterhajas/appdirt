#!/usr/bin/swift
import Cocoa;class WindowDelegate : NSObject, NSWindowDelegate {    func windowWillClose(notification: NSNotification) {        NSApplication.sharedApplication().terminate(nil);    };};let windowDelegate = WindowDelegate();let styleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;let window = NSWindow(contentRect: CGRectMake(20, 20, 500, 500), styleMask:styleMask, backing:.Buffered, `defer`: false);window.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary;window.delegate = windowDelegate;let viewController = NSViewController();let view = NSView(frame: CGRectMake(0, 0, 500, 500));view.wantsLayer = true;viewController.view = view;let layer = view.layer!;window.contentViewController = viewController;window.makeKeyAndOrderFront(window); func run() { NSApplication.sharedApplication().run(); }

import WebKit

window.title = "Wikipedia"

let webView = WebView(frame: view.frame)
webView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
view.addSubview(webView)
let url = "http://en.wikipedia.org/wiki/Main_Page"
webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string:url)!))  

var windowFrame = window.frame
windowFrame.size.width = 900

window.setFrame(windowFrame, display: true)

run()
