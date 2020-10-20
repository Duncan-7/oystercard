require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journeys = JourneyLog.new
  end

  def top_up(amount)
    new_balance = @balance + amount
    raise "Maximum limit of £#{MAXIMUM_LIMIT} exceeded" if new_balance > MAXIMUM_LIMIT

    @balance = new_balance
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < Journey.minimum_fare
    @journeys.start(entry_station)
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    end_journey(exit_station)
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  def end_journey(exit_station)
    journey = @journeys.present_journey
    @journeys.finish(exit_station)
    journey.calculate_fare
    deduct(journey.fare)
  end


  private
  def deduct(amount)
    @balance -= amount
  end
end
