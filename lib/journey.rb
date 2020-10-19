class Journey
  attr_reader :entry_station, :exit_station, :fare
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = calculate_fare
  end

  def calculate_fare
    return MINIMUM_FARE unless @entry_station == nil || @exit_station == nil
    return PENALTY_FARE
  end

  def self.minimum_fare
    MINIMUM_FARE
  end

end
