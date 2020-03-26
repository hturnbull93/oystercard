require 'journey'

describe Journey do
  it 'has attribute entry_station' do
    expect(subject).to respond_to :entry_station
  end

  it 'has attribute exit_station' do
    expect(subject).to respond_to :exit_station
  end

  describe '#calculate_fare' do
    let(:bank) { double(:bank) }
    let(:embankment) { double(:embankment) }

    it 'responds' do
      expect(subject).to respond_to :calculate_fare
    end

    it 'returns the minimum fare if the journey is complete' do
      subject.entry_station = bank
      subject.exit_station = embankment
      expect(subject.calculate_fare).to eq(Oystercard::MINIMUM_FARE)
    end

    it 'returns the penalty fare if the journey is incomplete' do
      subject.entry_station = bank
      expect(subject.calculate_fare).to eq(Oystercard::PENALTY_FARE)
    end
  end
end