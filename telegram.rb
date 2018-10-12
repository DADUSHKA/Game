class TelegramInterface
  def welcome
    puts "Приветствую Вас в игре BlackJack! \n
        Чтобы начать игру введите Ваше имя:"
  end

  def doing_one(var)
    puts "  Ваши #{var} действия :
              1 - Пропустить ход
              2 - Добавить карту
              3 - Открыть карты"
  end

  def doing_two(var)
    puts "  Ваши #{var} действия :
              4 - Продолжить игру
              9 - Выйти"
  end

  def you_lose
    puts '          ☹ Вы проиграли ☹'
  end

  def you_won
    puts '          ☺  Вы выиграли ☺'
  end

  def dead_heat
    puts '          ☺  Ничья ☺'
  end

  def opponent_move(var)
    puts "  -->> Ход #{var}  --> * "
  end

  def handing_over_cards(var1, var2, var3)
    puts " #{var1}, игра началась!"
    long_1
    puts '        -->> Раздача карт-->>'
    long_3
    puts
    puts "          ! Карты розданы. !\n         :: #{var1}: #{var2}
         :: #{var3}: ☺, ☺ ?"
    puts '            Ставки сделаны!'
  end

  def pause
    puts "Продолжить: нажать 'Enter' "
    gets
  end

  def command
    puts 'Введите цифру'
    gets.chomp
  end

  def wrong
    puts 'Не правильный выбор команды'
  end

  def add_cards(var)
    puts "         -->> #{var}-->>"
    long_2
  end

  def bank(name1, bank1, name2, bank2, sum)
    puts " Счет #{name1}:(₽#{bank1})  ::  Cчет #{name2}:₽#{bank2}"
    puts "          На кону: ₽#{sum}"
  end

  def long_1
    sleep(1)
  end

  def long_2
    sleep(2)
  end

  def long_3
    sleep(3)
  end

  def open_cards(name1, vieu1, open1, name2, vieu2, open2)
    puts '             Итоги игры:'
    puts "      :: #{name1}: #{vieu1}  - очки: #{open1}
      :: #{name2}: #{vieu2}  - очки: #{open2} "
  end

  def error_message(mes)
    puts "Erorr: #{mes}"
  end

  def get_user
    gets.capitalize.chomp
  end

end
