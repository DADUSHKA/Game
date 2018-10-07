require_relative 'card_deck'

class User
  include PlayerAssist

  attr_reader :name, :on_hands

  def initialize(name, koloda)
    @name = name
    @kol = koloda
  end

  def view
    @on_hands.last.first
  end
end
