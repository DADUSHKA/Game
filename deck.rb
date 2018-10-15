class Deck
  attr_reader :cards

  def initialize
    @cards = generate_cards
  end

  def card_selection(count)
    @cards.sample(count)
  end

  def generate_cards
    Card::CARD_SUITS.each_with_object([]) do |suit, a|
      Card::CARD_VALUES.each do |rank|
        a << Card.new(suit, rank)
      end
    end.shuffle!
end
end
