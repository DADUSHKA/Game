class Game
  attr_reader :user, :assailant, :bank_user, :bank_assailant, :sum

  def initialize
    @deck = Deck.new
    @bank_assailant = Bank.new
    @bank_user = Bank.new
  end

  def create_players(user)
    name = user
    @user = User.new(@deck, name)
    @assailant = Assailant.new(@deck)
  end

  def handing_over_cards
    @user.start_game
    @assailant.start_game
    start_bank
  end

  def skip_stroke
    @user.counting_point
    @assailant.counting_point
    validate!
    opponent_move if @assailant.counting_point_validate < 17
  end

  def add_cards
    @user.add_card(1)
    opponent_move if @assailant.counting_point_validate < 17 && @assailant.hands.size == 2
  end

  def control_lose
    user_lose if @assailant.counting_point_validate <= 21 && @user.counting_point_validate > 21 ||
                 @assailant.counting_point_validate > @user.counting_point_validate &&
                 @assailant.counting_point_validate <= 21 && @user.counting_point_validate < 21
  end

  def control_won
    user_won if @assailant.counting_point_validate > 21 && @user.counting_point_validate <= 21 ||
                @assailant.counting_point_validate < @user.counting_point_validate &&
                @assailant.counting_point_validate < 21 && @user.counting_point_validate <= 21
  end

  def control_dead_heat
    dead_heat if @assailant.counting_point_validate > 21 && @user.counting_point_validate > 21 ||
                 @assailant.counting_point_validate == @user.counting_point_validate
  end

  private

  def start_bank
    @bank_assailant.bank_minus
    @bank_user.bank_minus
    @sum = 20
  end

  def opponent_move
    @assailant.add_card(1)
  end

  def user_lose
    @bank_user.bank
    @bank_assailant.bank_plus_two
    @sum = 0
  end

  def user_won
    @bank_user.bank_plus_two
    @bank_assailant.bank
    @sum = 0
  end

  def dead_heat
    @bank_user.bank_plus_one
    @bank_assailant.bank_plus_one
    @sum = 0
  end

  def validate!
    raise "#{@user.name} не может пропустить ход!" if @assailant.counting_point_validate > 17
    raise "#{@user.name} не может пропустить ход!" if @assailant.hands.size == 3
  end
end
