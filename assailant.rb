require_relative 'card_deck'

class Assailant
  include PlayerAssist

  attr_reader :name, :on_hands

  def initialize(koloda)
    @name = 'Compute'
    @kol = koloda
  end
end
