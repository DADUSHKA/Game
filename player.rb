require_relative 'deck'
require_relative 'card'
class Player
  attr_reader :name, :hands

  def initialize(deck, name = 'Antagonist')
    @name = name
    @deck = deck
    @hands = []
  end

  def start_game
    @hands.clear
    add_card(2)
  end

  def add_card(count)
    @hands.concat(@deck.move_card(count))
  end

  def view_cards
    var = []
    @hands.each do |obj|
      var << "#{obj.suit + ' ' + obj.value} "
    end
    var.join(' , ')
  end

  def counting_point
    @var = 0
    @hands.each do |obj|
      @var += obj.point.to_i
    end
    @var
  end

  def counting_point_validate
    counting_point
    if @hands.last.point == 11 && @var >= 25
      @var -= 10
    else
      @var
    end
  end
end
