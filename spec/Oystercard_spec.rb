require 'oystercard'

describe Oystercard do
  it "has a #balance" do
    expect(subject::balance).to eq 0
  end
  
  describe '#top_up' do
    it "user can #top_up" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    
    it "#top_up adds money to card" do
      card = Oystercard.new
      card.top_up(5)
      expect(card::balance).to eq 5
    end

    it "limits the customer to a max of £90" do
      expect{subject.top_up(91)}.to raise_error 'exceeded limit of £90!'
    end
    
    it "checks to see the limit is £90" do
      expect(subject::limit).to eq 90
    end
  end

  describe '#deduct' do
    it "#deduct fair from balance" do
      card = Oystercard.new
      card.top_up(5)
      card.deduct(5)
      expect(subject::balance).to eq 0
    end
  end

  describe '#in_journey?' do
    it 'it responds to #in_journey?' do
      expect(subject).to respond_to :in_journey?
    end
  
    it '#in_journey? returns false as default' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'it responds to #touch_in do' do
      expect(subject).to respond_to :touch_in
    end
  
    it 'when #touch_in #in_journey will return true' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in' do
    it 'it responds to #touch_out' do
      expect(subject).to respond_to :touch_out
    end
  
    it 'when #touch_out #in_journey will return false' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

  end
end
