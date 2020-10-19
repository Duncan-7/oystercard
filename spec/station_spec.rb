require 'station'

describe Station do
  let(:subject) { Station.new("Test Station", 1) }

  it "has an accessible name variable" do
    expect(subject.name).to eq "Test Station"
  end

  it "has an accessible zone variable" do
    expect(subject.zone).to eq 1
  end
end