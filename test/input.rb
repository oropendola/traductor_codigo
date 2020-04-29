#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# texto ruby para ser traducido al ingles
#

dato = gets.chomp

resultado = dato.to_i rescue nil

if resultado

  puts "resultado correcto"

else

  puts "argumento erroneo"

end
