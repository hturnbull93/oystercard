require 'journey_list'

describe JourneyList do

  let(:bank) { double(:bank) }
  let(:euston) { double(:euston) }

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
  
  it '#journey_history contains a journey when a journey is started' do
    journey_inst_dbl = double(:journey, :entry_station= => "whatever")
    journey_class_dbl = double(:Journey, new: journey_inst_dbl)
    list = JourneyList.new(journey_class_dbl)
    
    list.start_journey(bank)
    expect(list.journey_history).to include(journey_inst_dbl)
  end
  
    it '#journey_history contains journey with exit station set when completed' do
      journey_inst_dbl = double(:journey, :entry_station= => nil, :exit_station= => nil, :exit_station => euston)
      journey_class_dbl = double(:Journey, new: journey_inst_dbl)
      list = JourneyList.new(journey_class_dbl)
  
      list.start_journey(bank)
      list.stop_journey(euston)
  
      expect(list.journey_history[0].exit_station).to eq euston
    end
end