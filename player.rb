class Player
  attr_reader :name, :on_hands

  def initialize(deck, name = 'Antagonist')
    @name = name
    @deck = deck
  end

  def add_card
    @on_hands << @deck.move_card_one
  end

  def start_game
    @on_hands = @deck.move_card_two
  end

  def vieu_cards
    @p = []
    @on_hands.each { |i| @p << i.first }
    @p.join(' , ')
  end

  def open_cards_valid
    if @on_hands.last.last.to_i == 11 && open_cards > 21
      open_cards - 10
    else
      open_cards
    end
  end

  def open_cards
    @on_hands.inject(0) do |akm, i|
      akm += i.last
      akm
    end
  end
end
