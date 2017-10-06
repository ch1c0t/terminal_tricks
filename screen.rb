require 'forwardable'

class Screen
  def initialize
    @lines = []
  end

  extend Forwardable
  delegate [:[]=, :clear] => :@lines

  def update
    escape '2J'   # clear
    escape '1;1H' # move to the top left corner
    print @lines.join "\r\n"
  end

  def escape code
    print "\e[#{code}"
  end
end
