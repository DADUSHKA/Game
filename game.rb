require_relative 'player_assist'
require_relative 'assailant'
require_relative 'bank'
require_relative 'card_deck'
require_relative 'game_assist'
require_relative 'user'

class GameControl
  include GameAssist

  attr_reader :user, :assailant, :welcome

  def initialize
    @pack_cards = CardDeck.new
    @bank_assailant = Bank.new
    @bank_user = Bank.new
    welcome
  end

  def welcome
    puts "Приветствую Вас в игре BlackJack! \n
        Чтобы начать игру введите Ваше имя:"
    name = gets.capitalize.chomp
    fail "Вы не ввели имя игрока" if name.empty?
    fail "Слишком короткое имя" if name.length < 3
    @user = User.new(name, @pack_cards)
    @assailant = Assailant.new(@pack_cards)
    handing_over_cards
    control_game
  rescue StandardError => e
    puts "Erorr: #{e.message}"
    retry
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
          option(scoring)
        when '2'
          option(add_cards)
        when '3'
          option(open_cards)
        when '4'
          option(handing_over_cards)
        else
          option(wrong)
        end
      rescue StandardError => e
        puts "Erorr: #{e.message}"
        retry
      end
    end
  end

  def menu_game
    if @sum == 20
      puts "  Ваши #{@user.name} действия :
              1 - Пропустить ход
              2 - Добавить карту
              3 - Открыть карты"
    end

    if @sum.zero?
      @assailant.on_hands.clear
      puts "  Ваши #{@user.name} действия :
              4 - Продолжить игру
              9 - Выйти"
    end
  end

  private

  def option(menu_opt)
    menu_opt
    pause
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
    raise  "#{@user.name} не может пропустить ход!" if @assailant.open_cards.to_i > 17
    raise "#{@user.name} не может пропустить ход!" if @assailant.on_hands.size == 3
  end

end

 GameControl.new
