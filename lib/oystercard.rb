class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    new_balance = @balance + amount
    raise "Maximum limit of £#{MAXIMUM_LIMIT} exceeded" if new_balance > MAXIMUM_LIMIT

    @balance = new_balance
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM_FARE

    @entry_station = entry_station

  end

  def touch_out(exit_station)
    @balance -= MINIMUM_FARE
    @journeys << {entry: @entry_station, exit: exit_station}
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
