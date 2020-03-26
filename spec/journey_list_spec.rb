require 'journey_list'

describe JourneyList do
  it '#start_journey responds' do
    expect(subject).to respond_to(:start_journey).with(1).argument
  end

  it '#stop_journey responds' do
    expect(subject).to respond_to(:stop_journey).with(1).argument
  end

  it '#journey_history responds' do
    expect(subject).to respond_to(:journey_history)
  end

  it '#journey_history is empty when journeylist is created' do
    expect(subject.journey_history).to be_empty
  end

  xit '#journey_history is contain a journey when a journey is completed' do
    bank = double(:bank)
    euston = double(:euston)
    journey_instance = double(:journey, entry_station: bank, exit_station: euston)
    journey_class = double(:journey_class, new: journey_instance)
    list = JourneyList.new(journey_class)

    list.start_journey(bank)
    list.stop_journey(euston)

    expect(list.journey_history).to eq [journey]
  end
end