class GrammarStats
    def initialize
      @count = 0
      @correct_texts = 0
    end
  
    def check?(text)
      fail "Please write a sentence." if text.empty?
      @count += 1
      if (text[0] == text[0].upcase) && ([".", "!", "?"].include?(text[-1]))
        @correct_texts += 1
        return true
      else
        return false
      end
    end
  
    def percentage_good
      fail "We haven't checked any texts yet." if @count == 0
      (@correct_texts / @count.to_f * 100).round()
    end
end