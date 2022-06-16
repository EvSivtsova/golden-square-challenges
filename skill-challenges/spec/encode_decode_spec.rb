require 'encode_decode.rb'

describe "encode and decode methods" do
  it "returns" do
    result = encode("theswiftfoxjumpedoverthelazydog", "secretkey")
    expect(result).to eq "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  end

  it "returns" do
    result = decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
    expect(result).to eq "theswiftfoxjumpedoverthelazydog"
  end
end