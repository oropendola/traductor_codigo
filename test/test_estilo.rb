#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-27
#
# Test de la clase Estilo
#

require_relative "../src/estilo.rb"

# Probar extraccion de estilo

["esCamelCase", "es_snake_case","sinestilo"].each do |palabra|

  puts "Palabra: #{palabra}"

  estilo = Estilo.extraer(palabra)

  puts estilo.inspect

  puts estilo

  puts

end

# Probar conversion camel/snake case 

estilo = Estilo.extraer("esCamelCase")

puts estilo

puts estilo.to_snake_case

puts

# Probar conversion snake/camel case 

estilo = Estilo.extraer("es_snake_case")

puts estilo

puts estilo.to_camel_case
