class User < Player
attr_reader :name

  def initialize(name = 'iuiu', deck)
    super
  end

  def view
    @on_hands.last.first
  end
end
