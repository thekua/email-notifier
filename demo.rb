require './notifier.rb'

notifier = EmailNotifier.new
#colours = [RED, GREEN, BLUE, WHITE, OFF]
colours = [RED, GREEN]
while (true) do
  colours.each do | colour | 
    notifier.colour! colour
    sleep(3)
  end
end
