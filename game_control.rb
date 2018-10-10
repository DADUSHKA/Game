class GameControl

  attr_reader :welcome

  def initialize
    @message = GameAssist.new
    deck = Deck.new
    @pack_cards = Card.new(deck.deck_cards)
    @bank_assailant = Bank.new
    @bank_user = Bank.new
    welcome
  end

  def welcome
    @message.welcome
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
        first_command = @message.command
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
          option(@message.wrong)
        end
      rescue StandardError => e
        puts "Erorr: #{e.message}"
        retry
      end
    end
  end

  private

  def handing_over_cards
    @user.start_game
    @assailant.start_game
    @message.handing_over_cards(@user.name, @user.vieu_cards, @assailant.name)
    start_bank
  end

  def start_bank
    @bank_assailant.bank_minus
    @bank_user.bank_minus
    @sum = 20
    @message.bank(@user.name, @bank_user.bank, @assailant.name, @bank_assailant.bank, @sum)
  end

  def menu_game
    if @sum == 20
      @message.doing_one(@user.name)
    end

    if @sum.zero?
      @assailant.on_hands.clear
      @message.doing_two(@user.name)
    end
  end

  def option(menu_opt)
    menu_opt
    @message.pause
  end

  def scoring
    validate!
    @user.open_cards
    @assailant.open_cards
    opponent_move if @assailant.open_cards.to_i < 17 && @assailant.on_hands.size == 2
    @message.long_2
  end

  def add_cards
    @user.add_card
    @message.add_cards(@user.view)
    opponent_move if @assailant.open_cards.to_i < 17
    open_cards
  end

  def open_cards
    message_game
    @message.open_cards(@user.name, @user.vieu_cards, @user.open_cards_valid,
                        @assailant.name, @assailant.vieu_cards, @assailant.open_cards_valid)
    @message.bank(@user.name, @bank_user.bank, @assailant.name, @bank_assailant.bank, @sum)
  end

  def message_game
    message_lose
    message_won
    message_dead_heat
  end

  def message_lose
    you_lose if @assailant.open_cards_valid.to_i <= 21 && @user.open_cards_valid.to_i > 21
    you_lose if @assailant.open_cards_valid.to_i > @user.open_cards_valid.to_i &&
      @assailant.open_cards_valid.to_i <= 21 && @user.open_cards_valid.to_i < 21
  end

  def message_won
    you_won if @assailant.open_cards_valid.to_i > 21 && @user.open_cards_valid.to_i <= 21
    you_won if @assailant.open_cards_valid.to_i < @user.open_cards_valid.to_i &&
      @assailant.open_cards_valid.to_i < 21 && @user.open_cards_valid.to_i <= 21
  end

  def message_dead_heat
    dead_heat if @assailant.open_cards_valid.to_i > 21 && @user.open_cards_valid.to_i > 21
    dead_heat if @assailant.open_cards_valid.to_i == @user.open_cards_valid.to_i
  end

  def you_lose
    @message.you_lose
    @bank_user.bank
    @bank_assailant.bank_plus_two
    @sum = 0
  end

  def you_won
    @message.you_won

    @bank_user.bank_plus_two
    @bank_assailant.bank
    @sum = 0
  end

  def dead_heat
    @message.dead_heat

    @bank_user.bank_plus_one
    @bank_assailant.bank_plus_one
    @sum = 0
  end

  def opponent_move
    @message.opponent_move(@assailant.name)
    @assailant.add_card
  end

  def validate!
    raise  "#{@user.name} не может пропустить ход!" if @assailant.open_cards.to_i > 17
    raise "#{@user.name} не может пропустить ход!" if @assailant.on_hands.size == 3
  end

end
