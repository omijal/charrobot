require_relative 'lib/services'
require 'kybus/logger'
Services.configure_services!

include Kybus::Logger


# $trace_out = open("trace.txt", 'w')
#
# set_trace_func proc { |event, file, line, id, binding, classname|
#   if event == 'call'
#     $trace_out.puts "#{file}:#{line} #{classname}##{id}"
#   end
# }

begin
  Thread.new { Services.bot.observe_contest }
  Services.bot.run
rescue StandardError => e
  puts e.message
  raise
end
