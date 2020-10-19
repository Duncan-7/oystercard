require 'journey'

describe Journey do
  let(:station) { double :station }
  let(:subject) { Journey.new(station, station) }

  describe "test_intialize" do
    it "has an entry station" do
      expect(subject.entry_station).to eq station
    end

    it "has an exit station" do
      expect(subject.exit_station).to eq station
    end
  end

  describe "fare" do
    it 'returns the minimum fare when entry and exit stations are given' do
      #subject.calculate_fare
      expect(subject.fare).to eq 1
    end

    it 'reutrns the penalty fare if either entry or exit stations are missing' do
      incomplete_journey = Journey.new(station, nil)
      #incomplete_journey.calculate_fare
      expect(incomplete_journey.fare).to eq 6
    end
  end

end
