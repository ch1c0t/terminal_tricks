class FSM
  def initialize
    @tree = Hash.new { |hash, _key| hash }
  end

  def [] transition
    @pointer = (@pointer or @tree)[transition]
  end

  def state
    @pointer.value
  end

  def add_sequence sequence
  end

  class State < Hash
  end
end
