class Deck
  attr_reader :deck_cards

  def initialize
    @deck_cards = generate_cards
  end

   def move_card_one
    p = @deck_cards.size
    i = rand(p)
    @deck_cards[i]
  end

  def move_card_two
    arr = []
    2.times { arr << move_card_one }
    arr
  end

  private

  def generate_cards
    (2..10).each { |i| Card::MAJOR_CARD << i.to_s }
    int1 = Card::MAJOR_CARD.map { |i| i + '♧'  }.zip(Card::CARD_VALUE).to_h
    int2 = Card::MAJOR_CARD.map { |i| i + '♤'  }.zip(Card::CARD_VALUE).to_h.merge(int1)
    int3 = Card::MAJOR_CARD.map { |i| i + '♥'  }.zip(Card::CARD_VALUE).to_h.merge(int2)
    int4 = Card::MAJOR_CARD.map { |i| i + '♦'  }.zip(Card::CARD_VALUE).to_h.merge(int3)
    @deck_cards = int4.sort
  end
end
