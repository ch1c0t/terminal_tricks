require 'io/console'

loop do
  char = $stdin.getch
  p char
  puts "You typed: #{char.inspect}."
  puts
  break if char == ?q
end
