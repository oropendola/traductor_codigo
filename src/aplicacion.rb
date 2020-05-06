#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2020-05-06
#
# Procesa los ficheros del input
#

require_relative "traduccion"

require_relative "../config/configuracion"

class Aplicacion

  SEPARADOR = '-'*49

  def self.procesar

    origen,destino = Configuracion.traduccion.first

    ARGV.each do |fichero|

      puts SEPARADOR
      puts "Inicio de conversion de fichero '#{fichero}'"
      puts SEPARADOR

      trad = Traduccion.new(origen,destino,fichero)

      trad.convertir

      trad.grabar

      puts SEPARADOR
      puts "Fin de conversion de fichero '#{fichero}'"
      puts SEPARADOR

    end

  end

end
