class User < Player
  attr_reader :name

  def initialize(deck, name)
    super
  end

  def view
    @on_hands.last.first
  end
end
