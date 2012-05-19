Email Notifier
==============

This [project](http://cweiske.de/tagebuch/usblamp-monitoring.htm) insprired this ruby version of code. I heavily
used the work from the [linux drivers](https://github.com/daniel-git/usblamp) to find out how to interact
with the USB lamp.

Installation
------------

Install the following dependencies:

 + [libusb](http://www.libusb.org/) - The core C drivers that give access to USB devices
 + [libusb ruby bindings](http://rubydoc.info/gems/libusb/frames) - Note this library is different from the _[ruby-usb](http://www.a-k-r.org/ruby-usb/)_ bindings

  (brew install libusb)
 +

Usage
-----

`require './notifier.rb'`
`notifier = EmailNotifier.new`
`notifier.colour! RED`

Issues
------

Report issues [here](https://github.com/thekua/email-notifier)

License
-------

Open sourced under the MIT license