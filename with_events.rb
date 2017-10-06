require 'io/console'
require 'io/wait'

STDIN.raw do |io|
  last_read = Time.now
  prompted   = false

  loop do
    char = io.ready? && io.sysread(1)

    if char
      last_read = Time.now
      prompted  = false
      print "You typed: #{char.inspect}\r\n"
      break if char == ?q
    else
      if !prompted && Time.now - last_read > 3
        print "Please type a character.\r\n"
        prompted = true
      end
      sleep 0.1
    end
  end
end
