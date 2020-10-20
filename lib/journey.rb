class Journey
  attr_reader :entry_station, :fare
  attr_accessor :exit_station
  
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = nil
  end

  def calculate_fare
    return @fare = MINIMUM_FARE unless @entry_station == nil || @exit_station == nil
    @fare = PENALTY_FARE
  end

  def self.minimum_fare
    MINIMUM_FARE
  end

end
