def make_snippet (str)
  words = str.split(" ")
  if words.count <= 5
    return str
  else
    new_str = words[0..5].join(" ")+"..."
    return new_str
  end
end