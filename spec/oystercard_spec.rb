require 'oystercard'

describe Oystercard do
  describe 'creating a new oystercard' do
    it "has a balance of 0 by default" do
      expect(subject.balance).to eq(0)
    end
  end
end