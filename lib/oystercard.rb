class Oystercard
  attr_reader :balance
  MAXIMUM_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    new_balance = @balance + amount
    raise "Maximum limit exceeded" if new_balance > MAXIMUM_LIMIT
    @balance = new_balance
  end

end
