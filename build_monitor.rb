require 'rexml/document'

class ASignal
  def notify_failure(value)
    puts "failure: #{value}"
  end
end

class WebmailNotifierSignal
  def initialize
    @notifier = EmailNotifier.new
  end
 
  def notify_failure(value)
    if (value) 
      @notifier.colour! RED
    else 
      @notifier.colour! GREEN
    end
  end

  def shutdown
      @notifier.colour! OFF
  end
end

class BuildMonitor
  def initialize(signal)
    @signal = signal;
  end

  def monitor(file)
    xml = File.read(file)
    doc = REXML::Document.new(xml)
    elements = REXML::XPath.match( doc, "//Project[@lastBuildStatus='Failure']")
    
    failed = !elements.empty?
    @signal.notify_failure(failed)
  end
end


