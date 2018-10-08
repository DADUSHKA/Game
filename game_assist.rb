module GameAssist
  def scoring # подсчет с первой раздачи
    @user.open_cards_validate
    @assailant.open_cards_validate
    hod_compa
    long
    bank

  end

  def dobavit_karty
    @user.add_card
    puts "         -->> #{@user.view}"
    hod_compa
    otkrit_karti
  end

  def otkrit_karti
    puts '⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂'
    puts '             Итоги игры:'
    message_itogo
    puts "      :: #{@user.name}: #{@user.vieu_cards}  - очки: #{@user.open_cards}
      :: #{@assailant.name}: #{@assailant.vieu_cards}  - очки: #{@assailant.open_cards} "
    bank
    puts @koloda.deck_cards.size.to_s
    puts '⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂'
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

  def message_itogo
    if @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i > 21
      puts '   ☹  Вы проиграли'
      @bank_user.bank
      @bank_assailant.bank_plus_two
      @sum = 0
    end

    if @assailant.open_cards.to_i > @user.open_cards.to_i &&
        @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i < 21
      puts '   ☹  Вы проиграли'
      @bank_user.bank
      @bank_assailant.bank_plus_two
      @sum = 0
    end

    if @assailant.open_cards.to_i > 21 && @user.open_cards.to_i <= 21
      puts '    ☺ Вы выиграли'
      @bank_user.bank_plus_two
      @bank_assailant.bank
      @sum = 0
    end

    if @assailant.open_cards.to_i < @user.open_cards.to_i &&
        @assailant.open_cards.to_i < 21 && @user.open_cards.to_i <= 21
      puts '    ☺ Вы выиграли'
      @bank_user.bank_plus_two
      @bank_assailant.bank
      @sum = 0
    end

    if @assailant.open_cards.to_i > 21 && @user.open_cards.to_i > 21
      puts '    ☺ Ничия'
      @bank_user.bank_plus_one
      @bank_assailant.bank_plus_one
      @sum = 0
    end

    if @assailant.open_cards.to_i == @user.open_cards.to_i
      puts '    ☺ Ничия'
      @bank_user.bank_plus_one
      @bank_assailant.bank_plus_one
      @sum = 0
    end
  end

  def hod_compa
    puts "  -->> Ход #{@assailant.name}:   --> * " if @assailant.open_cards.to_i < 17
    @assailant.add_card if @assailant.open_cards.to_i < 17
    puts @bank_assailant.bank.to_s
  end

  def proverka_tyza; end
end
