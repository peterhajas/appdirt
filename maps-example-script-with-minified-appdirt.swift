#!/usr/bin/swift
import Cocoa; class WindowDelegate : NSObject, NSWindowDelegate { func windowWillClose() { NSApplication.shared().terminate(nil) } }; let windowDelegate = WindowDelegate(); let styleMask: NSWindowStyleMask = [NSTitledWindowMask, NSClosableWindowMask, NSMiniaturizableWindowMask, NSResizableWindowMask]; let windowFrame = CGRect(x: 20, y: 20, width: 500, height: 500); let window = NSWindow(contentRect: windowFrame, styleMask:styleMask, backing:.buffered, defer: false); window.collectionBehavior = NSWindowCollectionBehavior.fullScreenPrimary; window.delegate = windowDelegate; let viewController = NSViewController(); let viewFrame = CGRect(origin: CGPoint.zero, size: windowFrame.size); let view = NSView(frame: viewFrame); view.wantsLayer = true; viewController.view = view; let layer = view.layer!; if #available(macOS 10.10, *) { window.contentViewController = viewController }; window.makeKeyAndOrderFront(window); func run() { NSApplication.shared().run() }; 

import MapKit
import CoreLocation

window.title = "Map"

let mapView = MKMapView(frame: view.frame)
mapView.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
view.addSubview(mapView)

mapView.showsZoomControls = true
mapView.showsCompass = true

let latitude = 37.727
let longitude = -122.761

mapView.setVisibleMapRect(MKMapRect(origin: MKMapPointForCoordinate(CLLocationCoordinate2D(latitude:latitude, longitude:longitude)), size: MKMapSize(width: 1000000, height: 1000000)), animated:true)

run()
