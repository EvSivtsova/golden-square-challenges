require "cat_facts"

describe CatFacts do
  it "calls an API to return a fact about cats in a required format" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get)
        .with(URI("https://catfact.ninja/fact"))
        .and_return('{"fact":"On average, a cat will sleep for 16 hours a day.","length":48}')
    cat_fact = CatFacts.new(fake_requester)
    result = cat_fact.provide
    expect(result).to eq "Cat fact: On average, a cat will sleep for 16 hours a day."
  end   
end