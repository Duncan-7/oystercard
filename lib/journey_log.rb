require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :present_journey, :journeys

  def initialize
    @journeys = []
    @journey_class = Journey
    @present_journey = nil
  end

  def start(entry_station)
    @present_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    journey = current_journey
    journey.exit_station = exit_station
    @present_journey = journey
  end

  def complete_journey
    @journeys << @present_journey
    @present_journey = nil
  end

  private
  def current_journey
    @present_journey || Journey.new
  end
end