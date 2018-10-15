class Card
  CARD_SUITS = %w[♡ ♧ ♢ ♤]
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  DEFAULT_VALUE = 10
  ACE_VALUE = 11

  attr_reader :suit, :value, :point

  def initialize(suit, value)
    @suit = suit
    @value = value
    @point = point
  end

  def point
    if %w[J Q K].include? @value
      DEFAULT_VALUE
    elsif @value == 'A'
      ACE_VALUE
    else
      @value.to_i
    end
 end
end
