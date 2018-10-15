class User < Player
  attr_reader :name

  def initialize(deck, name)
    super
  end
end
