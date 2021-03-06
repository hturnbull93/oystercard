require 'station.rb'

describe Station do

  subject() { described_class.new('Bank', 1) }

  it 'responds to #name' do
    expect(subject).to respond_to :name
  end

  it '#name returns its name' do
    expect(subject.name).to eq 'Bank'
  end

  it 'responds to #zone' do
    expect(subject).to respond_to :zone
  end

  it '#zone returns its zone' do
    expect(subject.zone).to eq 1
  end
end