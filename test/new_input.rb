#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# text ruby to ser traduced to english
#

data = gets.chomp

result = data.to_i rescue nil

if result

  puts "result correcto"

else

  puts "argument erroneo"

end
