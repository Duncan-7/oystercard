require 'journey'

describe Journey do
  let(:station) { double :station }
  let(:subject) { Journey.new(station, station) }

  it "has an entry station" do
    expect(subject.entry_station).to eq station
  end

  it "has an exit station" do
    expect(subject.exit_station).to eq station
  end

end