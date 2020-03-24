class Oystercard
  attr_reader :balance, :limit, :entry_station, :journey_history
  CARD_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_TO_TRAVEL = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = STARTING_BALANCE
    @limit = CARD_LIMIT
    @entry_station = nil
    @journey_history = {}
  end

  def top_up(money)
    raise 'exceeded limit of £90!' if exceed_limit?(money)
    @balance += money
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    raise 'Balance under minimum amount to touch in' if under_minimum_balance?
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    record_journey(exit_station)
    @entry_station = nil
  end

  private

  def record_journey(exit_station)
    @journey_history = {
      entry: entry_station,
      exit: exit_station
    }
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
