require 'oystercard'

describe Oystercard do

  let(:station) { double :station }
  let(:bank) {double :bank}
  let(:embankment) { double :embankment }

  it "has a #balance" do
    expect(subject::balance).to eq 0
  end

  describe '#top_up' do
    before(:each) do
      subject.top_up(5)
    end

    it "user can #top_up" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "#top_up adds money to card" do
      expect(subject.balance).to eq 5
    end

    it "limits the customer to a max of £90" do
      expect{subject.top_up(91)}.to raise_error 'exceeded limit of £90!'
    end

    it "checks to see the limit is £90" do
      expect(subject::limit).to eq 90
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
    before(:each) do
      subject.top_up(5)
    end

    it 'it responds to #touch_in do' do
      expect(subject).to respond_to :touch_in
    end

    it 'when #touch_in #in_journey will return true' do
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#touch_in with no money' do
    it 'will raise an error if attempting to touch in with less than minimum amount on balance' do
      expect { subject.touch_in(station) }.to raise_error 'Balance under minimum amount to touch in'
    end
  end

  describe '#touch_out' do
    before(:each) do
      subject.top_up(5)
    end

    it 'it responds to #touch_out' do
      expect(subject).to respond_to :touch_out
    end

    it 'when #touch_out #in_journey will return false' do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to eq false
    end

    it 'deducts the fair from balance' do
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
    end
  end

  describe 'journey_history' do
    before(:each) do
      subject.top_up(5)
    end

    it 'is empty by default' do
      expect(subject.journey_history).to eq([])
    end
  end


  describe 'feature test: bank to embankment' do
    before(:each) do
      subject.top_up(5)
      subject.touch_in(bank)
      subject.touch_out(embankment)
    end
    it "#journey_history has a Journey stored" do
      expect(subject.journey_history).to include(a_kind_of(Journey)) 
    end
    it "the stored Journey start station is Bank" do
      expect(subject.journey_history[0].entry_station).to be bank
    end
    it "the stored Journey exit station is Embankment" do
      expect(subject.journey_history[0].exit_station).to be embankment
    end
  end
end
