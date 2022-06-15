def reading_time(str)
  words_per_minute = 200
  words_per_second = words_per_minute / 60.00
  text = str.split(" ").count
  time = (text / words_per_second).round
  if time < 60
    return "#{time} sec" 
  else
    time >= 60
    seconds = time % 60
    minutes = (time - seconds) / 60
    return "#{minutes} min #{seconds} sec"
  end
end    