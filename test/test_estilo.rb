#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
# Test de la clase Estilo
#

require_relative "../src/estilo.rb"

["esCamelCase", "es_snake_case","sinestilo"].each do |palabra|

  puts "Palabra: #{palabra}"

  estilo = Estilo.extraer(palabra)

  puts estilo.inspect

  puts estilo

  puts

end
