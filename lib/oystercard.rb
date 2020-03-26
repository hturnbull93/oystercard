require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :limit
  CARD_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_TO_TRAVEL = 1

  def initialize
    @balance = STARTING_BALANCE
    @limit = CARD_LIMIT
    @journey_list = JourneyList.new
  end

  def top_up(money)
    raise 'exceeded limit of £90!' if exceed_limit?(money)
    @balance += money
  end

  def in_journey?
    !!@journey_list.in_journey?
  end

  def touch_in(station)
    raise 'Balance under minimum amount to touch in' if under_minimum_balance?
    deduct(Journey::PENALTY_FARE) if @journey_list.in_journey?
    @journey_list.start_journey(station)
  end

  def touch_out(station)
    if !@journey_list.in_journey?
      deduct(Journey::PENALTY_FARE)
      return
    end
    deduct(@journey_list.current_journey.calculate_fare)
    @journey_list.stop_journey(station)
  end

  private

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
