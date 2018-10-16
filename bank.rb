class Bank
  attr_reader :bank

  def initialize
    @bank = 100
  end

  def bank_plus(var)
    @bank += var
  end

  def bank_minus
    @bank -= 10
    @bank = 100 if @bank.zero?
  end
end
