require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :limit, :journey_history
  CARD_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_TO_TRAVEL = 1
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = STARTING_BALANCE
    @limit = CARD_LIMIT
    @journey_history = []
  end

  def top_up(money)
    raise 'exceeded limit of £90!' if exceed_limit?(money)
    @balance += money
  end

  def in_journey?
    !!@current_journey
  end

  def touch_in(station)
    raise 'Balance under minimum amount to touch in' if under_minimum_balance?
    deduct(PENALTY_FARE) if !@current_journey.nil?

    @current_journey = Journey.new
    @current_journey.entry_station = station
  end

  def touch_out(station)
    deduct(PENALTY_FARE) and return if @current_journey.nil?

    @current_journey.exit_station = station
    deduct(@current_journey.calculate_fare)
    record_journey
  end

  private

  def record_journey
    @journey_history << @current_journey
    @current_journey = nil
  end

  def deduct(fare)
    @balance -= fare
  end

  def under_minimum_balance?
    balance < MINIMUM_TO_TRAVEL
  end

  def exceed_limit?(money)
    balance + money > limit
  end

end
