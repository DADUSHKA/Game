class User < Player
  def initialize(name, deck)
   super
  end

  def view
    @on_hands.last.first
  end
end
