def track_tasks(str)
   fail "No text provided." if str.empty?
   return str.include?("#TODO")
end 