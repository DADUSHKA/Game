module GameAssist
  private
  def handing_over_cards
    @user.start_game
    @assailant.start_game
    puts " #{@user.name}, игра началась!"
    long_1
    puts '        -->> Раздача карт-->>'
    long_3
    puts
    puts "   ! Карты розданы. !\n    :: #{@user.name}: #{@user.vieu_cards}
    :: #{@assailant.name}: ☺, ☺ ?"
    puts '            Ставки сделаны!'
    start_bank
  end

  def scoring
    validate!
    @user.open_cards
    @assailant.open_cards


    opponent_move if @assailant.open_cards.to_i < 17 &&  @assailant.on_hands.size == 2
    long_2


  end

  def add_cards
    @user.add_card
    puts "         -->> #{@user.view}-->>"
    p @assailant.open_cards
    opponent_move if @assailant.open_cards.to_i < 17
    open_cards
  end

  def open_cards
    puts '             Итоги игры:'
    message_game
    puts "      :: #{@user.name}: #{@user.vieu_cards}  - очки: #{@user.open_cards_validate}
      :: #{@assailant.name}: #{@assailant.vieu_cards}  - очки: #{@assailant.open_cards_validate} "
    bank
  end

  def start_bank
    @bank_assailant.bank_minus
    @bank_user.bank_minus
    @sum = 20
    bank
  end

  def bank
    puts "          Счет #{@user.name}:(₽#{@bank_user.bank})  ::  Cчет #{@assailant.name}:₽#{@bank_assailant.bank}"
    puts "          На кону: ₽#{@sum}"
  end

  def message_game
    message_lose
    message_won
    message_dead_heat
  end

  def message_lose
    you_lose if @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i > 21
    you_lose if @assailant.open_cards.to_i > @user.open_cards.to_i &&
                @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i < 21
  end

  def message_won
    you_won if @assailant.open_cards.to_i > 21 && @user.open_cards.to_i <= 21
    you_won if @assailant.open_cards.to_i < @user.open_cards.to_i &&
               @assailant.open_cards.to_i < 21 && @user.open_cards.to_i <= 21
  end

  def message_dead_heat
    dead_heat if @assailant.open_cards.to_i > 21 && @user.open_cards.to_i > 21
    dead_heat if @assailant.open_cards.to_i == @user.open_cards.to_i
  end

  def you_lose
    puts '          ☹ Вы проиграли ☹'
    @bank_user.bank
    @bank_assailant.bank_plus_two
    @sum = 0
  end

  def you_won
    puts '          ☺  Вы выиграли ☺'
    @bank_user.bank_plus_two
    @bank_assailant.bank
    @sum = 0
  end

  def dead_heat
    puts '          ☺  Ничья ☺'
    @bank_user.bank_plus_one
    @bank_assailant.bank_plus_one
    @sum = 0
  end

  def opponent_move
    puts "  -->> Ход #{@assailant.name}  --> * "
    @assailant.add_card
  end
end
