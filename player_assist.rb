module PlayerAssist
  def add_card
    @on_hands << @kol.move_card_one
  end

  def start_game
    @on_hands = @kol.move_card_two
  end

  def vieu_cards
    @p = []
    @on_hands.each { |i| @p << i.first }
    @p.join(' , ')
  end

  def open_cards_validate
    open_cards
    @p.to_i - 10 if @on_hands.last.last.to_i == 11 && @p.to_i > 21
    @p
  end

  def open_cards
    @p = 0
    @on_hands.each { |i| @p += i.last }
    @p
  end
end
