#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-04-29
#
# Test clase traduccion
#
#

require_relative "../src/traduccion"

idioma_origen = "espanol"

idioma_destino = "ingles"

fichero_codigo_fuente = "input.rb"

traduccion = Traduccion.new(idioma_origen,idioma_destino,fichero_codigo_fuente)

traduccion.convertir

traduccion.grabar

puts traduccion.resultado

