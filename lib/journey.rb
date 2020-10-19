class Journey
  attr_reader :entry_station, :exit_station, :fare

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @fare = nil
  end
end