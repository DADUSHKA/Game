class TerminalInterface
  def initialize(game)
    @game = game
    welcome
  end

  private

  def welcome
    welcome_message
    @name = gets.capitalize.chomp
    validate!
    @game.create_players(@name)
    play_game
  rescue StandardError => e
    puts "Ошибка: #{e.message}"
    retry
  end

  def play_game
    @game.handing_over_cards
    handing_over_cards
    bank
    control_game
  end

  def skip_stroke
    opponent_move if @game.assailant.counting_point_validate < 17
    @game.skip_stroke
    bank
  end

  def add_card
    opponent_move if @game.assailant.counting_point_validate < 17
    @game.add_cards
    add_cards
    open_cards
  end

  def open_cards
    check_game
    game_results
    bank
  end

  def control_game
    catch :exit do
      loop do
        puts '---------------'
        menu_game
        first_command = command
        throw :exit if first_command == '9'
        case first_command
        when '1'
          option(skip_stroke)
        when '2'
          option(add_card)
        when '3'
          option(open_cards)
        when '4'
          option(play_game)
        else
          option(wrong)
        end
      rescue StandardError => e
        puts "Ошибка: #{e.message}"
        retry
      end
    end
  end

  def check_game
    you_lose if @game.control_lose
    you_won if @game.control_won
    dead_heat if @game.control_dead_heat
  end

  def option(menu_opt)
    menu_opt
    pause
  end

  def welcome_message
    puts "Приветствую Вас в игре BlackJack! \n
        Чтобы начать игру введите Ваше имя:"
  end

  def menu_game
    if @game.sum == 20
      puts "  Ваши #{@game.user.name} действия :
              1 - Пропустить ход
              2 - Добавить карту
              3 - Открыть карты"
    else
      puts "  Ваши #{@game.user.name} действия :
              4 - Продолжить игру
              9 - Выйти"
    end
  end

  def game_results
    puts '             Итоги игры:'
    puts "      :: #{@game.user.name}: #{@game.user.view_cards}  - очки: #{@game.user.counting_point_validate}
      :: #{@game.assailant.name}: #{@game.assailant.view_cards}  - очки: #{@game.assailant.counting_point_validate} "
  end

  def bank
    puts " Счет #{@game.user.name}:₽#{@game.bank_user.bank}  ::  Cчет #{@game.assailant.name}:₽#{@game.bank_assailant.bank}"
    puts "          На кону: ₽#{@game.sum}"
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

  def opponent_move
    puts "  -->> Ход #{@game.assailant.name}--> ☺ -->  "
    long_2
  end

  def handing_over_cards
    puts " #{@game.user.name}, игра началась!"
    long_1
    puts '        -->> Раздача карт-->>'
    long_3
    puts
    puts "          ! Карты розданы. !\n         :: #{@game.user.name}: #{@game.user.view_cards}
         :: #{@game.assailant.name}: ☺ , ☺ ?"
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

  def add_cards
    puts "         -->>Ход: #{@game.user.name} -->> ☺ -->>"
    long_2
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

  def validate!
    raise "Вы не ввели имя игрока" if @name.empty?
    raise "Слишком короткое имя" if@name.length < 3
  end
end
