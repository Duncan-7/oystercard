require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }

  describe "#initialize" do
    it "has a journey_class attribute that stores a reference to the Journey Class" do
      expect(subject.journey_class).to eq(Journey)
    end
  end

  describe "#start" do
    before(:each) { subject.start(station) }

    it "should start a new journey when passed an entry station" do
      expect(subject.present_journey).not_to eq(nil)
    end

    it "should save that entry station to an instance of Journey" do
      expect(subject.present_journey.entry_station).to eq station
    end
  end

  describe "#finish" do
    before(:each) do 
      subject.start(station)
      subject.finish(station)
    end

    it "saves the completed journey to the journeys array" do
      expect(subject.journeys.last).to be_instance_of Journey
    end

    it "adds an exit station to the saved journey" do
      expect(subject.journeys.last.exit_station).to eq station
    end

    it "sets the present_journey back to nil" do
      expect(subject.present_journey).to eq nil
    end

    it "ends journey and charges penalty fare if no exit station passed" do
      subject.start(station)
      subject.finish()
      expect(subject.journeys.last.fare).to eq 6
    end
  end
end