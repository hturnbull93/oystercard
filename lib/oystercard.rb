class Oystercard
  attr_reader :balance, :limit, :entry_station
  CARD_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_TO_TRAVEL = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = STARTING_BALANCE
    @limit = CARD_LIMIT
    @in_journey = false
  end

  def top_up(money)
    raise 'exceeded limit of £90!' if exceed_limit?(money)
    @balance += money
  end

  def in_journey?
    true if entry_station
  end

  def touch_in(station)
    raise 'Balance under minimum amount to touch in' if under_minimum_balance?
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
    @entry_station = nil
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
