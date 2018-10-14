class Card
attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  CARD_SUITS = %w(♡ ♧ ♢ ♤)
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

end
