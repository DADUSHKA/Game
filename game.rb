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
    @koloda = CardDeck.new
    @assailant = Assailant.new(@koloda)
    @bank_assailant = Bank.new
    @bank_user = Bank.new
    welcome
  end

  def welcome
    puts "Приветствую Вас в игре BlackJack
        чтобы начать игру введите Ваше имя:"
    name = gets.capitalize.chomp
    @user = User.new(name, @koloda)
    method_name
  end

  def handing_over_cards
    @user.start_game
    @assailant.start_game
    puts '        -->> Сдача карт:'
    puts
    puts "      :: #{@user.name}: #{@user.vieu_cards}   ::     #{@assailant.name}: ☺ ? #{@assailant.vieu_cards}"
  end

  def method_name
    catch :exit do
      loop do
        handing_over_cards
        main_menu
        first_command = command
        throw :exit if first_command == '9'
        case first_command
        when '1'
          option(scoring)
        when '2'
          option(dobavit_karty)
        when '3'
          option(otkrit_karti)
        else
          option(wrong)
        end
      end
    end
  end

  def main_menu
    puts "Ваши #{@user.name} действия :
          1 - Пропустить
          2 - Добавить карту
          3 - Открыть карты
          9 - Выйти"
  end

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

  def propustit; end
end

GameControl.new
