class Bank
  attr_reader :bank_plus, :bank_minus, :bank

  def initialize
    @bank = 100
  end

  def bank_plus
    @bank += 10
   end

  def bank_minus
    @bank -= 10
    @bank = 100 if @bank == 0
  end
end
