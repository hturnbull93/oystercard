require_relative 'journey'

class JourneyList
  attr_reader :journey_history

  def initialize(journey_class = Journey)
    @journey_history = []
    @current_journey = nil
    @journey_class = journey_class
  end

  def start_journey(station)
    @current_journey = @journey_class.new
    @current_journey.entry_station = station
  end

  def stop_journey(station)
    @current_journey.exit_station = station
    @journey_history << @current_journey
  end
end