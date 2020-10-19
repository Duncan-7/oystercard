class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    new_balance = @balance + amount
    raise "Maximum limit of £#{MAXIMUM_LIMIT} exceeded" if new_balance > MAXIMUM_LIMIT

    @balance = new_balance
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM_FARE

    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    @in_journey = false
    @balance -= MINIMUM_FARE
    @entry_station = nil
  end

  def in_journey?
    @in_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
