class Card
  attr_reader :move_card_one, :move_card_two

  def initialize(deck)
    @deck_cards = deck
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
end
