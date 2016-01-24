#!/usr/bin/swift
import Cocoa;class WindowDelegate : NSObject, NSWindowDelegate {    func windowWillClose(notification: NSNotification) {        NSApplication.sharedApplication().terminate(nil);    };};let windowDelegate = WindowDelegate();let styleMask = NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask;let window = NSWindow(contentRect: CGRectMake(20, 20, 500, 500), styleMask:styleMask, backing:.Buffered, `defer`: false);window.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary;window.delegate = windowDelegate;let viewController = NSViewController();let view = NSView(frame: CGRectMake(0, 0, 500, 500));view.wantsLayer = true;viewController.view = view;let layer = view.layer!;window.contentViewController = viewController;window.makeKeyAndOrderFront(window); func run() { NSApplication.sharedApplication().run(); }

import MapKit
import CoreLocation

window.title = "Map"

let mapView = MKMapView(frame: view.frame)
mapView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
view.addSubview(mapView)

mapView.showsZoomControls = true
mapView.showsCompass = true

let latitude = 37.727
let longitude = -122.761

mapView.setVisibleMapRect(MKMapRect(origin: MKMapPointForCoordinate(CLLocationCoordinate2D(latitude:latitude, longitude:longitude)), size: MKMapSize(width: 1000000, height: 1000000)), animated:true)

run()
