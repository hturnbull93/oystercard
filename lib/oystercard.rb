class Oystercard
  attr_reader :balance, :limit
  CARD_LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @limit = CARD_LIMIT
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
end
