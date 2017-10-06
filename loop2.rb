require 'io/console'

require './keyboard'
require './screen'

screen = Screen.new
query  = String.new

keyboard = Keyboard.new do
  on [:ctrl, ?q] do break end
  on [:ctrl, ?u] do query.clear end
end

loop do
  action = keyboard.next

  if action.printable?
    query << action.to_s
  else
  end
  if action.char =~ /[[:print:]]/
    query << char
  else
    case char
    when "\u0011" # C-q
      break
    when "\u0015" # C-u
      query.clear
    end
  end

  screen.clear
  screen[0] = query
  screen[3..6] = [query*1,query*2,query*3,query*4]
  screen.update
end
