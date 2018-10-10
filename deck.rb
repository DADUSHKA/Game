class Deck
  CARD_VALUE = [10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  MAJOR_CARD = %w[V D K T]

  attr_reader :deck_cards

  def initialize
    @deck_cards = generate_cards
  end

  private

  def generate_cards
    (2..10).each { |i| MAJOR_CARD << i.to_s }
    int1 = MAJOR_CARD.map { |i| i + '♧'  }.zip(CARD_VALUE).to_h
    int2 = MAJOR_CARD.map { |i| i + '♤'  }.zip(CARD_VALUE).to_h.merge(int1)
    int3 = MAJOR_CARD.map { |i| i + '♥'  }.zip(CARD_VALUE).to_h.merge(int2)
    int4 = MAJOR_CARD.map { |i| i + '♦'  }.zip(CARD_VALUE).to_h.merge(int3)
    @deck_cards = int4.sort
  end
end
