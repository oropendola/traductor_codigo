#!/cygdrive/c/Ruby24-x64/bin/ruby -w
#
# @ Javier Felipe Toribio 2018
#
# Programa principal de la applicacion traductor
#

require_relative 'argumentoserroneos'

require_relative 'validacion'

require_relative 'aplicacion'

#======================================================================
# MAIN PROGRAM
#======================================================================

begin

  Validacion.valida_argumentos

  Aplicacion.procesar

rescue ArgumentosErroneos => error

   puts error

end

# vim: tw=79:ts=2:
