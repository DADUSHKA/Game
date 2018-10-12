class TerminalInterface
  def initialize(game)
    @game = game
    welcome
  end

  private

  def welcome
    @game.welcome
    @name = gets.capitalize.chomp
    validate!
    @game.create_players(@name)
    @game.handing_over_cards
    control_game
  rescue StandardError => e
    @game.error_message(e.message)
    retry
  end

  def control_game
    catch :exit do
      loop do
        puts '---------------'
        @game.menu_game
        first_command = @game.command
        throw :exit if first_command == '9'
        case first_command
        when '1'
          option(@game.scoring)
        when '2'
          option(@game.add_cards)
        when '3'
          option(@game.open_cards)
        when '4'
          option(@game.handing_over_cards)
        else
          option(@game.wrong)
        end
      rescue StandardError => e
        @game.error_message(e.message)
        retry
      end
    end
  end

  def option(menu_opt)
    menu_opt
    @game.pause
  end

  def validate!
    raise "Вы не ввели имя игрока" if @name.empty?
    raise "Слишком короткое имя" if@name.length < 3
  end
end
