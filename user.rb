class User
  include PlayerAssist

  attr_reader :name, :on_hands

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def view
    @on_hands.last.first
  end
end
