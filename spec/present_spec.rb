require 'present.rb'

RSpec.describe Present do
  it "wraps and unwraps an object ('ring')" do
    present = Present.new
    present.wrap("ring")
    result = present.unwrap
    expect(result).to eq "ring"
  end

  context "when unwrapping an empty present" do
    it "fails" do
      present = Present.new
      expect { present.unwrap }.to raise_error "No contents have been wrapped."
    end
  end
  
  context "when wrapping the content twice" do
    it "fails" do
      present = Present.new
      present.wrap("ring_1")
      expect { present.wrap("ring_2") }.to raise_error "A contents has already been wrapped."
      expect(present.unwrap).to eq "ring_1"
    end
  end
end
