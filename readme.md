# `appdirt`
## Make command line Swift apps easily

`appdirt` is a small chunk of code that can be used to quickly bootstrap a Cocoa app that can be run from the command line, like a shell script.

Using `appdirt`, you can build quick little apps like scripts. Just include the code (see the section below on minified `appdirt`) at the top of your script, and write the rest yourself. `appdirt` exposes some constants of the app it bootstraps to make things easy to get started with.

### What's in `appdirt`?

#### Runs without using a call to the `swift` REPL

`appdirt` is prefixed with `#!/usr/bin/swift` to allow the script to run directly with:

    $ ./your_script

Note that you may have to `chmod a+x your_script` to get it to run.

#### Local Constants

 - `window` - an `NSWindow` with standard window controls. Closing the window with the close control will automatically close the script. This window supports fullscreen and split view
 - `viewController` - an `NSViewController` as the `contentViewController` of `window`
 - `view` - an `NSView` managed by `viewController`. It's configured to `wantsLayer`
 - `layer` - the `CALayer` acting as the backing store of `view`

### Using minified `appdirt`

To help with brevity in your script, a minified version of `appdirt` is provided as `appdirt-minified.swift`. This provides a drop-in set of lines - condensed as much as possible - for you to use in your script. It exposes a `run()` function which can be used to start the `NSApplication` event loop. This is called at the end of `appdirt-minified.swift`.

### Using `appdirt`

Most scripts will want to use the minified version of `appdirt` - see the section above.

To use un-minified `appdirt`, copy the contents of `appdirt.swift` into your script. At the end of your script, call `NSApplication.sharedApplication().run()` to start the `NSApplication` event loop.

### Licensing

See `license.md`.

