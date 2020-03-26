require_relative 'oystercard'

class Journey
  def initialize
    @entry_station = nil
    @exit_station = nil
  end
  
  def in_journey?
    !!@entry_station
  end

  attr_accessor :entry_station, :exit_station

  def calculate_fare
    @entry_station.nil? || @exit_station.nil? ? Oystercard::PENALTY_FARE : Oystercard::MINIMUM_FARE
  end
end