require 'say_hello.rb'

describe "say_hello method" do
  it "return 'hello kay" do
    result = say_hello("kay")
    expect(result).to eq "hello kay"
  end
end