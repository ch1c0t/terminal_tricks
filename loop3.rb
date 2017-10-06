require 'io/console'

require './screen'

screen = Screen.new
query  = String.new

loop do
  char = STDIN.getch

  if char =~ /[[:print:]]/
    query << char
  else
    case char
    when "\u0011" # C-q
      exit
    when "\u0015" # C-u
      query.clear
    when "\t"
      showing = :autocompletions
    when "\r"
      showing = :sentences
    end
  end

  screen.clear
  screen[0] = query
  screen[3..6] = [query*1,query*2,query*3,query*4]
  screen.update
end
