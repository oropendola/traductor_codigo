#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# text ruby to be traduced to english
#

class ResultRight
end

class ArgumentWrong
end

data = gets.chomp

result = data.to_i rescue nil

if result

  puts "result right"

else

  puts "argument wrong"

end

data_result_right = 1

