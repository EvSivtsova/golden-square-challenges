require 'greet.rb'

RSpec.describe "greet_method" do
    it "greets Joe" do
        result = greet("Joe")
        expect(result).to eq "Hello, Joe!"
    end
end