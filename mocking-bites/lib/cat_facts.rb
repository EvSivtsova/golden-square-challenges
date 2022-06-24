require 'json'

class CatFacts
  def initialize(requester)
    @requester = requester 
  end

  def provide
    response = get_cat_fact
    return "Cat fact: #{response["fact"]}"
  end

  private

  def get_cat_fact
    text_response = @requester.get(URI("https://catfact.ninja/fact"))
    return JSON.parse(text_response)
  end
end