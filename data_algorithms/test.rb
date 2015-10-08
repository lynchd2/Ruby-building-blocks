1.upto(100).each do |x|
  string = ""
  string << 'fizz' if x % 3 == 0 || string << 'buzz' if x % 5 == 0
  p string
end
