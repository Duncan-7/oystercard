require 'oystercard'

describe Oystercard do
  let (:subject) {Oystercard.new(30)}
  let (:entry_station) { double :entry_station }

  describe 'creating a new oystercard' do
    it "has a balance of 0 by default" do
      expect(Oystercard.new.balance).to eq(0)
    end
  end

  describe 'topping up our oystercard' do
    it "tops up our oyster card with the given amount" do
      subject.top_up(10)
      expect(subject.balance).to eq 40
    end

    it "raises an error when the maximum amount is exceeded" do
      expect{ subject.top_up(61) }.to raise_error("Maximum limit of £90 exceeded")
    end
  end

  # describe "deducting money from our oystercard" do
  #   it 'deducts the given value from the oystercard' do
  #     subject.deduct(10)
  #     expect(subject.balance).to eq 20
  #   end
  # end

  describe "#touch_in" do
    it "sets the user to in_journey" do
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it "raises an error if the user can't afford a single journey" do
      oystercard = Oystercard.new
      expect { oystercard.touch_in(entry_station) }.to raise_error("Insufficient funds")
    end

    it 'records the entry station' do
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  describe "#touch_out" do
    it "sets the user to not be in_journey" do
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject).to_not be_in_journey
    end

    it "deducts the minimum fare from a users card at the end of a journey" do
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end

    it "removed the entry_station when touching_out" do
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe "#in_journey?" do
    it "returns true when user is in a journey" do
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it "returns false when user is not in a journey" do
      expect(subject).not_to be_in_journey
    end
  end
end
