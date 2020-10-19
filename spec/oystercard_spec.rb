require 'oystercard'

describe Oystercard do
  describe 'creating a new oystercard' do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end

  describe 'topping up our oystercard' do
    it "tops up our oyster card with the given amount" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it "raises an error when the maximum amount is exceeded" do
      expect{ subject.top_up(91) }.to raise_error("Maximum limit of £90 exceeded")
    end
  end

  describe "deducting money from our oystercard" do
    let (:subject) {Oystercard.new(30)}
    it 'deducts the given value from the oystercard' do
      subject.deduct(10)
      expect(subject.balance).to eq 20
    end
  end

  describe "#touch_in" do
    it "sets the user to in_journey" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end
  
  describe "#touch_out" do
    it "sets the user to not be in_journey" do
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end

  describe "#in_journey?" do
    it "returns true when user is in a journey" do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "returns false when user is not in a journey" do
      expect(subject).not_to be_in_journey
    end
  end
end
