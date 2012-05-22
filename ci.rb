require './notifier.rb'
require './build_monitor.rb'

if (ARGV.length < 2)
  puts "Specify the URL to cctray.xml file and a timeout"
  exit 1
end
period = ARGV[1].to_i
command = "curl -s -o cctray-out.xml #{ARGV[0]}"
signal = WebmailNotifierSignal.new
build = BuildMonitor.new(signal)

while (true) do 
  system(command)
  build.monitor('./cctray-out.xml')
  sleep(period)
end
