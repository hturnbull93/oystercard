require 'journey'

describe Journey do
  it 'has attribute entry_station' do
    expect(subject).to respond_to :entry_station
  end

  it 'has attribute exit_station' do
    expect(subject).to respond_to :exit_station
  end

  describe '#calculate_fare' do
    it 'responds' do
      expect(subject).to respond_to :calculate_fare
    end
  end
end