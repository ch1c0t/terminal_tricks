Keyboard = Enumerator.new do |y|
  sequence = String.new

  sequences_of_size = {
    1 => {
      "\r": :enter,
      "\t": :tab
    },
    2 => {
    }
  }
  end

  loop do
    sequence << STDIN.getch

    unless sequence.size == 1 && sequence =~ /[[:print:]]/
      next unless sequences_of_size[sequence.size].find {|k, _| k == sequence}
    end

    y << sequence; sequence.clear
  end
end
