require_relative 'player'
require_relative 'user'
require_relative 'assailant'
require_relative 'bank'
require_relative 'deck'
require_relative 'card'
require_relative 'cards_on_hands'
require_relative 'game_assist'
require_relative 'game_control'

class Start

  def initialize
    GameControl.new
  end

end
 Start.new
