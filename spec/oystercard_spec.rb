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
      expect{ subject.top_up(91) }.to raise_error("Maximum limit exceeded")
    end
  end


end
