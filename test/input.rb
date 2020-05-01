#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# texto ruby para ser traducido al ingles
#

class ResultadoCorrecto
end

class ArgumentoErroneo
end

dato = gets.chomp

resultado = dato.to_i rescue nil

if resultado

  puts "resultado correcto"

else

  puts "argumento erroneo"

end

dato_resultado_correcto=1
