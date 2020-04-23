#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-21
#
# Test del paquete extension
#

require_relative '../src/analizadorextension'

fichero = "hola.rb"

lenguaje = AnalizadorExtension.lenguaje(fichero)

puts lenguaje.nombre



