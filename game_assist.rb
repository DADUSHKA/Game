module GameAssist
  def scoring # подсчет с первой раздачи
    @user.open_cards
    @assailant.open_cards
    hod_compa
    otkrit_karti
  end

  def dobavit_karty
    @user.add_card
    puts "         -->> #{@user.view}"
    hod_compa
    otkrit_karti
  end

  def otkrit_karti
    puts "      :: #{@user.name}: #{@user.vieu_cards}  - очки: #{@user.open_cards}
         :: #{@assailant.name}: #{@assailant.vieu_cards}  - очки: #{@assailant.open_cards} "
    message_itogo
    puts "Банк: #{@bank_user.bank}     #{@bank_assailant.bank}"
    puts @koloda.deck_cards.size.to_s
  end

  def cold_clear
    @koloda = CardDeck.new if @koloda.deck_cards.size < 40
  end

  def message_itogo
    return puts '   ☹  Вы проиграли' if
    @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i > 21

    @bank_user.bank_minus
    @bank_assailant. bank_plus
    return puts '   ☹  Вы проиграли' if
    @assailant.open_cards.to_i > @user.open_cards.to_i &&
    @assailant.open_cards.to_i <= 21 && @user.open_cards.to_i < 21

    @bank_user.bank_minus
    @bank_assailant. bank_plus
    return puts '    ☺ Вы выиграли' if
    @assailant.open_cards.to_i > 21 && @user.open_cards.to_i <= 21

    @bank_user.bank_plus
    @bank_assailant. bank_minus
    return puts '    ☺ Вы выиграли' if
    @assailant.open_cards.to_i < @user.open_cards.to_i &&
    @assailant.open_cards.to_i < 21 && @user.open_cards.to_i <= 21

    @bank_user.bank_plus
    @bank_assailant. bank_minus
    return puts '    ☺ Ничия' if
    @assailant.open_cards.to_i > 21 && @user.open_cards.to_i > 21

    @bank_user.bank
    @bank_assailant. bank
    return puts '    ☺ Ничия' if
    @assailant.open_cards.to_i == @user.open_cards.to_i

    @bank_user.bank
    @bank_assailant. bank
  end

  def hod_compa
    puts "  -->> Ход #{@assailant.name}:" if @assailant.open_cards.to_i < 17
    @assailant.add_card if @assailant.open_cards.to_i < 17
    # p @assailant.add_card.last.last.to_i == 11 && @assailant.open_cards.to_i > 10
  end

  def proverka_tyza; end
end
