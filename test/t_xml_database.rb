#!/cygdrive/c/Ruby24-x64/bin/ruby -w
#
# @ Javier Felipe Toribio 2020-04-24
#
# Test de acceso y consultar a la base de datos XML
#
#

require_relative '../db/xmlbasedatos'

bd = XMLBaseDatos.new('../db/ingles_espanol.html')

palabras = ['ayuda','noexiste']

palabras.each do |palabra|

  puts "#{palabra} => #{bd.buscar(palabra)}"

end


