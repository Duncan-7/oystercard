require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }

  describe "#initialize" do
    it "has a journey_class attribute that stores a reference to the Journey Class" do
      expect(subject.journey_class).to eq(Journey)
    end
  end

  describe "#start" do
    it "should start a new journey with an entry station" do
      subject.start(station)
      expect(subject.present_journey).not_to eq(nil)
    end
  end

  describe "#finish" do
    it "adds an exit station to the current_journey" do
      
    end
  end
end