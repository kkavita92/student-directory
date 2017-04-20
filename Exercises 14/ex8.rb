#quine => programme that generates its own source code
f = File.open __FILE__
f.each_line do |line|
  puts line
f.close

#ALTERNATE METHOD 1:
p open(__FILE__).read # p is equivalent to puts argument.inspect

#ALTERNATE METHOD 2:
print IO.read(__FILE__)

#ALTERNATE METHOD 3:
puts <<e*2,'e' #example of HEREDOC which starts on line after << and ends when line starts with 'e'
puts <<e*2,'e' #HEREDOC works to make a large string literal
e 
