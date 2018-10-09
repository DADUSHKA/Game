class Assailant
  include PlayerAssist

  attr_reader :name, :on_hands

  def initialize(deck)
    @name = 'Compute'
    @deck = deck
  end
end
