require_relative 'player'
require_relative 'user'
require_relative 'assailant'
require_relative 'bank'
require_relative 'deck'
require_relative 'card'
require_relative 'cards_on_hands'
require_relative 'message'
require_relative 'terminal'
require_relative 'game'

class BlackJack
  def initialize
    game = Game.new
    TerminalInterface.new(game)
  end
end
BlackJack.new
