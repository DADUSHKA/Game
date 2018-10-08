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

    @bank_assailant = Bank.new
    @bank_user = Bank.new
    welcome
  end

  def welcome
    puts "Приветствую Вас в игре BlackJack
        чтобы начать игру введите Ваше имя:"
    name = gets.capitalize.chomp
    @user = User.new(name, @koloda)
    @assailant = Assailant.new(@koloda)
    handing_over_cards
  end

  def handing_over_cards
    @user.start_game
    @assailant.start_game

    puts '⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂'
    puts '        -->> Сдача карт:'
    long
    puts
    puts "       :: #{@user.name}: #{@user.vieu_cards}    ::     #{@assailant.name}: ☺, ☺ ? #{@assailant.vieu_cards}"
    puts
    puts '          ! Карты сданы.'
    puts '--------------'
    start_bank
    method_name
  end

  def method_name
    catch :exit do
      loop do
        puts '⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂⁂'
        puts '          Игра'
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
        when '4'
          option(handing_over_cards)
        else
          option(wrong)
        end
      end
    end
  end

  def main_menu
    if @sum == 20
      puts "  Ваши #{@user.name} действия :
              1 - Пропустить ход
              2 - Добавить карту
              3 - Открыть карты"

    end

    if @sum == 0

      puts "  Ваши #{@user.name} действия :
              4 - Продолжить игру
              9 - Выйти"


    end
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

def long
  sleep(3)
end

def get_get
 gets
end

end

GameControl.new
