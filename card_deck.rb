class CardDeck
  def initialize
    int = [10, 10, 10, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    deck = %w[V D K T]
    (2..10).each { |i| deck << i.to_s }
    deck1 = deck.map { |i| i + '♧'  }.zip(int).to_h
    deck2 = deck.map { |i| i + '♤'  }.zip(int).to_h.merge(deck1)
    deck3 = deck.map { |i| i + '♥'  }.zip(int).to_h.merge(deck2)
    deck4 = deck.map { |i| i + '♦'  }.zip(int).to_h.merge(deck3)
    @deck_cards = deck4.sort
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
