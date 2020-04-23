#!/cygdrive/c/Ruby24-x64/bin/ruby
#
# @ Javier Felipe Toribio 2018
#
# Programa principal de la applicacion traductor
#

require_relative 'argumentoserroneos.rb'

class Aplicacion

  def self.ayuda

     return <<-EOF

       Uso #{$PROGRAM_NAME} [ -h | --help ]

     EOF

  end

  def self.valida_argumentos

    raise ArgumentosErroneos.new("Numero incorrecto de argumentos") if ARGV.length > 1

    if ARGV.length == 1

      raise ArgumentosErroneos.new("Argumento desconocido #{ARGV[0]}") if ARGV[0] != "-h" && ARGV[0] != "--help"

      puts self.ayuda

   end

  end

end


#=================================================
# MAIN PROGRAM
#=================================================

begin

  Aplicacion.valida_argumentos()

rescue ArgumentosErroneos => e

   puts e

end




