require 'oystercard'

describe Oystercard do
  it "has a #balance" do
    expect(subject::balance).to eq 0
  end

  it "user can #top_up" do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it "#top_up adds money to card" do
    card = Oystercard.new
    card.top_up(5)
    expect(card::balance).to eq 5
  end
end
