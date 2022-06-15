def check_grammar(str)
  fail "No sentence provided." if str.empty?
  symbols = [".", "!", "?"]
  if str[0] == str[0].capitalize && symbols.include?(str[-1])
    true
  else
   false
  end
end