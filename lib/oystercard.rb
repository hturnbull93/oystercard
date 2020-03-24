class Oystercard
  attr_reader :balance, :limit
  CARD_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @limit = CARD_LIMIT
    @in_journey = false
  end

  def top_up(money)
    if @balance + money > @limit
      raise 'exceeded limit of £90!'
    else
      @balance += money
    end
  end

  def deduct(fair)
    @balance - fair
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Balance under minimum amount to touch in' unless balance >= 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
