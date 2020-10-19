class Oystercard
  attr_reader :balance, :MAXIMUM_LIMIT

  MAXIMUM_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    new_balance = @balance + amount
    raise "Maximum limit of £#{MAXIMUM_LIMIT} exceeded" if new_balance > MAXIMUM_LIMIT
    @balance = new_balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
