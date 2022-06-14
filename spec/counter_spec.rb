require 'counter.rb'

describe Counter do
    it "adds 3 to the counter and returns 3" do
      counter = Counter.new
      counter.add(3)  
      result = counter.report()
      expect(result).to eq "Counted to 3 so far."
    end

    it "adds 3, 5 and 8 to the counter and returns 16" do
        counter = Counter.new
        counter.add(3)
        counter.add(5)
        counter.add(8)
        result = counter.report()
        expect(result).to eq "Counted to 16 so far."
    end

    it "adds -3 and -1 to the counter and returns -4" do
        counter = Counter.new
        counter.add(-3)
        counter.add(-1)
        result = counter.report()
        expect(result).to eq "Counted to -4 so far."
    end
end

