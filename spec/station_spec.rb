require 'station.rb'

describe Station do

  subject() { described_class.new('Bank', 1) }

  it 'responds to #name' do
    expect(subject).to respond_to :name
  end

  it 'responds to #zone' do
    expect(subject).to respond_to :zone
  end
end