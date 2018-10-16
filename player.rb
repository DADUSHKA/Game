class Player
  attr_accessor :cards_on_hands
  attr_reader :name

  def initialize(name = 'Antagonist')
    @name = name
    @cards_on_hands = nil
  end

  def view_cards
    var = []
    @cards_on_hands.each do |obj|
      var << "#{obj.suit + ' ' + obj.value} "
    end
    var.join(' , ')
  end

  def counting_point_validate
    counting_point
    if @cards_on_hands.last.point == 11 && @var >= 25
      @var -= 10
    else
      @var
    end
  end

  def counting_point
    @var = 0
    @cards_on_hands.each do |obj|
      @var += obj.point.to_i
    end
    @var
  end
end
