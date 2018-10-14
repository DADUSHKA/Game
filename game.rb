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
    @user.open_cards
    @assailant.open_cards
    validate!
    opponent_move if @assailant.open_cards.to_i < 17
  end

  def add_cards
    @user.add_card
    opponent_move if @assailant.open_cards.to_i < 17
  end

  def control_lose
    user_lose if @assailant.open_cards_valid.to_i <= 21 && @user.open_cards_valid.to_i > 21 ||
      @assailant.open_cards_valid.to_i > @user.open_cards_valid.to_i &&
      @assailant.open_cards_valid.to_i <= 21 && @user.open_cards_valid.to_i < 21
  end

  def control_won
    user_won if @assailant.open_cards_valid.to_i > 21 && @user.open_cards_valid.to_i <= 21 ||
      @assailant.open_cards_valid.to_i < @user.open_cards_valid.to_i &&
      @assailant.open_cards_valid.to_i < 21 && @user.open_cards_valid.to_i <= 21
  end

  def control_dead_heat
    dead_heat if @assailant.open_cards_valid.to_i > 21 && @user.open_cards_valid.to_i > 21 ||
      @assailant.open_cards_valid.to_i == @user.open_cards_valid.to_i
  end

  private

  def start_bank
    @bank_assailant.bank_minus
    @bank_user.bank_minus
    @sum = 20
  end

  def opponent_move
    @assailant.add_card
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
    raise "#{@user.name} не может пропустить ход!" if @assailant.open_cards.to_i > 17
    raise "#{@user.name} не может пропустить ход!" if @assailant.on_hands.size == 3
  end
end
