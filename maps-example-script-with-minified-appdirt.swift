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
mapView.rotateEnabled = true

let location = CLLocationCoordinate2D(latitude:37.727, longitude:-122.761)
mapView.setCenterCoordinate(location, animated:true)
let origin = MKMapPointForCoordinate(location)
let sizeDimension: Double = 1000000
let size = MKMapSize(width: sizeDimension, height: sizeDimension)
let rect = MKMapRect(origin: origin, size: size)

mapView.setVisibleMapRect(rect, animated:true)

run()
