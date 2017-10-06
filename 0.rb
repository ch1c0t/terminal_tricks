def write_escape_codes codes
  codes.each { |code| $stdout.write "\e[#{code}" }
end

clear_screen = '2J'
move_to_top_left_corner = '1;1H'

write_escape_codes [clear_screen, move_to_top_left_corner]
sleep 2

# '3A' move three lines up
# '3C' move right three characters
# '3B' move down three lines
# '4D' move back four characters

codes = [
  's', # save cursor position
  '1;4H', # move to line 1, character 4
  'u' # restore cursor position
]

puts 'onez'
puts 'twos'
puts 'threes'

write_escape_codes ['s', '1;4H']

sleep 2

puts 's'
sleep 2

write_escape_codes ['u']
sleep 2

write_escape_codes [clear_screen]
