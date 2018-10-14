class Player

WIN_SCORE = 21
  DEFAULT_VALUE = 10
  ACE_MIN_VALUE = 1
  ACE_MAX_VALUE = 11

  attr_reader :name, :hands

  def initialize(deck, name = 'Antagonist')
    @name = name
    @deck = deck
    @hands = []
  end

  def add_one_card
    @hands.concat(@deck.move_card_one)
  end

  def add_two_card
    @hands.clear unless @hands.empty?
    @hands.concat(@deck.move_card_two)
  end




  def view_cards
    var = []
    @hands.each do |obj|
      var << "#{obj.suit+' '+ obj.value} "
    end
    var.join(' , ')
  end

  def open_cards_valid
    total_score = 0
    ace_count = 0
    @hands.each do |card|
      ace_count += ACE_MIN_VALUE if card.value == 'A'
      total_score += get_card_score(card)
    end
    add_additional_ace_score(total_score, ace_count)
  end


  private


   def add_additional_ace_score(total_score, ace_count)
    ace_count.times do
      ace_score = ACE_MAX_VALUE - ACE_MIN_VALUE
      total_score += ace_score if total_score + ace_score <= WIN_SCORE + 5
    end
    total_score
  end

  def get_card_score(card)
    if %w(J Q K).include? card.value
      DEFAULT_VALUE
    elsif card.value == 'A'
      ACE_MAX_VALUE
    else
      card.value.to_i
    end
  end


  # def vieu_cards
  #   @p = []
  #   @on_hands.each { |i| @p << i.first }
  #   @p.join(' , ')
  # end

  # def open_cards_valid
  #   if @on_hands.last.last.to_i == 11 && open_cards > 21
  #     open_cards - 10
  #   else
  #     open_cards
  #   end
  # end

  # def open_cards
  #   @on_hands.inject(0) do |akm, i|
  #     akm += i.last
  #     akm
  #   end
  # end












end
