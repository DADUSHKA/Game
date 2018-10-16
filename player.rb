class Player
  attr_reader :name, :card_table

  def initialize(deck, name = 'Antagonist')
    @name = name
    @deck = deck
    @card_table = []
  end

  def start_game
    @card_table.clear
    add_card(2)
  end

  def add_card(count)
    (@card_table << @deck.card_selection(count)).flatten!
  end

  def view_cards
    var = []
    @card_table.each do |obj|
      var << "#{obj.suit + ' ' + obj.value} "
    end
    var.join(' , ')
  end

  def counting_point_validate
    counting_point
    if @card_table.last.point == 11 && @var >= 25
      @var -= 10
    else
      @var
    end
  end

  def counting_point
    @var = 0
    @card_table.each do |obj|
      @var += obj.point.to_i
    end
    @var
  end

end
