#!/cygdrive/c/Ruby24-x64/bin/ruby -w
#
# @ Javier Felipe Toribio 2020-04-21
#
# Test del paquete extension
#

require_relative '../src/analizadorextension'

fichero = "hola.rb"

lenguaje = AnalizadorExtension.lenguaje(fichero)

puts lenguaje.nombre


# vim: set nu:tw=79
