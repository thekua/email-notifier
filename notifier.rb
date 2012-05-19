require 'libusb'

class Colour
  attr_reader :red, :green, :blue

  def initialize(red, green, blue)
     @red = red
     @green = green
     @blue = blue
  end

  def hex_string
    hexify(@red, @green, @blue)
  end

  def max_val
    [@red, @green, @blue].max
  end

  private

  def hexify(*items)
    items.collect! { |x| x.chr }.join
  end
end

WHITE = Colour.new(255, 255, 255)
RED = Colour.new(255, 0, 0)
GREEN = Colour.new(0, 255, 0)
BLUE = Colour.new(0, 0, 255)
OFF = Colour.new(0, 0, 0)

class EmailNotifier
  def initialize
    usb_context = LIBUSB::Context.new
    @device = usb_context.devices(:idVendor => 0x1d34).first
    reset_device
  end

  def colour!(colour)
    @colour = colour
    send(colour.hex_string + "\x00\x00\x00\x00\x05")
  end

  alias :colour :colour!

  def turn_off
    set_colour(Colour.new(0, 0, 0))
  end

  private
  def send(data)
    @device.open do |handle|
      handle.control_transfer(:bmRequestType => 33, :bRequest => 0x09, :wValue => 0x200, :wIndex => 0x00, :dataOut => data)
    end
  end

  def reset_device
    send "\x1f\x02\x00\x2e\x00\x00\x2b\x03"
    send "\x00\x02\x00\x2e\x00\x00\x2b\x04"
    send "\x00\x00\x00\x2e\x00\x00\x2b\x05"
  end
end


