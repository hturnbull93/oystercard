class Oystercard
  attr_reader :balance, :limit
  CARD_LIMIT = 90
  STARTING_BALANCE = 0
  MINIMUM_TO_TRAVEL = 1

  def initialize
    @balance = STARTING_BALANCE
    @limit = CARD_LIMIT
    @in_journey = false
  end

  def top_up(money)
    raise 'exceeded limit of £90!' if exceed_limit?(money)
    @balance += money
  end

  def deduct(fair)
    @balance - fair
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Balance under minimum amount to touch in' if under_minimum_balance?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def under_minimum_balance?
    balance < MINIMUM_TO_TRAVEL
  end

  def exceed_limit?(money)
    balance + money > limit
  end
end
