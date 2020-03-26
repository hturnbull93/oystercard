require_relative 'oystercard'

class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  attr_accessor :entry_station, :exit_station

  def calculate_fare
    @entry_station.nil? || @exit_station.nil? ? PENALTY_FARE : MINIMUM_FARE
  end
end