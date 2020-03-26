require_relative 'journey'

class JourneyList
  attr_reader :journey_history, :current_journey

  def initialize(journey_class = Journey)
    @journey_history = []
    @current_journey = journey_class.new
    @journey_class = journey_class
    @in_journey = false
  end

  def start_journey(station)
    @current_journey = @journey_class.new
    @current_journey.entry_station = station
    @journey_history << @current_journey
    @in_journey = true
  end

  def stop_journey(station)
    @current_journey.exit_station = station
    @current_journey = @journey_class.new
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end